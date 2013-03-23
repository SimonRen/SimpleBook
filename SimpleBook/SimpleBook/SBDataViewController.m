//
//  SBDataViewController.m
//  SimpleBook
//
//  Created by Simon Ren on 1/6/13.
//  Copyright (c) 2013 MySelf Inc. All rights reserved.
//

#import "SBDataViewController.h"
#import "LuaBridge.h"

#import "SBRootViewController.h"

#import "SBPanel.h"

@implementation SBDataViewController

@synthesize defaultView = _defaultView;
@synthesize dataObject = _dataObject;
@synthesize rootViewControl = _rootViewControl;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDefaultView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _rootViewControl = [SBRootViewController sharedRootVC];
    ((UINavigationController*)_rootViewControl).navigationBarHidden = YES;
    [[LuaBridge sharedLua] callLuaVSP:@"LoadPage" param1:_dataObject param2:(__bridge void *)self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    SBPanel* panel = nil;
    
    NSArray* arr = [_defaultView subviews];
    for(UIView* view in arr) {
        if ([view isKindOfClass:[SBPanel class]]) {
            panel = (SBPanel*)view;
            break;
        }
    }
    
    if (panel) {
        
        //说明panel存在
        
        CGPoint touchPoint = [touch locationInView:_defaultView];
    
        if (CGRectContainsPoint(panel.frame, touchPoint)) {
            
            
        }
        else{
            [panel removeFromSuperview];
        }
    }

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
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
