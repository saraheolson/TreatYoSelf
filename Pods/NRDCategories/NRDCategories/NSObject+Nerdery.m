//
//  NSObject+Nerdery.m
//
//  Copyright 2013 The Nerdery. All rights reserved.
//


#import <objc/runtime.h>
#import "NSObject+Nerdery.h"

@implementation NSObject (Nerdery)

- (NSArray *)nrd_allPropertyNames
{
    NSString *propertyName;
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [array addObject:propertyName];
    }
    free(properties);
    
    return array;
}

@end
