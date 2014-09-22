//
//  UITextField+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

@interface UITextField (Nerdery)

/**
 Returns if the text field is empty or not, ignoring trimmable whitespace
 @return @c YES if the text field has non-whitespace text, @c NO otherwise
*/
- (BOOL)nrd_hasText;

@end
