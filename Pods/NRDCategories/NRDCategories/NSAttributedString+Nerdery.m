//
//  NSAttributedString+Nerdery.m
//
//  Copyright 2014 The Nerdery. All rights reserved.
//

#import "NSAttributedString+Nerdery.h"

@implementation NSAttributedString (Nerdery)

+ (NSAttributedString *)nrd_attributedStringWithText:(NSString *)text
                                                font:(UIFont *)font
                                               color:(UIColor *)color
                             kerningInPhotoshopUnits:(CGFloat)kerningInPhotoshopUnits
{
    NSParameterAssert(text);
    NSParameterAssert(color);
    
    NSAttributedString *attributedString =
    [[NSAttributedString alloc] initWithString:text
                                    attributes:@{NSFontAttributeName : font,
                                                 NSForegroundColorAttributeName : color}];
    attributedString = [attributedString nrd_attributedStringWithKerningInPhotoshopUnits:kerningInPhotoshopUnits];
    return attributedString;
}

- (NSMutableAttributedString *)nrd_attributedStringWithKerning:(CGFloat)kernValue
{
    NSMutableAttributedString *attributedText = [self mutableCopy];
    [attributedText addAttribute:NSKernAttributeName
                           value:@(kernValue)
                           range:NSMakeRange(0, [attributedText length])];
    return attributedText;
}

- (NSMutableAttributedString *)nrd_attributedStringWithKerningInPhotoshopUnits:(CGFloat)kernValue
{
    UIFont *font = [self attribute:NSFontAttributeName atIndex:0 effectiveRange:NULL];
    CGFloat kernInPoints = kernValue * .001 * font.pointSize;
    return [self nrd_attributedStringWithKerning:kernInPoints];
}

- (NSMutableAttributedString *)nrd_attributedStringWithLineHeight:(CGFloat)lineHeight
{
    NSMutableAttributedString *attributedText = [self mutableCopy];
    NSRange attributeRange = NSMakeRange(0, 0);
    NSUInteger currentIndex = 0;
    
    while(attributeRange.location + attributeRange.length < attributedText.length) {
        NSMutableParagraphStyle *paragraphStyle = [[attributedText attribute:NSParagraphStyleAttributeName
                                                                     atIndex:currentIndex
                                                              effectiveRange:&attributeRange] mutableCopy];
        if (!paragraphStyle) {
            paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        }
        paragraphStyle.minimumLineHeight = lineHeight;
        paragraphStyle.maximumLineHeight = lineHeight;
        paragraphStyle.lineSpacing = 0;
        [attributedText addAttributes:@{NSParagraphStyleAttributeName: paragraphStyle} range:attributeRange];
        currentIndex = attributeRange.location + attributeRange.length;
    }
    
    return attributedText;
}

@end
