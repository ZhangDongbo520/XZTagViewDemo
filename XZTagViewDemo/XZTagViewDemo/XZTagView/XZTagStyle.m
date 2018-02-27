//
//  XZTagStyle.m
//  XZTagViewDemo
//
//  Created by Dreamer on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZTagStyle.h"

@implementation XZTagStyle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor grayColor];
        self.strokeColor = [UIColor clearColor];
        self.fillColor = [UIColor clearColor];
        self.strokeWidth = 0;
        self.cornerRadius = 0;
        self.insets = UIEdgeInsetsZero;
        self.space = 10;
        self.lineSpace = 10;
        self.tagViewMaxWidth = [UIScreen mainScreen].bounds.size.width;
        self.lineJoin = kCGLineJoinBevel;
        self.tagsAlignment = XZTagAlignmentLeft;
    }
    return self;
}

@end
