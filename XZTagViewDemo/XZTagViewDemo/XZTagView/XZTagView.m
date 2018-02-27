//
//  XZTagView.m
//  XZTagViewDemo
//
//  Created by Dreamer on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "XZTagView.h"

@implementation XZTagView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpTagView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpTagView];
    }
    return self;
}

- (void)setUpTagView {
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.displaysAsynchronously = YES;
}

- (void)setTagsAttributedString:(NSMutableAttributedString *)tagsAttributedString {
    _tagsAttributedString = tagsAttributedString;
    [self setUpTagView];
    self.attributedText = tagsAttributedString;
}

@end
