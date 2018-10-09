//
//  NetDataMgr.h

// network request
//  need accompany 'CustomAFNetHTTPSessionMgr'


#import <Foundation/Foundation.h>

@interface NetDataMgr : NSObject
// AFNet reachability status
+ (void)backCurrentNetworkWithStatusStr:(void(^)(NSString *netStr))networkStatus;

// POST -- net data
+ (void)AFHttpDataTaskPostMethodWithURLString:(NSString *)URLString
                                   parameters:(id)parameters
                                      success:(void (^)(id _Nullable responseObject))success
                                      failure:(void (^)(NSError * _Nullable error))failure;
// GET -- net data
+ (void)AFHttpDataTaskGETMethodWithURLString:(NSString *)URLString
                                  parameters:(id)parameters
                                     success:(void (^)(id _Nullable responseObject))success
                                     failure:(void (^)(NSError * _Nullable error))failure;
// download
+ (void)createDownloadTaskWithDownloadStr:(NSString *)downloadStr parameters:(id)parameters downloadSpecifilyPath:(NSString *)specifilyPath  downloadProgress:(void(^)(NSProgress * _Nonnull downloadProgress))progress;

// upload -- directly
+ (void)createUploadTaskWithRequestUploadStr:(NSString *)uploadStr parameters:(id)parameters uploadFilePathStr:(NSString *)filePathStr progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress;
// use 'file url' upload
+ (void)createUploadTaskWithStreamedRequestUploadStr:(NSString *)uploadStr parameters:(id)parameters uploadFilePathStr:(NSString *)filePathStr interfaceName:(NSString *)interName uploadServerName:(id)serverName uploadType:(id)uploadType progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress;
// use 'data' upload
+ (void)createUploadTaskWithStreamedRequestUploadStr:(NSString *)uploadStr parameters:(id)parameters localData:(NSData *)data interfaceName:(NSString *)interName uploadServerName:(id)serverName uploadType:(id)uploadType progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress;




@end
