//
//  NSDate+Nerdery.m
//
//  Copyright 2014 The Nerdery. All rights reserved.
//

#import "NSDate+Nerdery.h"

@implementation NSDate (Nerdery)

- (NSDate *)nrd_dateByAddingDays:(NSInteger)days
{
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = days;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    return [theCalendar dateByAddingComponents:dayComponent toDate:self options:0];
}

- (BOOL)nrd_isAfterDate:(NSDate *)comparisonDate
{
    return [self compare:comparisonDate] == NSOrderedDescending;
}

@end
