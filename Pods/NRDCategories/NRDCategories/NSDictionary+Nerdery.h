//
//  NSDictionary+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//


@interface NSDictionary (Nerdery)

/**
*  Returns the object for the given key, if it is in the dictionary, else @c nil.
*
*  When parsing JSON, null keys come back as @c [NSNull @c null]. This returns @c nil instead
*
*  @param aKey The key to use
*
*  @return The object or, if the object was not set in the dictionary or was @c NSNull, @c nil
*/
- (id)nrd_objectOrNilForKey:(id)aKey;

@end
