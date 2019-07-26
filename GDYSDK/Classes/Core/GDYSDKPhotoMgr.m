////  GDYSDKPhotoMgr.m
//  GDYSDK
//
//  Created on 2019/7/26.
//  
//

#import "GDYSDKPhotoMgr.h"

@implementation GDYSDKPhotoMgr


#pragma mark - select photo from album
+ (void)tapBtnToPopSystemAlbumWithVC:(UIViewController *)currentVC setPickerControllerDelegate:(id)delegate allowsEditing:(BOOL)allowsEditing {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // 如果当前控制器器没有实现 `UINavigationControllerDelegate`代理理或者不不是UINavigationController控制器器则需要实现此代理理，否则会报警告，即不不会调⽤用代理理⽅方法。
    imagePickerController.delegate = delegate;
    imagePickerController.allowsEditing = allowsEditing; // allowsEditing属性 ⼀一定要设置成yes，表示照⽚片可编辑，会出现矩形图⽚片选择框
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
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




@end
