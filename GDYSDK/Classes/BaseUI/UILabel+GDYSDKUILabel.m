////  UILabel+GDYSDKUILabel.m
//  GDYSDK
//
//  Created on 2019/8/10.
//  
//

#import "UILabel+GDYSDKUILabel.h"

@implementation UILabel (GDYSDKUILabel)



#pragma mark - `UILabel` init method
+ (UILabel *)InitLabWithBGColor:(UIColor *)bgColor textColor:(UIColor *)txColor fontName:(NSString *)fontName isBold:(BOOL)isBold fontSize:(CGFloat)fontSize labText:(NSString *)labText txAlignment:(NSTextAlignment)txAlignment
{
    UILabel *lab = [[UILabel alloc]init];
    if (bgColor == nil) {
        lab.backgroundColor = [UIColor clearColor];
    }else{
        lab.backgroundColor = bgColor;
    }
    if(fontName &&  (fontSize != 0)){
        lab.font = [UIFont fontWithName:fontName size:fontSize];
    }else if(!fontName && (fontSize !=0) && (isBold == YES) ){
        lab.font = [UIFont boldSystemFontOfSize:fontSize];
    }else{
        lab.font = [UIFont systemFontOfSize:fontSize];
    }
    lab.text = labText;
    lab.textColor = txColor;
    lab.textAlignment = txAlignment;
    lab.numberOfLines = 0;
    return lab;
}


#pragma mark - `UILabel` change line space
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

#pragma mark - `UILabel` change word space
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

#pragma mark - `UILabel` change line+word space
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}





@end
