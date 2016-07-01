//
//  UILabel+LYAttributed.m
//  UILabel+LYAttributed
//
//  Created by 俊洋洋 on 16/7/1.
//  Copyright © 2016年 俊洋洋. All rights reserved.
//

#import "UILabel+LYAttributed.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>


@implementation UILabel (LYAttributed)

/**
 *  字间距
 *
 *  @return 字间距
 */
- (CGFloat)wordSpace
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setWordSpace:(CGFloat)wordSpace
{
    objc_setAssociatedObject(self, @selector(wordSpace), @(wordSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *  行间距
 *
 *  @return 行间距
 */
- (CGFloat)lineSpace
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setLineSpace:(CGFloat)lineSpace
{
    objc_setAssociatedObject(self, @selector(lineSpace), @(lineSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *  特殊字
 *
 *  @return 特殊字
 */
- (NSString *)specialWord
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setSpecialWord:(NSString *)specialWord
{
    objc_setAssociatedObject(self, @selector(specialWord), specialWord, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)specialWordColor
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setSpecialWordColor:(UIColor *)specialWordColor
{
    objc_setAssociatedObject(self, @selector(specialWordColor), specialWordColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)specialWordFont
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setSpecialWordFont:(UIFont *)specialWordFont
{
    objc_setAssociatedObject(self, @selector(specialWordFont), specialWordFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)underlineWord
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setUnderlineWord:(NSString *)underlineWord
{
    objc_setAssociatedObject(self, @selector(underlineWord), underlineWord, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)underlineWordColor{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setUnderlineWordColor:(UIColor *)underlineWordColor
{
    objc_setAssociatedObject(self, @selector(underlineWordColor), underlineWordColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (CGFloat)getHeightForWidth:(CGFloat)width
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, self.text.length)];
    
    //字间距
    if (self.wordSpace > 0) {
        long number = self.wordSpace;
        CFNumberRef numberRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
        [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)numberRef range:NSMakeRange(0, self.text.length)];
        CFRelease(numberRef);
    }
    
    //行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    if (self.lineSpace > 0) {
        [paragraphStyle setLineSpacing:self.lineSpace];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
    }
    
    //特殊字啊
    if (self.specialWord) {
        NSRange range = [self.text rangeOfString:self.specialWord];
        if (self.specialWordFont) {
            [attributedString addAttribute:NSFontAttributeName value:self.specialWordFont range:range];
        }
        if (self.specialWordColor) {
            [attributedString addAttribute:NSForegroundColorAttributeName value:self.specialWordColor range:range];
        }
    }
    
    //下划线
    if (self.underlineWord) {
        NSRange range = [self.text rangeOfString:self.underlineWord];
        [attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
        if (self.underlineWordColor) {
            [attributedString addAttribute:NSUnderlineColorAttributeName value:self.underlineWordColor range:range];
        }
    }

    self.attributedText = attributedString;
    
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];

    CGFloat height = ceil(rect.size.height);
    return height;
}
@end
