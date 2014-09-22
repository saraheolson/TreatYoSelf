//
//  NSMutableDictionary+Nerdery.m
//
//  Copyright (c) 2012 The Nerdery. All rights reserved.
//

#import "NSMutableDictionary+Nerdery.h"

@implementation NSMutableDictionary (Nerdery)

- (void)nrd_setNullOrObject:(id)anObject forKey:(id)aKey
{
    [self setObject:(anObject ? anObject : [NSNull null]) forKey:aKey];
}

- (void)nrd_setEmptyStringOrObject:(id)anObject forKey:(id)aKey
{
    [self setObject:(anObject ? anObject : @"") forKey:aKey];
}

- (void)nrd_setZeroOrObject:(id)anObject forKey:(id)aKey
{
    [self setObject:(anObject ? anObject : [NSNumber numberWithInt:0]) forKey:aKey];
}

@end
