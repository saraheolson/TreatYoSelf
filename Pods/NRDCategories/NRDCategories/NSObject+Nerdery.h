//
//  NSObject+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

@interface NSObject (Nerdery)

/**
 Retrieve an array of all properties defined for receiver.
 @discussion Here is a useful example to automate continuous introspection (for us introverts):
 
 @code
 NSArray *properties = [self nrd_allPropertyNames];
 for (NSString *propertyName in properties) {
 
     [self addObserver:self 
            forKeyPath:propertyName
               options:NSKeyValueObservingOptionNew
               context:nil];
 }
 @endcode
 
 @return An array of properties names
 @author Jesse Hemingway
 */
- (NSArray *)nrd_allPropertyNames;

@end
