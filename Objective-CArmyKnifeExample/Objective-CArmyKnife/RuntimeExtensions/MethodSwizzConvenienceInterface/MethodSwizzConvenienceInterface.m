#import "MethodSwizzConvenienceInterface.h"
#import <objc/runtime.h>

void swizz(Class cls, SEL srcSelector, SEL dstSelector, Method srcMethod, Method dstMethod);
void swizzClassMethod(Class cls, SEL srcSelector, SEL dstSelector);
void swizzInstanceMethod(Class cls, SEL srcSelector, SEL dstSelector);
BOOL validateMethod(Method srcMethod, Method dstMethod);

inline void methodSwizz(Class cls, SEL srcSelector, SEL dstSelector) {
    swizzInstanceMethod(cls, srcSelector, dstSelector);
    swizzClassMethod(cls, srcSelector, dstSelector);
}

#pragma mark - 私有实现

inline void swizzInstanceMethod(Class cls, SEL srcSelector, SEL dstSelector) {
    Method srcMethod = class_getInstanceMethod(cls, srcSelector);
    Method dstMethod = class_getInstanceMethod(cls, dstSelector);
    swizz(cls, srcSelector, dstSelector, srcMethod, dstMethod);
}

inline void swizzClassMethod(Class cls, SEL srcSelector, SEL dstSelector) {
    Method srcMethod = class_getClassMethod(cls, srcSelector);
    Method dstMethod = class_getClassMethod(cls, dstSelector);
    if (validateMethod(srcMethod, dstMethod)) {
        printf("\n混写失败：srcSelector或dstSelector对应的Method不存在\n");
        return;
    }
    swizz(cls, srcSelector, dstSelector, srcMethod, dstMethod);
}

inline BOOL validateMethod(Method srcMethod, Method dstMethod) {
    return (srcMethod == NULL || dstMethod == NULL) ? FALSE : TRUE;
}

inline void swizz(Class cls, SEL srcSelector, SEL dstSelector, Method srcMethod, Method dstMethod) {
    @synchronized(cls) {
        if (class_addMethod(cls, srcSelector, method_getImplementation(dstMethod), method_getTypeEncoding(dstMethod))) {
            class_replaceMethod(cls, dstSelector, method_getImplementation(srcMethod), method_getTypeEncoding(srcMethod));
        } else {
            method_exchangeImplementations(srcMethod, dstMethod);
        }
    }
}
