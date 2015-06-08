@import Foundation;

/**
 *  线程安全的混写，先尝试混写实例方法，再尝试混写类方法
 *  全部尝试失败时，输出“混写失败：srcSelector或dstSelector对应的Method不存在”
 *
 *  @param cls         需要混写的类
 *  @param srcSelector 原始选择器
 *  @param dstSelector 目标选择器
 */
extern void methodSwizz(Class cls, SEL srcSelector, SEL dstSelector);
