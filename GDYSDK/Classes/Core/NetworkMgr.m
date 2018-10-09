//
//  MyDataMgr.m


#import "NetworkMgr.h"
#import "CustomAFNetHTTPSessionMgr.h"
#import <AFNetworking/AFNetworking.h>


@implementation NetDataMgr

#pragma mark - network reachability status
+ (void)backCurrentNetworkWithStatusStr:(void(^)(NSString *netStr))networkStatus{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    /*
     AFNetworkReachabilityStatusUnknown          = -1,
     AFNetworkReachabilityStatusNotReachable     = 0,
     AFNetworkReachabilityStatusReachableViaWWAN = 1,
     AFNetworkReachabilityStatusReachableViaWiFi = 2,
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                NSLog(@"unknown");
                networkStatus(@"unknown");
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"no internet");
                networkStatus(@"no internet");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"WWAN");
                networkStatus(@"WWAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                networkStatus(@"WIFI");
                break;
                
            default:
                break;
        }
    }];
    // 开启
    [manager startMonitoring];
}



#pragma mark - 'Custom GET/POST' net request data
/*
 use '[self AFHttpDataTaskRequestMethod: ...]'
 */
+ (void)AFHttpDataTaskRequestMethod:(NSString *)method
                          URLString:(NSString *)URLString
                         parameters:(id)parameters
                            success:(void (^)(id _Nullable responseObject))success
                            failure:(void (^)(NSError * _Nullable error))failure
{
    AFHTTPSessionManager *sessionMgr = [AFHTTPSessionManager manager];
    sessionMgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"application/xhtml+xml", @"application/xml", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", @"video/mp4", nil];
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:sessionMgr.baseURL] absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (failure) {
            dispatch_async(sessionMgr.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(serializationError);
            });
        }
        return;
    }
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [sessionMgr dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (responseObject) {
            success(responseObject);
        }else{
            failure(error);
        }
    }];
    [dataTask resume];
}

#pragma mark ---- 'POST' net request data ----
+ (void)AFHttpDataTaskPostMethodWithURLString:(NSString *)URLString
                          parameters:(id)parameters
                             success:(void (^)(id _Nullable responseObject))success
                             failure:(void (^)(NSError * _Nullable error))failure
{
    CustomAFNetHTTPSessionMgr *sessionMgr = [CustomAFNetHTTPSessionMgr manager];
    [sessionMgr POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
            // in this success,you can add NSNotificationCenter to refresh view when data update
            // [[NSNotificationCenter defaultCenter] postNotificationName:@"requestSuccessRefreshData" object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        // [[NSNotificationCenter defaultCenter] postNotificationName:@"requestFailureShowAlert" object:nil];
    }];
}

#pragma mark  ---- 'GET' net request data ----
+ (void)AFHttpDataTaskGETMethodWithURLString:(NSString *)URLString
                                   parameters:(id)parameters
                                      success:(void (^)(id _Nullable responseObject))success
                                      failure:(void (^)(NSError * _Nullable error))failure
{
    CustomAFNetHTTPSessionMgr *sessionMgr = [CustomAFNetHTTPSessionMgr manager];
    [sessionMgr GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
            // in this success,you can add NSNotificationCenter to refresh view when data update
            // [[NSNotificationCenter defaultCenter] postNotificationName:@"requestSuccessRefreshData" object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        // [[NSNotificationCenter defaultCenter] postNotificationName:@"requestFailureShowAlert" object:nil];
    }];
}


#pragma mark - AFNet implete 'download'
+ (void)createDownloadTaskWithDownloadStr:(NSString *)downloadStr parameters:(id)parameters downloadSpecifilyPath:(NSString *)specifilyPath  downloadProgress:(void(^)(NSProgress * _Nonnull downloadProgress))progress{
    // 1. create manager
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    // 2. create request object
    if (parameters) {
        downloadStr = [downloadStr stringByAppendingString:parameters];
    }
    NSURL *URL = [NSURL URLWithString:downloadStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    // 3. download file
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress){
        // downloadProgress.completedUnitCount --- current download count
        // downloadProgress.totalUnitCount  --- totle count
        NSLog(@"%f", 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        progress(downloadProgress);
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        // targetPath -- temp file path
        NSLog(@"targetPath:%@",targetPath);
        NSString *path =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        if (specifilyPath) {
            path = specifilyPath;
        }
        NSString *filePath = [path stringByAppendingPathComponent:response.suggestedFilename];
        NSURL *url = [NSURL fileURLWithPath:filePath];
        return url;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"completion downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}



#pragma mark - --- AFNet implete 'upload'

#pragma mark  upload directly use
+ (void)createUploadTaskWithRequestUploadStr:(NSString *)uploadStr parameters:(id)parameters uploadFilePathStr:(NSString *)filePathStr progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    if (parameters) {
        uploadStr = [uploadStr stringByAppendingString:parameters];
    }
    NSURL *URL = [NSURL URLWithString:uploadStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURL *filePath = [NSURL fileURLWithPath:filePathStr];
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    }completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (responseObject) {
            NSLog(@"Success: %@ %@", response, responseObject);
        }else{
            NSLog(@"Error: %@", error);
        }
    }];
    [uploadTask resume];
}
#pragma mark upload 'stream' data
//interName:@"file" serverName:@"test.png" uploadType:@"image/png"
// use 'file url' upload
+ (void)createUploadTaskWithStreamedRequestUploadStr:(NSString *)uploadStr parameters:(id)parameters uploadFilePathStr:(NSString *)filePathStr interfaceName:(NSString *)interName uploadServerName:(id)serverName uploadType:(id)uploadType progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress
{
    [self streamedRequestUploadStr:uploadStr parameters:parameters uploadFilePathStr:filePathStr localData:nil interfaceName:interName uploadServerName:serverName uploadType:uploadType progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    }];
}
// use 'data' upload
+ (void)createUploadTaskWithStreamedRequestUploadStr:(NSString *)uploadStr parameters:(id)parameters localData:(NSData *)data interfaceName:(NSString *)interName uploadServerName:(id)serverName uploadType:(id)uploadType progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress
{
    [self streamedRequestUploadStr:uploadStr parameters:parameters uploadFilePathStr:nil localData:data interfaceName:interName uploadServerName:serverName uploadType:uploadType progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    }];
}
+ (void)streamedRequestUploadStr:(NSString *)uploadStr parameters:(id)parameters uploadFilePathStr:(NSString *)filePathStr localData:(NSData *)data interfaceName:(NSString *)interName uploadServerName:(id)serverName uploadType:(id)uploadType progress:(void(^)(NSProgress * _Nonnull uploadProgress))progress{
    AFURLSessionManager *sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *mutableRequest = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:uploadStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (data) {
            if (!serverName && !uploadType ) {
                [formData appendPartWithFormData:data name:interName];
            }else{
                [formData appendPartWithFileData:data name:interName fileName:serverName mimeType:uploadType];
            }
        }else if(filePathStr){
            NSURL *filePathURL = [NSURL URLWithString:filePathStr];
            if (!serverName && !uploadType ) {
                 [formData appendPartWithFileURL:filePathURL name:interName error:nil];
            }else{
                [formData appendPartWithFileURL:filePathURL name:interName fileName:serverName mimeType:uploadType error:nil];
            }
        }
    } error:nil];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [sessionManager
                  uploadTaskWithStreamedRequest:mutableRequest
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          // ex: Update the progress view
                          progress(uploadProgress);
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];
    
    [uploadTask resume];
}



@end







