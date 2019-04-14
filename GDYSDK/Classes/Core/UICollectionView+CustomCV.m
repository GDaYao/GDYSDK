//
//  UICollectionView+CustomCV.m

#import "UICollectionView+CustomCV.h"

static NSString * const kDefaultCellIdentifier = @"collectionViewCellIdentifier";

@implementation UICollectionView (CustomCV)

#pragma mark - init `UICollectionView`
+ (UICollectionView *)InitCVWithBGColor:(UIColor *)BGColor CVFrame:(CGRect)CVFrame withNeedHeaderFooter:(BOOL)isNeed withHSize:(CGSize)HSize withFSize:(CGSize)FSize withHID:(NSString *)HID withFID:(NSString *)FID withRegisterNib:(NSString *)NibName withCellId:(NSString *)cellId withDelegateVC:(id)delegateVC{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *currentCV = [[UICollectionView alloc]initWithFrame:CVFrame collectionViewLayout:layout];
    currentCV.backgroundColor = BGColor;
    if(isNeed){
        layout.headerReferenceSize = HSize;
        layout.footerReferenceSize = FSize;
        [currentCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID];
        [currentCV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FID];
    }
    if (cellId == nil || cellId.length == 0) {
        [currentCV registerNib:[UINib nibWithNibName:NibName bundle:nil] forCellWithReuseIdentifier:kDefaultCellIdentifier];
    }else{
        [currentCV registerNib:[UINib nibWithNibName:NibName bundle:nil] forCellWithReuseIdentifier:cellId];
    }
    currentCV.delegate = delegateVC;
    currentCV.dataSource = delegateVC;
    currentCV.bounces = YES;
    return currentCV;
}

/**
 Usage
 
 - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
 - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
 
// item的大小
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;  // each `UICollectionViewCell` size.
 // item 列间距(纵)
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section; // horizontal distance.
 // //item 行间距(横)
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section; // vertical distance.
// 定义整个CollectionViewCell 与当前secotion下 FooterView-headerView 的间距 -- 内容整体边距设置
 -(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
 
// UICollectionView cell content show or cell action operate.
 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     CustomCollectionViewCell *cell = (MyWorkCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kDefaultCellIdentifier forIndexPath:indexPath]; // kDefaultCellIdentifier is equal to top.
 }
 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
 //返回这个 `UICollectionView`某个cell 是否可以被选择
 -(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
 }
 
 // optional
 //添加头视图
 
 
 
 */









@end


