//
//  SBModelController.h
//  SimpleBook
//
//  Created by Simon Ren on 1/6/13.
//  Copyright (c) 2013 MySelf Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SBDataViewController;

@interface SBModelController : NSObject <UIPageViewControllerDataSource>
- (SBDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(SBDataViewController *)viewController;
@end
