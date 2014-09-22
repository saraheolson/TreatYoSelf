//
//  UINavigationController+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//

@interface UINavigationController (Nerdery)

/**
*  Removes the top view controller (the visible one) and replaces it with another
*  view controller. The @c count of the @c viewControllers array will be the same
*  after invocation.
*
*  @param viewController
*  @param animated
*
*  @author Jay Peyer
*/
- (void)nrd_replaceTopViewControllerWithViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 *  Pop all view controllers and push a new root view controller, optionally animated
 *
 *  @param viewController The new top view controller
 *  @param animated       Specify @c YES to animate the transition or @c NO if you do not want the transition to be animated.
 *
 *  @author Jay Peyer
 */
- (void)nrd_popViewControllersAndPushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
