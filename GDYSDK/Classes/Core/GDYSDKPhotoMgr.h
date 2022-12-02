////  GDYSDKPhotoMgr.h
//  GDYSDK
//
//  Created on 2019/7/26.
//

/** func: GDYSDK --- 相册管理方法调用 + 图片方法使用
 *
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GDYSDKPhotoMgr : NSObject



/**
 select photo from album
 

 @param currentVC super view controller.
 @param delegate call delegate.
 @param allowsEditing allow editing.
 
 UIImagePickerControlerDelegate
 - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
 
    //原图
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    //⽤用户选择区域图⽚
    UIImage *editImage = [info objectForKey:UIImagePickerControllerEditedImage];
 
     [picker dismissViewControllerAnimated:YES completion:^{
     }];
 }

 */
+ (void)selectPhotoFromAlbumWithVC:(UIViewController *)currentVC setPickerControllerDelegate:(id)delegate allowsEditing:(BOOL)allowsEditing isSelectImg:(BOOL)isSelectImg;

/**
 add photo to Alubm

 @param currentImage 保存到相册的图片.
 @param completionTarget completion target.
 @param selector completion selector.
 completionSelector should have the form: - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
 */
+ (void)addPhotoToAlbumWithImage:(UIImage *)currentImage completionTarget:(id)completionTarget completionSelector:(SEL)selector;

/**
 add video to album

 @param videoPath video path to add album.
 @param completionTarget comletion target.
 @param selector  completionSelector should have the form:  - (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
 */
+ (void)saveVideoToAlbum:(NSString *)videoPath completionTarget:(id)completionTarget completionSelector:(SEL)selector;


#pragma mark - ----- 图片操作方法使用 -----

/**
 写UIImage对象到本地

 @param image UIImage对象
 @param imagePath image存储的本地路径
 @return 是否写入成功
 */
+ (BOOL)saveImageToDownloadFileWithImage:(UIImage *)image  imagePath:(NSString *)imagePath;

@end

NS_ASSUME_NONNULL_END
