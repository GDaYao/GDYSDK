//
//  SuperCollectionView.h

// func: super collection view


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NSInteger(^numberSectionsInCV)(UICollectionView *collectionView);
typedef NSInteger(^numberItems)(UICollectionView *collectionView,NSInteger section);
typedef CGSize(^sizeForItem)(UICollectionView *collectionView,UICollectionViewLayout *collectionViewLayout,NSIndexPath *indexPath);
typedef CGFloat(^horizontalDis)(UICollectionView *collectionView,UICollectionViewLayout *collectionViewLayout,NSInteger section);
typedef CGFloat(^verticalDis)(UICollectionView *collectionView,UICollectionViewLayout *collectionViewLayout,NSInteger section);
typedef UIEdgeInsets(^insetForSectionAtIndex)(UICollectionView *collectionView,UICollectionViewLayout *collectionViewLayout,NSInteger section);
typedef UICollectionReusableView *_Nullable(^sectionHeader)(UICollectionView *collectionView,NSString *kind,NSIndexPath *indexPath);
typedef UICollectionReusableView *_Nullable(^sectionFooter)(UICollectionView *collectionView,NSString *kind,NSIndexPath *indexPath);
typedef UICollectionViewCell*_Nullable(^cellForItem)(UICollectionView *collectionView,NSIndexPath *indexPath);
typedef void(^didSelectItem)(UICollectionView *collectionView,NSIndexPath *indexPath);
typedef BOOL(^shouldSelectItem)(UICollectionView *collectionView,NSIndexPath *indexPath);

@interface SuperCollectionView : UICollectionView <UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,copy)numberSectionsInCV numberSectionsInCV;
@property (nonatomic,copy)numberItems numberItems;
@property (nonatomic,copy)sizeForItem sizeForItem;
@property (nonatomic,copy)horizontalDis horizontalDis;
@property (nonatomic,copy)verticalDis verticalDis;
@property (nonatomic,copy)insetForSectionAtIndex insetForSectionAtIndex;
@property (nonatomic,copy)sectionHeader sectionHeader;
@property (nonatomic,copy)sectionFooter sectionFooter;
@property (nonatomic,copy)cellForItem cellForItem;
@property (nonatomic,copy)didSelectItem didSelectItem;
@property (nonatomic,copy)shouldSelectItem shouldselectItem;



// initilize method
- (void)InitCVWithBGColor:(UIColor *)BGColor withNeedHeaderFooter:(BOOL)isNeed withHSize:(CGSize)HSize withFSize:(CGSize)FSize withHID:(NSString *)HID withFID:(NSString *)FID withRegisterNib:(NSString *)NibName withCellId:(NSString *)cellId ;



@end

NS_ASSUME_NONNULL_END
