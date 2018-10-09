//
//  NSString+CustomNSString.h

// func: achieve NSString usually fun

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CustomNSString)


#pragma mark - ---- money code covert money tag
+ (NSString *)eachContryMoneyTagWithLangCode:(NSString *)langCode;


@end

NS_ASSUME_NONNULL_END


