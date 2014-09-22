//
//  UIView+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

@interface UIView (Nerdery)

// If QuartzCore is included
#ifdef QUARTZCORE_H

#pragma mark - Setting view anchor points

/**
 Set a view's transformation anchor point without shifting view frame
 @param anchorPoint A point whose x and y attributes are normalized to the [0, 1] range, where (0.5, 0.5) represents the center of the view's frame
 @author Jesse Hemingway
 */
- (void)nrd_setLayerAnchorPoint:(CGPoint)anchorPoint;

#endif  //#ifdef QUARTZCORE_H

/**
 *  Takes a screenshot of the @c UIView and returns it as a @c UIImage.
 *
 *  @param afterUpdates If the screenshot should be taken after updates.
 *
 *  @return UIImage of the screen.
 *  @author Erik Weiss
 */
- (UIImage *)nrd_imageFromViewAfterUpdates:(BOOL)afterUpdates NS_AVAILABLE_IOS(7_0);

/**
 *  Rounds the specified corners on a @c UIView.
 *
 *  @param radius  The radius of the corners.
 *  @param corners The corners to make rounded.
 *
 *  @author Erik Weiss
 */
- (void)nrd_addRoundedCornersWithCornerRadius:(NSInteger)radius andCorners:(UIRectCorner)corners;

@end
