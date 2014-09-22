//
//  UIViewController+Nerdery.m
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

#import "UIViewController+Nerdery.h"

@implementation UIViewController (Nerdery)

- (void)nrd_addChildViewController:(UIViewController *)childViewController
{
    [self nrd_addChildViewController:childViewController inView:self.view];
}

- (void)nrd_addChildViewController:(UIViewController *)childViewController inView:(UIView *)parentView
{
    [self addChildViewController:childViewController];
    childViewController.view.frame = parentView.bounds;
    [parentView addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)nrd_removeChildViewController:(UIViewController *)childViewController
{
    [childViewController.view removeFromSuperview];
    [childViewController willMoveToParentViewController:nil];
    [childViewController removeFromParentViewController];
}


@end
