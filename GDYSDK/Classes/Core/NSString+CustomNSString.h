//
//  NSString+CustomNSString.h

// func: achieve NSString usually fun

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CustomNSString)

/**
 money code covert money tag

 @param langCode The language or control code.
 @return each country or area money code.
 */
+ (NSString *)eachContryMoneyTagWithLangCode:(NSString *)langCode;


@end

NS_ASSUME_NONNULL_END


