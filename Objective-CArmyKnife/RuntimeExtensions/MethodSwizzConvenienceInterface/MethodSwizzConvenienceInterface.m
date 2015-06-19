#import "MethodSwizzConvenienceInterface.h"
#import <objc/runtime.h>

void swizz(Class cls, SEL, SEL, Method, Method);
BOOL swizzClassMethod(Class, SEL srcSelector, SEL);
BOOL swizzInstanceMethod(Class, SEL, SEL);
BOOL trySwizz(Class cls, SEL, SEL, Method, Method);

inline void methodSwizz(Class cls, SEL srcSelector, SEL dstSelector) {
    if (swizzInstanceMethod(cls, srcSelector, dstSelector) ||
        swizzClassMethod(cls, srcSelector, dstSelector))
    {
        return;
    }
    printf("\n=====混写失败：srcSelector或dstSelector对应的Method不存在=====\n\n");
}

#pragma mark - 私有实现

inline BOOL swizzInstanceMethod(Class cls, SEL srcSelector, SEL dstSelector) {
    Method srcMethod = class_getInstanceMethod(cls, srcSelector);
    Method dstMethod = class_getInstanceMethod(cls, dstSelector);
    return trySwizz(cls, srcSelector, dstSelector, srcMethod, dstMethod);
}

inline BOOL swizzClassMethod(Class cls, SEL srcSelector, SEL dstSelector) {
    Method srcMethod = class_getClassMethod(cls, srcSelector);
    Method dstMethod = class_getClassMethod(cls, dstSelector);
    return trySwizz(objc_getMetaClass(class_getName(cls)), srcSelector, dstSelector, srcMethod, dstMethod);
}

inline BOOL trySwizz(Class cls, SEL srcSelector, SEL dstSelector, Method srcMethod, Method dstMethod) {
    if ((srcMethod == NULL || dstMethod == NULL)) {
        return FALSE;
    }
    swizz(cls, srcSelector, dstSelector, srcMethod, dstMethod);
    return TRUE;
}

inline void swizz(Class cls, SEL srcSelector, SEL dstSelector, Method srcMethod, Method dstMethod) {
    @synchronized(cls) {
        BOOL didAddMethod = class_addMethod(cls, srcSelector, method_getImplementation(dstMethod), method_getTypeEncoding(dstMethod));
        if (didAddMethod) {
            class_replaceMethod(cls, dstSelector, method_getImplementation(srcMethod), method_getTypeEncoding(srcMethod));
        } else {
            method_exchangeImplementations(srcMethod, dstMethod);
        }
    }
}
