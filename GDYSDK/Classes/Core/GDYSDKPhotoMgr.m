////  GDYSDKPhotoMgr.m
//  GDYSDK
//
//  Created on 2019/7/26.
//  
//

#import "GDYSDKPhotoMgr.h"

#import <Photos/Photos.h>

@implementation GDYSDKPhotoMgr

#pragma mark - get album authorized status.
+ (void)getAuthorizationStatusAlbumWithAuthorized:(void(^)(BOOL authorized))authorizedBlock {
    
    PHAuthorizationStatus author = [PHPhotoLibrary authorizationStatus];
    if (author == PHAuthorizationStatusAuthorized)
    {
        authorizedBlock(YES);
    }else if (author == PHAuthorizationStatusNotDetermined)
    {
        // request album authorized.
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusAuthorized)
                {
                    authorizedBlock(YES);
                }else{
                    authorizedBlock(NO);
                }
            });
        }];
    }
    else
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"未获得相册权限，进入设置开启权限" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 跳转进入设置界面
//            if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0 && [UIDevice currentDevice].systemVersion.doubleValue < 10.0) {  // iOS8.0 和 iOS9.0
//                NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//                if ([[UIApplication sharedApplication] canOpenURL:url]) {
//                    [[UIApplication sharedApplication] openURL:url];
//                }
//            }else if ([UIDevice currentDevice].systemVersion.doubleValue >= 10.0) {  // iOS10.0及以后
//            }
            NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                if (@available(iOS 10.0, *)) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            authorizedBlock(NO);
        }];
        [alertVC addAction:okAction];
        [alertVC addAction:cancelAction];
        UIWindow *topWindow = [UIApplication sharedApplication].keyWindow;
        [topWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
    }
}




#pragma mark - select photo from album
+ (void)selectPhotoFromAlbumWithVC:(UIViewController *)currentVC setPickerControllerDelegate:(id)delegate allowsEditing:(BOOL)allowsEditing isSelectImg:(BOOL)isSelectImg {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // 如果当前控制器器没有实现 `UINavigationControllerDelegate`代理或者不是UINavigationController控制器器则需要实现此代理理，否则会报警告，即不不会调⽤用代理理⽅方法。
    imagePickerController.delegate = delegate;
    imagePickerController.allowsEditing = allowsEditing; // allowsEditing属性 ⼀一定要设置成yes，表示照⽚片可编辑，会出现矩形图⽚片选择框
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // 选择展示类型: @"public.movie" 为视频  @"public.image" 为图片
    if (isSelectImg == YES ) {
        imagePickerController.mediaTypes = [NSArray arrayWithObjects:@"public.image", nil];
    }else{
        imagePickerController.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil];
    }
    [currentVC presentViewController:imagePickerController animated:YES completion:nil];
}



#pragma mark -  add photo to Alubm
+ (void)addPhotoToAlbumWithImage:(UIImage *)currentImage completionTarget:(id)completionTarget completionSelector:(SEL)selector {
    UIImageWriteToSavedPhotosAlbum(currentImage, completionTarget, selector, NULL);
    //因为需要知道该操作的完成情况，即保存成功与否，所以此处需要⼀一个回调⽅方法 `image:didFinishSavingWithError:contextInfo:`
}


#pragma mark - 添加视频到本地相册
+ (void)saveVideoToAlbum:(NSString *)videoPath completionTarget:(id)completionTarget completionSelector:(SEL)selector {
    if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath) ) {
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, completionTarget, selector, nil);
    }
}


#pragma mark - ----- 图片操作方法使用 -----


#pragma mark - 存储图片到指定文件夹
+ (BOOL)saveImageToDownloadFileWithImage:(UIImage *)image  imagePath:(NSString *)imagePath {
    BOOL result =[UIImagePNGRepresentation(image) writeToFile:imagePath   atomically:YES]; // 保存成功会返回YES
    return result;
}








@end
