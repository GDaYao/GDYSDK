////  UIButton+GDYSDKUIButton.h
//  GDYSDK
//
//  Created on 2019/8/10.
//  
//

/** func: UIButton category
 *  init method.
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (GDYSDKUIButton)

/**
 UIButton init method.
 
 @param imgStr background image name string.
 @param titleStr UIButton show title.
 @param titleColor UIButton title color.
 @param fontName UIButton title font name.
 @param isBold UIButton whether bold.
 @param sizeFont UIButton title font.
 @param bgColor UIButton background color.
 @return init completion UIButton.
 */
+ (UIButton *)GDYSDKInitWithBGName:(NSString *)imgStr title:(NSString *)titleStr titleColor:(UIColor *)titleColor fontName:(NSString *)fontName isBold:(BOOL)isBold fontSize:(CGFloat)sizeFont btnBGColor:(UIColor *)bgColor;



@end

NS_ASSUME_NONNULL_END
