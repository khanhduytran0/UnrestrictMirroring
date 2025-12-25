@import Darwin;
@import Foundation;
#import <substrate.h>

id (*orig_MGCopyAnswer_internal)(NSString *property, uint64_t x1);
id hook_MGCopyAnswer_internal(NSString *property, uint64_t x1) {
    if ([property isEqualToString:@"SigningFuse"]) {
        return @(NO); // spoof dev-fused for dtremotedisplayd
    }
    return orig_MGCopyAnswer_internal(property, x1);
}

%ctor {
    NSString *processName = @(basename(argv[0]));
    if ([processName isEqualToString:@"dtremotedisplayd"]) {
        uint32_t *func = (uint32_t *)ptrauth_strip(dlsym(RTLD_DEFAULT, "MGCopyAnswer"), ptrauth_key_function_pointer);
        //func[0] == 0xd2800001
        int32_t off = func[1] & 0x3FFFFFF;
        if (off & (1 << 25)) off |= 0xFC000000;
        off <<= 2;
        MSHookFunction((void *)((uintptr_t)&func[1] + off), (void *)hook_MGCopyAnswer_internal, (void **)&orig_MGCopyAnswer_internal);
    }
}
