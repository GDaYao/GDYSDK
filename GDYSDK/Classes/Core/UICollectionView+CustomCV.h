//
//  UICollectionView+CustomCV.h

//function: 自定义UICollectionView,初始化并封装常用方法

/**
 使用注意事项：
    1. 使用identifier，在不同界面使用不同的UICollectionViewCell需要使用不同的cell identifier 特别在使用static修饰时，出现cellId重复使用（在内存中体现）。
    2. 出现类似-UICollectionViewCell/UITableViewCell 'invalid nib registered for identifier (xxxViewCell) - nib must contain exactly one top level object which must be a UICollectionReusableView instance' 错误，是因为在xib文件中多一些没有添加到视图上的控件。
 **/

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
