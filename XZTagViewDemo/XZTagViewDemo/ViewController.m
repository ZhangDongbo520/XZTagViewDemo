//
//  ViewController.m
//  XZTagViewDemo
//
//  Created by Dreamer on 2018/2/11.
//  Copyright © 2018年 dreamer. All rights reserved.
//

#import "ViewController.h"

#import "XZTagView.h"

#import "NSMutableAttributedString+XZTagView.h"

@interface ViewController ()

@property (nonatomic, strong) XZTagView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString *tagsAttributedString = [NSMutableAttributedString setUpTagsAttributedString:@[@"耽美",@"言情",@"卡哇伊",@"小可爱",@"敲靓的",@"超喜欢的人",@"很nice",@"小可爱",@"敲靓的",@"言情",@"卡哇伊",@"超喜欢的人",@"很nice",@"小可爱",@"敲靓的"] tagStyle:^(XZTagStyle *tagStyle) {
        tagStyle.font = [UIFont systemFontOfSize:17];
        tagStyle.textColor = [UIColor blackColor];
        tagStyle.strokeColor = [UIColor redColor];
        tagStyle.strokeWidth = 1;
        tagStyle.cornerRadius = 100;
        tagStyle.insets = UIEdgeInsetsMake(-2, -6, -2, -6);
        tagStyle.tagViewMaxWidth = [UIScreen mainScreen].bounds.size.width - 20;
    }];
    
    self.tagView = [[XZTagView alloc] initWithFrame:CGRectMake(10, 100, tagsAttributedString.tagViewSize.width, tagsAttributedString.tagViewSize.height)];
    self.tagView.tagsAttributedString = tagsAttributedString;
    [self.view addSubview:self.tagView];
    
}


@end
