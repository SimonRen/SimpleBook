//
//  SBModelController.m
//  SimpleBook
//
//  Created by Simon Ren on 1/6/13.
//  Copyright (c) 2013 MySelf Inc. All rights reserved.
//

#import "SBModelController.h"

#import "SBDataViewController.h"

#import "LuaBridge.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface SBModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation SBModelController

@synthesize pageData = _pageData;

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        _pageData = [[NSMutableArray alloc] init];
        [[LuaBridge sharedLua] callLuaVP:@"PreparePageData" param:(__bridge void *)_pageData];
    }
    return self;
}

- (SBDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    SBDataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"SBDataViewController"];
    dataViewController.dataObject = [self.pageData objectAtIndex:index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(SBDataViewController *)viewController
{   
    /*
     Return the index of the given data view controller.
     For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
     */
    return [self.pageData indexOfObject:viewController.dataObject];
}

- (void) removeCover1
{
    _pageData = [[NSMutableArray alloc] init];
    [[LuaBridge sharedLua] callLuaVP:@"PreparePageDataNoCover1" param:(__bridge void *)_pageData];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(SBDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(SBDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
