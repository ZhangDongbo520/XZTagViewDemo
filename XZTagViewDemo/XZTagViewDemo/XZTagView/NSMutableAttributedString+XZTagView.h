//
//  NSMutableAttributedString+XZTagView.h
//  XZTagViewDemo
//
//  Created by Dreamer on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XZTagStyle.h"

@interface NSMutableAttributedString (XZTagView)

@property (nonatomic) CGSize tagViewSize;

+ (NSMutableAttributedString *)setUpTagsAttributedString:(NSArray<NSString *> *)tags tagStyle:(void (^)(XZTagStyle *))styleBlock;

@end
