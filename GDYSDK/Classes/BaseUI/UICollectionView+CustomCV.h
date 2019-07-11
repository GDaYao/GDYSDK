//
//  UICollectionView+CustomCV.h

/** func: `UICollectionView` category -- UICollectionView 类别
 *  **`UICollectionView` 便捷使用方法 -- 请见 <GDYSDKSubCollectionView.h/.m> **
 *
 *  此类只是用于展示 `UICollectionView`各个方法具体使用
 *  类别只是用于增加某个类的方法，不能继承实现某个类作为父类方法。
 */


#import <UIKit/UIKit.h>

@interface UICollectionView (CustomCV)

/**
 directly import this custom class,start init with arguments.

 @param BGColor UIColor object.
 @param CVFrame Set `UICollectionView` frame.Also you can set CGRectZero and use Masonry layout.
 @param isNeed Ask need show header or footer together.
 @param HSize `isNeed` set YES affect,header size.
 @param FSize `isNeed` set YES affect,footer size.
 @param HID `isNeed` set YES affect,header identifier.
 @param FID `isNeed` set YES affect,footer identifier.
 @param NibName Alerady new create xxx.nib/xxx.xib file name.
 @param cellId Set `UICollectionViewCell` identifier.
 @param delegateVC `UICollectionView` set `delegate`/`dataSource`,is UIVieweController class.
 @return Back `UICollectionView` object.
 */
+ (UICollectionView *)InitCVWithBGColor:(UIColor *)BGColor CVFrame:(CGRect)CVFrame withNeedHeaderFooter:(BOOL)isNeed withHSize:(CGSize)HSize withFSize:(CGSize)FSize withHID:(NSString *)HID withFID:(NSString *)FID withRegisterNib:(NSString *)NibName withCellId:(NSString *)cellId withDelegateVC:(id)delegateVC;




@end
