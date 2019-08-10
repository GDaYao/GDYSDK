////  UILabel+GDYSDKUILabel.h
//  GDYSDK
//
//  Created on 2019/8/10.
//  
//

/** func: UILabel category
 *  init method.
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (GDYSDKUILabel)

/**
 init lab
 */
+ (UILabel *)InitLabWithBGColor:(UIColor *)bgColor textColor:(UIColor *)txColor fontName:(NSString *)fontName isBold:(BOOL)isBold fontSize:(CGFloat)fontSize labText:(NSString *)labText txAlignment:(NSTextAlignment)txAlignment;


/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


@end

NS_ASSUME_NONNULL_END


