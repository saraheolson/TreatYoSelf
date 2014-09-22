//
//  NSString+Nerdery.m
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

#import "NSString+Nerdery.h"
#import "NSData+Nerdery.h"
#import <CommonCrypto/CommonDigest.h>
#include <sys/utsname.h>

typedef enum hashType {
    hashTypeSHA1 = 1,
    hashTypeMD5
} HashType;

@implementation NSString (Nerdery)

// See: http://www.kominak.com/iphone-sdk-ios/md5-hash-nsstring-nsdata.html and http://stackoverflow.com/a/3469033
+ (NSString *)hashString:(NSString *)string usingHashType:(HashType)hashType
{
    NSParameterAssert(hashType == hashTypeSHA1 || hashType == hashTypeMD5);
    
    NSUInteger length = (hashType == hashTypeSHA1) ? CC_SHA1_DIGEST_LENGTH : CC_MD5_DIGEST_LENGTH;
    unsigned char result[length];
    
    // Convert the string to a C-string and generate the hash
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    if (hashType == hashTypeSHA1) {
        CC_SHA1([stringData bytes], [stringData length], result);
    } else {
        CC_MD5([stringData bytes], [stringData length], result);
    }
    
    // The hash has been calculated and stored in 'result'
    
    // Convert the hash into a lowercase NSString
    NSMutableString *hash = [NSMutableString string];
    for (NSUInteger i = 0; i < length; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}

- (NSString *)nrd_MD5HashString
{
    return [NSString hashString:self usingHashType:hashTypeMD5];
}

- (NSString *)nrd_SHA1HashString
{
    return [NSString hashString:self usingHashType:hashTypeSHA1];
}

- (BOOL)nrd_hasText
{
    return [self length] > 0;
}

+ (NSString *)nrd_documentsDirectoryWithAppendedPath:(NSString *)path
{
    NSString *docsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [docsDirectory stringByAppendingPathComponent:path];
}

- (NSString *)nrd_normalizedString
{
    NSMutableString *result = [NSMutableString stringWithString:self];
    CFStringNormalize((__bridge CFMutableStringRef)result, kCFStringNormalizationFormD);
    CFStringFold((__bridge CFMutableStringRef)result, kCFCompareCaseInsensitive | kCFCompareDiacriticInsensitive | kCFCompareWidthInsensitive, NULL);
    return result;
}

+ (NSString *)nrd_deobfuscatedStringWithBytes:(const void *)bytes length:(NSUInteger)length key:(NSString *)key
{
    NSData *deobfuscatedData = [NSData dataWithBytes:bytes length:length];
    [deobfuscatedData nrd_obfuscateOrDeobfuscateWithKey:key];
    return [[NSString alloc] initWithData:deobfuscatedData encoding:NSUTF8StringEncoding];
}

// Adapted from here: http://stackoverflow.com/questions/800123/best-practices-for-validating-email-address-in-objective-c-on-ios-2-0
// And here: http://cocoawithlove.com/2009/06/verifying-that-string-is-email-address.html
- (BOOL)nrd_isValidEmailAddress
{
    NSString *emailRegex = @"(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-"
    @"z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (NSComparisonResult)nrd_compareToVersionString:(NSString *)version
{
    return [self compare:version options:NSNumericSearch];
}

+ (NSString *)nrd_deviceModelAsString
{
    struct utsname platform;
    int rc = uname(&platform);
    if (rc >= 0) {
        return [NSString stringWithCString:platform.machine encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

@end
