//
//  UIImage+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

@interface UIImage (Nerdery)

/**
*  For the image, returns an image that is oriented in the proper direction based on the
*  receiver's imageOrientation.
*
*  @return Properly rotated image
*  @author Thomas Martin
*/
- (UIImage *)nrd_imageByFixingOrientation;

@end
