//
//  UILabel+CustomLabInit.m


#import "UILabel+CustomLabInit.h"
#import "UIColor+Hex.h"

@implementation UILabel (CustomLabInit)
+ (UILabel *)InitLabWithBGColor:(NSString *)hexStr textColor:(UIColor *)txC fontName:(NSString *)fontName fontSize:(CGFloat)fontSize labText:(NSString *)labText txAlignment:(NSTextAlignment)txAlignment
{
    UILabel *lab = [[UILabel alloc]init];
    if ([hexStr isEqualToString:@"0"] || !hexStr) {
        lab.backgroundColor = [UIColor clearColor];
    }else{
        lab.backgroundColor = [UIColor colorWithHexString:hexStr];
    }
    if(fontName &&  (fontSize != 0)){
        lab.font = [UIFont fontWithName:fontName size:fontSize];
    }
    lab.text = labText;
    lab.textColor = txC;
    lab.textAlignment = txAlignment;
    lab.numberOfLines = 0;
    return lab;

}




@end



