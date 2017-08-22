//
//  XDNavigationController.m
//  UINavigationControllerPushBug
//
//  Created by suxinde on 2017/8/22.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import "XDNavigationController.h"

@interface XDNavigationController () <UINavigationControllerDelegate>

@property (nonatomic, assign) BOOL shouldIgnorePushingViewControllers;

@property (weak, nonatomic) id <UINavigationControllerDelegate> originalDelegate;

@end

@implementation XDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setDelegate:self];
}


- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate {
    if (delegate != self) {
        self.originalDelegate = delegate;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (!self.shouldIgnorePushingViewControllers) {
        [super pushViewController:viewController animated:animated];
    }
    self.shouldIgnorePushingViewControllers = YES;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:willShowViewController:animated:)]) {
        [self.originalDelegate navigationController:navigationController
                             willShowViewController:viewController
                                           animated:animated];
    }
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:didShowViewController:animated:)]) {
        [self.originalDelegate navigationController:navigationController
                              didShowViewController:viewController
                                           animated:animated];
    }
    self.shouldIgnorePushingViewControllers = NO;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:)]) {
        return [self.originalDelegate navigationController:navigationController
                           animationControllerForOperation:operation fromViewController:fromVC toViewController:toVC];
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:interactionControllerForAnimationController:)]) {
        return [self.originalDelegate navigationController:navigationController interactionControllerForAnimationController:animationController];
    }
    return nil;
}


@end
