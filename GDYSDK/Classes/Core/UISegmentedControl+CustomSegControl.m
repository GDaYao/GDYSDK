//
//  UISegmentedControl+CustomSegControl.m


#import "UISegmentedControl+CustomSegControl.h"

@implementation UISegmentedControl (CustomSegControl)

#pragma mark - init segmented control
+ (UISegmentedControl *)InitSegControlWithInitItems:(NSArray *)itemsArray segmentFrame:(CGRect)segFrame defaultSelectedSegmentIndex:(NSInteger)selectedIndex segTintColor:(UIColor *)tintColor {
    
    /* such as `itemsArray`:
     [NSArray arrayWithObjects:
            [[UIImage imageNamed:@"red"]
                    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
            [[UIImage imageNamed:@"yellow"]
                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
         nil];
     // 正常字体颜色设置
     NSDictionary *normalDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
     [segCon setTitleTextAttributes:normalDic forState:UIControlStateNormal];
     // 选中时字体颜色设置
     NSDictionary *selectDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil];
     [segCon setTitleTextAttributes:selectDic forState:UIControlStateSelected];
     */
    UISegmentedControl *segCon = [[UISegmentedControl alloc]initWithItems:itemsArray];
    segCon.frame = segFrame;
    segCon.selectedSegmentIndex = selectedIndex;
    if (tintColor) {
        segCon.tintColor = tintColor;
    }else{
        segCon.tintColor = [UIColor darkGrayColor];
    }
    return segCon;
}





@end
