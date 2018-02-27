//
//  XZTagStyle.h
//  XZTagViewDemo
//
//  Created by Dreamer on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

typedef NS_ENUM(NSInteger, XZTagAlignment){
    XZTagAlignmentLeft = 0,
    XZTagAlignmentCenter,
    XZTagAlignmentRight
};

@interface XZTagStyle : NSObject

//标签字体大小
@property (nonatomic, strong) UIFont *font;

//标签字体颜色
@property (nonatomic, strong) UIColor *textColor;

//标签的边框颜色
@property (nonatomic, strong) UIColor *strokeColor;

//标签的填充颜色
@property (nonatomic, strong) UIColor *fillColor;

//标签的边框宽度
@property (nonatomic, assign) CGFloat strokeWidth;

//标签的圆角大小
@property (nonatomic, assign) CGFloat cornerRadius;

//标签的内边距（即文字与边框的距离）
@property (nonatomic) UIEdgeInsets insets;

//标签之间的水平距离（左右间距）
@property (nonatomic, assign) CGFloat space;

//标签之间的行间距（上下间距）
@property (nonatomic, assign) CGFloat lineSpace;

//tagView的最大宽度
@property (nonatomic, assign) CGFloat tagViewMaxWidth;

@property (nonatomic) CGLineJoin lineJoin;

//标签的对齐方式
@property (nonatomic, assign) XZTagAlignment tagsAlignment;

@end
