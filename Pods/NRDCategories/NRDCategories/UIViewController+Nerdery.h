//
//  UIViewController+Nerdery.h
//
//  Copyright 2013 The Nerdery. All rights reserved.
//


@interface UIViewController (Nerdery)

/**
*  Convenience method to add a child view controller to a content view controller.
*
*  Alternative to framework's addChildViewController: method, properly calling childVC's didMoveToParentViewController: method. childVC.view is automatically added as a subview of self.view (via addSubview:) and sized to self.view.bounds.  The frame and view index can be safely and efficiently modified after call and before presentation.
*
*  @param childViewController A UIViewController to add to receiver's view controller chain
*
*  @attention Using this does @b NOT absolve you from knowing the view controller lifecycle
*  @see https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/CreatingCustomContainerViewControllers/CreatingCustomContainerViewControllers.html#//apple_ref/doc/uid/TP40007457-CH18-SW12
*  @author Jesse Hemingway
*/
- (void)nrd_addChildViewController:(UIViewController *)childViewController;

/**
 *  Convenience method to add a child view controller to a content view controller, targeting a particular subview for containment.
 *
 *  Alternative to framework's addChildViewController: method, properly calling childVC's didMoveToParentViewController: method. childVC.view is automatically added as a subview of self.view (via addSubview:) and sized to self.view.bounds.  The frame and view index can be safely and efficiently modified after call and before presentation.
 *
 *  @param childViewController A UIViewController to add to receiver's view controller chain
 *  @param parentView          A UIView that the childVC's view should be added to as a subview. The childVC's view's frame will be set to parentView's bounds.
 *  
 *  @attention Using this does @b NOT absolve you from knowing the view controller lifecycle
 *  @see https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/CreatingCustomContainerViewControllers/CreatingCustomContainerViewControllers.html#//apple_ref/doc/uid/TP40007457-CH18-SW12
 *  @author Joshua Sullivan
 */
- (void)nrd_addChildViewController:(UIViewController *)childViewController inView:(UIView *)parentView;
 
/**
 *  Convenience method to remove a child view controller from a content view controller.
 *
 *  Alternative to framework's removeFromParentViewController: method, properly calling childVC's willMoveToParentViewController: method. childVC.view is automatically removed from superview.
 *
 *  @param childViewController A UIViewController to remove from receiver's view controller chain
 *
 *  @attention Using this does @b NOT absolve you from knowing the view controller lifecycle
 *  @see https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/CreatingCustomContainerViewControllers/CreatingCustomContainerViewControllers.html#//apple_ref/doc/uid/TP40007457-CH18-SW12
 *  @author Jesse Hemingway
 */
- (void)nrd_removeChildViewController:(UIViewController *)childViewController;

@end
