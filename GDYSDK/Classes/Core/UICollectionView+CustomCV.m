//
//  UICollectionView+CustomCV.m

#import "UICollectionView+CustomCV.h"

@implementation UICollectionView (CustomCV)

// use @"" or 0 in no need transform parameter
+ (UICollectionView *)InitCVWithBGColor:(UIColor *)BGColor withNeedHeaderFooter:(BOOL)isNeed withHSize:(CGSize)HSize withFSize:(CGSize)FSize withHID:(NSString *)HID withFID:(NSString *)FID withRegisterNib:(NSString *)NibName withCellId:(NSString *)cellId withDelegateVC:(id)delegateVC{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *currentCV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    currentCV.backgroundColor = BGColor;
    if(isNeed){
        layout.headerReferenceSize = HSize;
        layout.footerReferenceSize = FSize;
        [currentCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID];
        [currentCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FID];
    }
    [currentCV registerNib:[UINib nibWithNibName:NibName bundle:nil] forCellWithReuseIdentifier:cellId];
    currentCV.delegate = delegateVC;
    currentCV.dataSource = delegateVC;
    currentCV.bounces = YES;

    return currentCV;
}



@end


