//
//  ObjcRuntimeMgr.m


#import "ObjcRuntimeMgr.h"

#import <objc/runtime.h>


@implementation ObjcRuntimeMgr


#pragma mark - objc

// selector whether responds method
+ (BOOL)whetherRespondsMethodWithSEL:(id)respondsSEL methodSEL:(SEL)methodSEL{
    BOOL whetherResponds = [respondsSEL respondsToSelector:methodSEL]; // methodSEL <==> @selector(whetherRespondsMethodWithSEL:methodSEL:)
    return whetherResponds;
}


// perform selector to call method without parameter
+ (void)callMethodToPerformSelector:(SEL)methodSEL withSelfSEL:(id)respondsSEL{
    if ([respondsSEL respondsToSelector:methodSEL]) {
        // It has warning.
        //[respondsSEL performSelector:methodSEL];
        
        // So you can this. ==> 通过类似C函数指针的方法通过地址调用这个方法
        //  方法名 -> 方法id -> 方法内存地址 -> 根据方法地址调用方法
        IMP imp = [self methodForSelector:methodSEL];
        void(* func)(id,SEL) = (typeof(func))imp; // (void *)imp ==> 告诉编译器不用报类型强转的warning
        func(respondsSEL,methodSEL);
    }
}
//+ (void)withParaCallMethodToPerformSelector:(SEL)methodSEL withSelfSEL:(id)respondsSEL{
//    SEL testSelector[] = {
//        @selector(testOne),
//        @selector(testTwo),
//        @selector(testThree),
//    };
//    SEL selector = NSSelectorFromString(@"testOne:testMethod:");
//    IMP imp = [respondsSEL methodForSelector:methodSEL];
//    BOOL (*func)(id, SEL, NSString *, NSString *) = (void *)imp;
//    BOOL result = respondsSEL ?
//    func(respondsSEL, methodSEL, paraStr, paraStrTwo) : NO;
//}



#pragma mark - info
- (instancetype)initPublicModelWithAcdTcype:(NSString *)acdtcype appKey:(NSString *)appkey {
    self = [super init];
    if (self) {
        
        //  TODO: 使用objc-runtime
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        if (properties) {
            for (int i = 0; i < outCount; i ++) {
                objc_property_t property = properties[i];
                NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                
                if ( [acdtcype isEqualToString:propertyName] ) {
                    NSString *value = [NSString stringWithFormat:@"%@",appkey];
                    [self setValue:value forKey:propertyName];
                    
                    break;
                }
            }
        }
        //立即释放properties指向的内存
        free(properties);
        
    }
    return self;
}


- (instancetype)initPublicModelWithZone:(NSString *)zone churry:(NSInteger)churry asdstsyspse:(NSInteger)asdstsyspse {
    self = [super init];
    if (self) {
        
        unsigned int outCount;
        objc_property_t * properties = class_copyPropertyList([self class], &outCount);
        if (properties) {
            for (int i = 0; i < outCount; i ++) {
                objc_property_t property = properties[i];
                //通过property_getName函数获得属性的名字
                NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                
                if ( [zone isEqualToString:propertyName] ) {
                    BOOL isChurry = churry==1?YES:NO;
                    [self setValue:@(isChurry) forKey:propertyName];
                    
                    break;
                }
            }
        }
        //立即释放properties指向的内存
        free(properties);
    }
    
    return self;
}








@end


