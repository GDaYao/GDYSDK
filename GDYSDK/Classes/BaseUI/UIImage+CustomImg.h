//
//  UIImage+CustomImg.h

// func: custom UIImage function



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CustomImg)

#pragma mark - capture image from UIView
+ (UIImage *)backImgFromView:(UIView *)specifilyView;

#pragma mark - in GPU image to capture image from UIView
+ (UIImage *)captureImgWhenViewIsGPUImageV:(UIView *)view;


#pragma mark - change image size
+ (UIImage *)changeImgSize:(UIImage *)currentImg changeSize:(CGSize)size;

#pragma mark - generate UIImage form color
// draw rect
+ (UIImage *)imageRectWithColor:(UIColor *)color colorSize:(CGSize)colorSize;
// draw fill round
+ (UIImage *)imageRoundWithColor:(UIColor *)color colorSize:(CGSize)colorSize;


@end

NS_ASSUME_NONNULL_END


