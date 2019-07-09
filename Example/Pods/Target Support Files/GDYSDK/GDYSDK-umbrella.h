#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BaseUIPublicHeader.h"
#import "CorePublicHeader.h"
#import "Constant.h"
#import "GDYSDK.h"
#import "ToolM.h"

FOUNDATION_EXPORT double GDYSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char GDYSDKVersionString[];

