//
//  GDYSDKInAppPurchase.h
//  GDYSDK
//  Created by GDayao on 2019/7/25.
//


/** func: 内购方法实现 -- <StoreKit-framework>使用
 *  使用代理实现内购方法回调
 * 包含有内购购买，恢复购买，自动订阅处理和订阅退款处理。
 
 // 处理订阅过期 --- https://blog.csdn.net/xyxjn/article/details/17412453
 //客户端在订阅成功后将苹果返回的receipt记录本地，每次程序启动后（防止客户端时间被篡改的情况）向苹果验证一次订阅是否有效，然后执行后续逻辑
 //在订阅到期时（可先由客户端判断订阅是否到期，未到期则不做处理，客户端判断到期则先向服务器验证是否真的订阅到期，若服务器也判断为订阅到期，则说明确实到期），服务器用之前记录的receipt向苹果再次验证，通过苹果返回的错误码来判断用户已经自动续订还是手动取消订阅。
 //在这个过程中，客户端不需要做任何处理，只需要走check订阅有效期的流程即可。（当客户端判断出用户已经不在有效期后，会向服务器请求，服务器会将新的有效期下发给客户端。
 */


/** 注：有两点需要关注 ****
 *    1. 内购监听方法 `addTransactionObserver`，若是放在 `viewDidLoad` 中处理,注意取消内购监听方法 `removeTransactionObserver`.
 *    2.取消内购监听方法，若是放在`viewWillDisappear`方法中，注意付费界面跳转导致的取消内购监听操作；若出现取消内购监听，从新加入内购监听 -配对-`viewWillAppear`.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GDYSDKInAppPurchaseDelegate <NSObject>

#pragma mark <SKProductsRequestDelegate>
// no product information 未收到产品信息 -- 产品内购id为空 <SKProductsRequestDelegate>
- (void)productRequestInReceiveResponseWithNullProduct;

#pragma mark <SKRequestDelegate>
// SKRequest <SKRequestDelegate>
- (void)SKRequestInDidFinish;
- (void)SKRequestInDidFailWithError:(NSError *)error;

#pragma mark <SKPaymentTransactionObserver>
// transaction observer <SKPaymentTransactionObserver>
/**
 complete transcation

 @param productId 内购产品id.
 @param receiptString receipt string with base64 encoded string.
 @param transactionId transaction identifier.
 */
- (void)completeTransactionWithProductId:(NSString *)productId transactionReceipt:(NSString *)receiptString transactionId:(NSString *)transactionId;
/**
 内购商品加入购物车
 */
- (void)purchasingTransactionInSKPayment;
/**
 restore transaction

 @param productId 内购产品id.
 @param receiptString receipt string with base64 encoded string.
 @param transactionId transaction identifier.
 */
- (void)restoreTransactionWithProductId:(NSString *)productId transactionReceipt:(NSString *)receiptString transactionId:(NSString *)transactionId;
/**
 内购商品购买失败

 @param productId product id-内购商品id
 @param errorLocalizedDescription 错误信息
 */
- (void)gdysdkIAPFailTransactionWithProductId:(NSString *)productId errorLocalizedDescription:(NSString *)errorLocalizedDescription;



@end


@interface GDYSDKInAppPurchase : NSObject

@property (nonatomic,weak)id <GDYSDKInAppPurchaseDelegate> deleagte;


#pragma mark - In-App purchase
/**
 add transaction observer -- 设置内购监听

 @param observer 设置内购监听对象--可不传
 */
- (void)addTransactionObserver:(id)observer;
/**
 remove transaction observer -- 移除设置的内购监听

 @param observer 移除设置的内购监听--可不传
 */
- (void)removeTransactionObserver:(id)observer;
/**
 传入对应productId-内购id进行app内验证
 实现相应的内购监听，实现GDYSDKInAppPurchaseDelegate代理方法即可。

 @param productId 应用内购id-注意区分多个内购id
 */
- (void)requestProductIdData:(NSString *)productId;

/**
 restore product - 恢复购买
 */
- (void)restoreProductId;






@end

NS_ASSUME_NONNULL_END

