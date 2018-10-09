//
//  UICollectionView+CustomCV.h

//function: 自定义UICollectionView,初始化并封装常用方法

#import <UIKit/UIKit.h>

@interface UICollectionView (CustomCV)

+ (UICollectionView *)InitCVWithBGColor:(UIColor *)BGColor withNeedHeaderFooter:(BOOL)isNeed withHSize:(CGSize)HSize withFSize:(CGSize)FSize withHID:(NSString *)HID withFID:(NSString *)FID withRegisterNib:(NSString *)NibName withCellId:(NSString *)cellId withDelegateVC:(id)delegateVC;

@end
