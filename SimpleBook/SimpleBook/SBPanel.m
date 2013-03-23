//
//  SBPanel.m
//  SimpleBook
//
//  Created by liuyang on 13-3-23.
//  Copyright (c) 2013年 MySelf Inc. All rights reserved.
//

#import "SBPanel.h"

@implementation SBPanel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithX: (CGFloat)valuex y:(CGFloat)valuey w:(CGFloat)valuew h:(CGFloat)valueh
{
    self = [super initWithFrame:CGRectMake(valuex, valuey, valuew, valueh)];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:1];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
