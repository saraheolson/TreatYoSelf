//
//  UIView+Nerdery.m
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

#import "UIView+Nerdery.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Nerdery)


- (void)nrd_setLayerAnchorPoint:(CGPoint)anchorPoint
{
    CGRect frame = self.frame;
    CGFloat xDif = anchorPoint.x - self.layer.anchorPoint.x;
    CGFloat yDif = anchorPoint.y - self.layer.anchorPoint.y;
    frame.origin.x += xDif * frame.size.width;
    frame.origin.y += yDif * frame.size.height;
    self.frame = frame;
    self.layer.anchorPoint = anchorPoint;
}

- (UIImage *)nrd_imageFromViewAfterUpdates:(BOOL)afterUpdates
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, self.window.screen.scale);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}

- (void)nrd_addRoundedCornersWithCornerRadius:(NSInteger)radius andCorners:(UIRectCorner)corners
{
    // Optimization
    if (corners == UIRectCornerAllCorners) {
        self.layer.cornerRadius = radius;
        return;
    }
    
    self.layer.cornerRadius = 0;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
