//#import "UIDevice+Extensions.h"
//
//#include <sys/socket.h> // Per msqr
//#include <sys/sysctl.h>
//#include <net/if.h>
//#include <net/if_dl.h>
//
//@interface UIDevice(Private)
//
//- (NSString *) macaddress;
//
//@end
//
//@implementation UIDevice (IdentifierAddition)
//
//////////////////////////////////////////////////////////////////////////////////
//#pragma mark -
//#pragma mark Private Methods
//
//// Return the local MAC addy
//// Courtesy of FreeBSD hackers email list
//// Accidentally munged during previous update. Fixed thanks to erica sadun & mlamb.
//- (NSString *) macaddress{
//    
//    int                 mib[6];
//    size_t              len;
//    char                *buf;
//    unsigned char       *ptr;
//    struct if_msghdr    *ifm;
//    struct sockaddr_dl  *sdl;
//    
//    mib[0] = CTL_NET;
//    mib[1] = AF_ROUTE;
//    mib[2] = 0;
//    mib[3] = AF_LINK;
//    mib[4] = NET_RT_IFLIST;
//    
//    if ((mib[5] = if_nametoindex("en0")) == 0) {
//        printf("Error: if_nametoindex error\n");
//        return NULL;
//    }
//    
//    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
//        printf("Error: sysctl, take 1\n");
//        return NULL;
//    }
//    
//    if ((buf = malloc(len)) == NULL) {
//        printf("Could not allocate memory. error!\n");
//        return NULL;
//    }
//    
//    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
//        printf("Error: sysctl, take 2");
//        free(buf);
//        return NULL;
//    }
//    
//    ifm = (struct if_msghdr *)buf;
//    sdl = (struct sockaddr_dl *)(ifm + 1);
//    ptr = (unsigned char *)LLADDR(sdl);
//    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
//                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
//    free(buf);
//    
//    return outstring;
//}
//
//////////////////////////////////////////////////////////////////////////////////
//#pragma mark -
//#pragma mark Public Methods
//
//- (NSString *) SFAgentUniqueDeviceIdentifier{
//    NSString *macaddress = [[UIDevice currentDevice] macaddress];
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
//    
//    NSString *stringToHash = [NSString stringWithFormat:@"%@%@",macaddress,bundleIdentifier];
//    NSString *uniqueIdentifier = [UtilityHelper md5:stringToHash];
//    
//    return uniqueIdentifier;
//}
//
//- (NSString *) uniqueGlobalDeviceIdentifier{
//    NSString *macaddress = [[UIDevice currentDevice] macaddress];
//    NSString *uniqueIdentifier = [UtilityHelper md5:macaddress];
//    
//    return uniqueIdentifier;
//}
//
//
////- (BOOL)isJailbroken
////{
////    BOOL  jailbroken = NO;
////    NSString *cydiaPath = @"/Applications/Cydia.app";
////
////    NSString *aptPath = @"/private/var/lib/apt/";
////
////    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
////
////        jailbroken = YES;
////
////    }
////
////    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
////
////        jailbroken = YES;
////
////    }
////
////    return jailbroken;
////}
//
//- (NSString *) platform
//{
//    size_t size;
//    
//    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
//    
//    char *machine = malloc(size);
//    
//    sysctlbyname("hw.machine", machine, &size, NULL, 0);
//    
//    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
//    
//    free(machine);
//    
//    return platform;
//}
//
//- (NSString *) platformString
//{
//    NSString *platform = [self platform];
//    
//    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
//    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//    if ([platform isEqualToString:@"iPhone3,2"] || [platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
//    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
//    if ([platform isEqualToString:@"iPhone5,3"] || [platform isEqualToString:@"iPhone5,4"]) {
//        return @"iPhone 5C";//add by tongkun
//    }
//    if ([platform isEqualToString:@"iPhone6,2"] || [platform isEqualToString:@"iPhone6,1"]) {
//        return @"iPhone 5S";//add by tongkun
//    }
//    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
//    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
//    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
//    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
//    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
//    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
//    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
//    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
//    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
//    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
//    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"])
//        return @"Simulator";
//    return @"";
//}
//
//@end
