//
//  SBRootViewController.m
//  SimpleBook
//
//  Created by Simon Ren on 1/6/13.
//  Copyright (c) 2013 MySelf Inc. All rights reserved.
//

#import "SBRootViewController.h"

#import "SBModelController.h"

#import "SBDataViewController.h"

#import "MWPhotoBrowser.h"

SBRootViewController *theRootViewController = nil;
UIPageViewController *thePageViewController = nil;
MWPhotoBrowser *thePhotoBrowser = nil;

@interface SBRootViewController ()
@property (readonly, strong, nonatomic) SBModelController *modelController;
@end

@implementation SBRootViewController

@synthesize pageViewController = _pageViewController;
@synthesize modelController = _modelController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) fadeOut:(int)page {
    [UIView animateWithDuration:0.2
                          delay:0.1
                        options:UIViewAnimationCurveLinear
                     animations:^{ [[[self pageViewController] view] setAlpha:0.0f]; }
                     completion:^(BOOL finished) {
                         [self pageGoto:page];
                         [self fadeIn];
                     }];
}

- (void) fadeIn {
    [UIView animateWithDuration:0.2
                          delay:0.1
                        options:UIViewAnimationCurveLinear
                     animations:^{[[[self pageViewController] view] setAlpha:1.0f];}
                     completion:^(BOOL finished) {}];
}

- (void)pageGoto:(int)page {

    NSUInteger pageToGoTo = page;

    SBDataViewController* theCurrentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    NSUInteger retrievedIndex = [self.modelController indexOfViewController:theCurrentViewController];

    SBDataViewController *prePageViewController = [self.modelController viewControllerAtIndex:(pageToGoTo - 2) storyboard:self.storyboard];
    SBDataViewController *targetPageViewController = [self.modelController viewControllerAtIndex:(pageToGoTo - 1) storyboard:self.storyboard];
    SBDataViewController *nextPageViewController = [self.modelController viewControllerAtIndex:(pageToGoTo) storyboard:self.storyboard];

    // 到了cover2，就删除cover1
    if ([targetPageViewController.dataObject isEqual: @"book.cover.0002"]) {
        [self.modelController removeCover1];
    }
    
    NSArray* preViewControllers = [NSArray arrayWithObjects:prePageViewController, nil];
    
    NSArray* theViewControllers = nil;
    theViewControllers = [NSArray arrayWithObjects:targetPageViewController, nil];
    
    NSArray* nextViewControllers = [NSArray arrayWithObjects:nextPageViewController, nil];

    if (retrievedIndex < (pageToGoTo - 1) && retrievedIndex != (pageToGoTo - 1)) {
        
        if ([preViewControllers count] >= 1) {
            [self.pageViewController setViewControllers:preViewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
        }
        [self.pageViewController setViewControllers:theViewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    }

    if (retrievedIndex > (pageToGoTo - 1) && retrievedIndex != (pageToGoTo - 1)) {
        if ([nextViewControllers count] >= 1) {
            [self.pageViewController setViewControllers:nextViewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
        }
        [self.pageViewController setViewControllers:theViewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:NULL];
    }
}        

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    // Configure the page view controller and add it as a child view controller.
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;

    SBDataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = [NSArray arrayWithObject:startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];

    self.pageViewController.dataSource = self.modelController;

    self.navigationBarHidden = YES;
    [self pushViewController:self.pageViewController animated:YES];
    
    //[self addChildViewController:self.pageViewController];
    //[self.view addSubview:self.pageViewController.view];
    
    //MWPhotoBrowser *browser = [MWPhotoBrowser alloc];

    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    //CGRect pageViewRect = self.view.bounds;
    //if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
    //    pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
    //}
    //self.pageViewController.view.frame = pageViewRect;

    [self.pageViewController didMoveToParentViewController:self];    

    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;

    theRootViewController = self;
    thePageViewController = self.pageViewController;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (SBModelController *)modelController
{
    /*
     Return the model controller object, creating it if necessary.
     In more complex implementations, the model controller may be passed to the view controller.
     */
    if (!_modelController) {
        _modelController = [[SBModelController alloc] init];
    }
    return _modelController;
}

#pragma mark - UIPageViewController delegate methods

/*
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}
 */

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsPortrait(orientation) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)) {
        // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
        
        UIViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
        NSArray *viewControllers = [NSArray arrayWithObject:currentViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
        
        self.pageViewController.doubleSided = NO;
        return UIPageViewControllerSpineLocationMin;
    }

    // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
    SBDataViewController *currentViewController = [self.pageViewController.viewControllers objectAtIndex:0];
    NSArray *viewControllers = nil;

    NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:currentViewController];
    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController % 2 == 0) {
        UIViewController *nextViewController = [self.modelController pageViewController:self.pageViewController viewControllerAfterViewController:currentViewController];
        viewControllers = [NSArray arrayWithObjects:currentViewController, nextViewController, nil];
    } else {
        UIViewController *previousViewController = [self.modelController pageViewController:self.pageViewController viewControllerBeforeViewController:currentViewController];
        viewControllers = [NSArray arrayWithObjects:previousViewController, currentViewController, nil];
    }
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];


    return UIPageViewControllerSpineLocationMid;
}

+ (id) sharedRootVC {
    return theRootViewController;
}

+ (id) sharedPageVC {
    return thePageViewController;
}

@end
