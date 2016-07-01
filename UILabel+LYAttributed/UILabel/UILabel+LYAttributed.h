//
//  UILabel+LYAttributed.h
//  UILabel+LYAttributed
//
//  Created by 俊洋洋 on 16/7/1.
//  Copyright © 2016年 俊洋洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LYAttributed)
/**
 *  字间距
 */
@property (nonatomic,assign)CGFloat wordSpace;

/**
 *  行间距
 */
@property (nonatomic,assign)CGFloat lineSpace;

/**
 *  特殊字 字颜色 字大小
 */
@property (nonatomic,copy)NSString *specialWord;
@property (nonatomic,strong)UIColor *specialWordColor;
@property (nonatomic,strong)UIFont *specialWordFont;

/**
 *  下划线
 */
@property (nonatomic,copy)NSString *underlineWord;
@property (nonatomic,strong)UIColor *underlineWordColor;

- (CGFloat)getHeightForWidth:(CGFloat)width;
@end
