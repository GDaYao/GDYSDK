//
//  SuperCollectionView.m


#import "SuperCollectionView.h"

static NSString * const kDefaultCellIdentifier = @"collectionViewCellIdentifier";

@implementation SuperCollectionView

#pragma mark - init with frame
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark  - init method
- (void)InitCVWithBGColor:(UIColor *)BGColor withNeedHeaderFooter:(BOOL)isNeed withHSize:(CGSize)HSize withFSize:(CGSize)FSize withHID:(NSString *)HID withFID:(NSString *)FID withRegisterNib:(NSString *)NibName withCellId:(NSString *)cellId {
    self.backgroundColor = BGColor;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionViewLayout = layout;
    if(isNeed){
        layout.headerReferenceSize = HSize;
        layout.footerReferenceSize = FSize;
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FID];
    }
    if (cellId == nil || cellId.length == 0) {
        [self registerNib:[UINib nibWithNibName:NibName bundle:nil] forCellWithReuseIdentifier:kDefaultCellIdentifier];
    }else{
        [self registerNib:[UINib nibWithNibName:NibName bundle:nil] forCellWithReuseIdentifier:cellId];
    }
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.delegate = self;
    self.dataSource = self;
    self.bounces = YES;
}

#pragma mark - UICollectionView delegate/datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSInteger numInt = self.numberSectionsInCV(collectionView);
    return numInt;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.numberItems(collectionView,section);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.sizeForItem(collectionView,collectionViewLayout,indexPath);
}
// 纵间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.verticalDis(collectionView,collectionViewLayout,section);
}
// 列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return self.horizontalDis(collectionView,collectionViewLayout,section);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (self.insetForSectionAtIndex) {
        return self.insetForSectionAtIndex(collectionView,collectionViewLayout,section);
    }
    return UIEdgeInsetsZero;
}

//这个也是最重要的方法 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (self.sectionHeader) {
            return self.sectionHeader(collectionView,kind,indexPath);
        }
    }
    
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        if (self.sectionFooter) {
            return self.sectionFooter(collectionView,kind,indexPath);
        }
    };
    return nil;
}



// UICollectionView cell content show or cell action operate.
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForItem(collectionView,indexPath);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.didSelectItem(collectionView,indexPath);
}
//返回这个 `UICollectionView`某个cell 是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}






@end
