//
//  NSString+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

@interface NSString (Nerdery)

/**
 Returns the MD5 hash of the receiver.
 @return MD5 hash of the receiver
 @author Jay Peyer
*/
- (NSString *)nrd_MD5HashString;

/**
 Returns the SHA1 hash of the receiver.
 @return SHA1 hash of the receiver
 @author Jay Peyer
 */
- (NSString *)nrd_SHA1HashString;

/**
 Checks to see if the receiver is not empty string (@"").
 @return @c YES if the receiver is not empty string (@""), else @c NO.
 @author Jay Peyer
 */
- (BOOL)nrd_hasText;

/**
 Returns a path to the documents directory with given path appended to the end (using -[NSString stringByAppendingPathComponent:]).
 @param path The path to append to the end of the NSDocuments directory
 @return A NSString path to the documents directory with given path appended to the end (using  -[NSString stringByAppendingPathComponent:]).
 @author Jay Peyer
 */
+ (NSString *)nrd_documentsDirectoryWithAppendedPath:(NSString *)path;

/**
 Returns a normalized version of the receiver.
 @discussion First uses CFStringNormalize with parameter kCFStringNormalizationFormD.
 Then folds the string to remove case distinctions, accents and other diacritics, and normalize width (by mapping 
 characters in the range U+FF00-U+FFEF to their ordinary equivalents).
 @return A normalized version of the receiver.
 @see CFStringNormalize
 @see CFStringFold
 @see https://devforums.apple.com/message/363871#363871
 @author Jay Peyer
 */
- (NSString *)nrd_normalizedString;

/**
 Returns the string created by deobfuscating the given bytes & length (obfuscated using -[NSData(Nerdery) obfuscateOrDeobfuscateWithKey:]) using the given key.
 @discussion Relies on NRDCategory defined in NSData+Nerdery.
 @param bytes The obfuscated bytes (obfuscated using -[NSData(Nerdery) obfuscateOrDeobfuscateWithKey:])
 @param length The length of the obfuscated bytes
 @param key The key to deobfuscate the data
 @return The deobfuscated string
 @see NSData+Nerdery
 @author Jay Peyer
 */
+ (NSString *)nrd_deobfuscatedStringWithBytes:(const void *)bytes length:(NSUInteger)length key:(NSString *)key;

/**
 Is this NSString a valid email address?
 @return YES if valid, NO if invalid
 @author Josh Klun
 */
- (BOOL)nrd_isValidEmailAddress;

/**
 *  Compare the receiver to the dotted form <major>.<minor>[.<build>[.<revision>[...]]] version.
 *
 *  @param version The version to compare to
 *
 *  @return An NSComparisonResult indicating whether versionA is less than, equal to or greater than versionB
 *  @author Jesse Hemingway
 */
- (NSComparisonResult)nrd_compareToVersionString:(NSString *)version;

/**
 This method returns the device model as a string representation in the form <device><generation>,<sub-generation>, although this is not particularly consistent.  
 @discussion An updated list of common model strings is out of scope for this discussion.  For more complete solutions, check out http://github.com/erica/uidevice-extension/.  Note that this should NOT be used to determine feature availability.  This should only be used to predict levels of hardware performance not easily queried or measured, or for custom analytics.  This is a simple implementation that relies on a call to uname(), if you want to look it up.
 @return A string representing the device model
 @author Jesse Hemingway
 */
+ (NSString *)nrd_deviceModelAsString;


@end
