//
//  UIImage+CustomImg.m


#import "UIImage+CustomImg.h"

@implementation UIImage (CustomImg)

#pragma mark - ---- capture image from UIView || 截图 || 截屏 ----
+ (UIImage *)backImgFromView:(UIView *)specifilyView{
    UIGraphicsBeginImageContextWithOptions(specifilyView.bounds.size, specifilyView.opaque, 0.0); //specifilyView.bounds.size
    [specifilyView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

#pragma mark - ---- in GPU image to capture image from UIView ----
+ (UIImage *)captureImgWhenViewIsGPUImageV:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextConcatCTM(ctx, [view.layer affineTransform]);
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {//iOS 7+
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    } else {    //iOS 6
        [view.layer renderInContext:ctx];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGContextRestoreGState(ctx);
    UIGraphicsEndImageContext();
    return image;
}


#pragma mark - change image size
+ (UIImage *)changeImgSize:(UIImage *)currentImg changeSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [currentImg drawInRect:CGRectMake(0.0f, 0.0f, size.width,size.height)];
    currentImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return currentImg;
}

#pragma mark - generate UIImage form color
// draw rect -- 绘制矩形
+ (UIImage *)imageRectWithColor:(UIColor *)color colorSize:(CGSize)colorSize {
    CGRect rect = CGRectMake(0.0f, 0.0f, colorSize.width, colorSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
// draw fill round -- 绘制填充圆形
+ (UIImage *)imageRoundWithColor:(UIColor *)color colorSize:(CGSize)colorSize {
    CGRect rect = CGRectMake(0.0f, 0.0f, colorSize.width, colorSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextAddArc(context,colorSize.width/2.0, colorSize.height/2.0,colorSize.width/2.0,0, M_PI*2, 0);//添加圆 0顺时针、1逆时针
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFill);//绘制路径
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}




@end
