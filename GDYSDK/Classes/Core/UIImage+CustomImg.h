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

#pragma mark - create iOS App save work space file 
+ (NSString *)createiOSAppSaveWorkFileWithPath:(NSString *)saveWorkPath;


#pragma mark - implement "NSString/path" substring in find "/" position
+ (NSString *)generateSubstringToLastWithString:(NSString *)stringOrPath;
+ (NSString *)generateSubstringFromBeginWithString:(NSString *)stringOrPath;

#pragma mark - delete file from file path
+ (void)removeItemWithPath:(NSString *)pathStr;

#pragma mark - move file or change path name
+ (void)moveFilePathOrChangePathName:(NSString *)pathString newFilePath:(NSString *)newPath;



@end

NS_ASSUME_NONNULL_END


