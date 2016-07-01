//
//  ViewController.m
//  UILabel+LYAttributed
//
//  Created by 俊洋洋 on 16/7/1.
//  Copyright © 2016年 俊洋洋. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+LYAttributed.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lab=[[UILabel alloc] init];
    lab.text=@"赵德伟\n韩小雨\n任敏德\n刘亚雷\n张宇哈哈哈哈哈哈哦哦哦\n哦哦噢噢啊哈";
    lab.numberOfLines=0;
    lab.font=[UIFont systemFontOfSize:15];
    lab.wordSpace=6;//字间距
    lab.lineSpace=5;//行间距
    
    lab.specialWord=@"哈哈哈哈";
    lab.specialWordColor=[UIColor redColor];
    lab.specialWordFont=[UIFont systemFontOfSize:20];
    
    lab.underlineWord=@"赵德伟";
    lab.underlineWordColor=[UIColor redColor];
    
    CGFloat h =  [lab getHeightForWidth:self.view.frame.size.width];
    lab.frame=CGRectMake(20, 100, 300, h);
    [self.view addSubview:lab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
