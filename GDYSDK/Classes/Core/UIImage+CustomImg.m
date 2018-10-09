//
//  UIImage+CustomImg.m


#import "UIImage+CustomImg.h"

@implementation UIImage (CustomImg)

#pragma mark - ---- capture image from UIView ----
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


#pragma mark - ---- create iOS App save work space file ----
+ (NSString *)createiOSAppSaveWorkFileWithPath:(NSString *)saveWorkPath{
    NSString *collectSavedPath = nil;
    // get 'Documents' file
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentPath = [path objectAtIndex:0];
    // specifilly new file path
    collectSavedPath = [doucumentPath stringByAppendingPathComponent:saveWorkPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // create new file
    [fileManager createDirectoryAtPath:collectSavedPath withIntermediateDirectories:YES attributes:nil error:nil];
    // back complete path
    return collectSavedPath;
}


#pragma mark - ---- judge path exist ----
+ (NSString *)judgeParaPathNotExistCreateWithString:(NSString *)pathString pathSufix:(NSString *)pathPrefix{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir;
    if (![fm fileExistsAtPath:pathPrefix isDirectory:&isDir]) {
        [fm createDirectoryAtPath:pathPrefix withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *myImgPath = [pathPrefix stringByAppendingPathComponent:pathString];
    return myImgPath;
}

#pragma mark - implement "NSString/path" substring from "/" position to end
+ (NSString *)generateSubstringToLastWithString:(NSString *)stringOrPath{
    NSRange range = [stringOrPath rangeOfString:@"/" options:NSBackwardsSearch] ;
    if(range.length == 0){
        return stringOrPath;
    }
    NSString *lastStr = [stringOrPath substringFromIndex:range.location+1];
    return lastStr;
}
+ (NSString *)generateSubstringFromBeginWithString:(NSString *)stringOrPath{
    NSRange range = [stringOrPath rangeOfString:@"/"] ;
    if(range.length == 0){
        return stringOrPath;
    }
    NSString *lastStr = [stringOrPath substringToIndex:range.location];
    return lastStr;
}

#pragma mark - ---- delete file from file path ----
+ (void)removeItemWithPath:(NSString *)pathStr
{
    if (pathStr.length == 0 || !pathStr) {
        return;
    }
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir;
    if([fm fileExistsAtPath:pathStr isDirectory:&isDir])
    {
        [fm removeItemAtPath:pathStr error:nil];
    }
}

#pragma mark - move file or change path name
+ (void)moveFilePathOrChangePathName:(NSString *)pathString newFilePath:(NSString *)newPath{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir;
    if([fm fileExistsAtPath:pathString isDirectory:&isDir])
    {
        [fm moveItemAtPath:pathString toPath:newPath error:nil];
    }
}





@end
