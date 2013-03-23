//
//  SBRootViewController.h
//  SimpleBook
//
//  Created by Simon Ren on 1/6/13.
//  Copyright (c) 2013 MySelf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBRootViewController : UINavigationController <UIPageViewControllerDelegate>

- (void) fadeOut:(int)page;
- (void) fadeIn;
- (void) pageGoto:(int)page;

+ (id) sharedRootVC;
+ (id) sharedPageVC;

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
