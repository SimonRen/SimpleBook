//
//  SBDataViewController.h
//  SimpleBook
//
//  Created by Simon Ren on 1/6/13.
//  Copyright (c) 2013 MySelf Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBDataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *defaultView;
@property (strong, nonatomic) id dataObject;

@end
