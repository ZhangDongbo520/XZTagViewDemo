//
//  NSMutableAttributedString+XZTagView.m
//  XZTagViewDemo
//
//  Created by Dreamer on 2018/2/26.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "NSMutableAttributedString+XZTagView.h"

#import <objc/runtime.h>

#import "NSAttributedString+YYText.h"
#import "YYTextLayout.h"

@implementation NSMutableAttributedString (XZTagView)

+ (NSMutableAttributedString *)setUpTagsAttributedString:(NSArray<NSString *> *)tags tagStyle:(void (^)(XZTagStyle *))styleBlock {
    NSMutableAttributedString *tagsAttributedString = [NSMutableAttributedString new];
    CGFloat height = 0;
    
    XZTagStyle *tagStyle = [[XZTagStyle alloc] init];
    if (styleBlock) {
        styleBlock(tagStyle);
    }
    
    for (NSString *tag in tags) {
        NSMutableAttributedString *tagAttributedString = [[NSMutableAttributedString alloc] init];
        
        if (tagStyle.tagsAlignment == XZTagAlignmentRight) {
            [tagAttributedString appendAttributedString:[self createEmptyAttributedString:tagStyle.space]];
        }
        [tagAttributedString appendAttributedString:[self createEmptyAttributedString:tagStyle.insets.left]];
        [tagAttributedString appendString:tag];
        [tagAttributedString appendAttributedString:[self createEmptyAttributedString:tagStyle.insets.right]];
        if (tagStyle.tagsAlignment != XZTagAlignmentRight) {
            [tagAttributedString appendAttributedString:[self createEmptyAttributedString:tagStyle.space]];
        }
        
        tagAttributedString.font = tagStyle.font;
        tagAttributedString.color = tagStyle.textColor;
        NSRange tagRange = [tagAttributedString.string rangeOfString:tag];
        [tagAttributedString setTextBackgroundBorder:[self createTextBorder:tagStyle] range:NSMakeRange(tagRange.location - 1, tagRange.length + 2)];
        
        [tagsAttributedString appendAttributedString:tagAttributedString];
        tagsAttributedString.lineSpacing = tagStyle.lineSpace;
        tagsAttributedString.lineBreakMode = NSLineBreakByWordWrapping;
        
        YYTextContainer *tagContainer = [YYTextContainer new];
        tagContainer.size = CGSizeMake(tagStyle.tagViewMaxWidth - 3, MAXFLOAT);
        
        YYTextLayout *tagLayout = [YYTextLayout layoutWithContainer:tagContainer text:tagsAttributedString];
        if (tagLayout.textBoundingSize.height > height) {
            if (height != 0) {
                [tagsAttributedString insertString:@"\n" atIndex:tagsAttributedString.length - tagAttributedString.length];
            }
            tagLayout = [YYTextLayout layoutWithContainer:tagContainer text:tagsAttributedString];
            height = tagLayout.textBoundingSize.height;
        }
    }
    tagsAttributedString.tagViewSize = CGSizeMake(tagStyle.tagViewMaxWidth, height + tagStyle.lineSpace);
    [tagsAttributedString addAttribute:NSParagraphStyleAttributeName value:[self createParagraphStyle:tagStyle] range:NSMakeRange(0, tagsAttributedString.length)];
    
    return tagsAttributedString;
}

+ (NSMutableAttributedString *)createEmptyAttributedString:(CGFloat)width {
    NSMutableAttributedString *emptyAttributedString = [NSMutableAttributedString attachmentStringWithContent:[[UIImage alloc] init] contentMode:UIViewContentModeScaleToFill attachmentSize:CGSizeMake(fabs(width), 1) alignToFont:[UIFont systemFontOfSize:0] alignment:YYTextVerticalAlignmentCenter];
    return emptyAttributedString;
}

+ (YYTextBorder *)createTextBorder:(XZTagStyle *)tagStyle {
    YYTextBorder *textBorder = [YYTextBorder new];
    textBorder.strokeWidth = tagStyle.strokeWidth;
    textBorder.strokeColor = tagStyle.strokeColor;
    textBorder.fillColor = tagStyle.fillColor;
    textBorder.cornerRadius = tagStyle.cornerRadius;
    textBorder.insets = UIEdgeInsetsMake(tagStyle.insets.top, 0, tagStyle.insets.bottom, 0);
    return textBorder;
}

+ (NSMutableParagraphStyle *)createParagraphStyle:(XZTagStyle *)tagStyle {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineSpacing = tagStyle.lineSpace;
    paragraphStyle.firstLineHeadIndent = 1.5;
    paragraphStyle.headIndent = 1.5;
    paragraphStyle.tailIndent = tagStyle.tagsAlignment == XZTagAlignmentRight ? tagStyle.tagViewMaxWidth - fabs(tagStyle.insets.right) : tagStyle.tagViewMaxWidth - 1.5;
    switch (tagStyle.tagsAlignment) {
        case XZTagAlignmentLeft:
            paragraphStyle.alignment = NSTextAlignmentLeft;
            break;
        case XZTagAlignmentRight:
            paragraphStyle.alignment = NSTextAlignmentRight;
            break;
        case XZTagAlignmentCenter:
            paragraphStyle.alignment = NSTextAlignmentCenter;
            break;
            
        default:
            break;
    }
    
    return paragraphStyle;
}

#pragma mark - get
- (CGSize)tagViewSize {
    NSValue *size = objc_getAssociatedObject(self, _cmd);
    return [size CGSizeValue];
}

#pragma mark - set
- (void)setTagViewSize:(CGSize)tagViewSize {
    NSValue *size = [NSValue valueWithCGSize:tagViewSize];
    objc_setAssociatedObject(self, @selector(tagViewSize), size, OBJC_ASSOCIATION_ASSIGN);
}

@end
