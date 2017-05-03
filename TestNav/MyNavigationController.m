//
//  MyNavigationController.m
//  QiZhiWatch
//
//  Created by 王恒求 on 2017/4/8.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import "MyNavigationController.h"
#import "UIImage+Extern.h"
#import "AppUtily.h"
#import "UINavigationBar+BackView.h"
#import "UIViewController+navColor.h"

@interface MyNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation MyNavigationController

+ (void)load
{
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]= [UIFont boldSystemFontOfSize:18];
    dic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
//    [bar setBackgroundImage:[UIImage imageWithColor:HEX2RGB(kNavBackgroundColor)] forBarMetrics:UIBarMetricsDefault];
    [bar setTintColor:[UIColor whiteColor]];
    [bar setTranslucent:YES];
    [bar setShadowImage:[UIImage new]];
//    [bar hq_setBackgroundColor:HEX2RGB(kNavBackgroundColor)];
    
    
    NSMutableDictionary *dicBar = [NSMutableDictionary dictionary];
    dicBar[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dicBar[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [bar setTitleTextAttributes:dicBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf(self);
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakself;
        self.delegate = weakself;
    }
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"web_back_nor"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
    }
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated)
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated)
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated)
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return [super popToViewController:viewController animated:animated];
}

#pragma mark - UINavigationController Delegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer)
    {
        if (self.viewControllers.count < 2 || self.visibleViewController == self.viewControllers[0])
        {
            return NO;
        }
    }
    
    return YES;
}

- (void)back
{
    NSArray* tempArr = [self.viewControllers mutableCopy];
    if (tempArr.count>=2) {
        UIViewController *tempVc=(UIViewController*)tempArr[tempArr.count-2];
        UIColor *tempColor = tempVc.navColor;
//        [self.navigationBar hq_setBackgroundColor:tempColor];
        [UIView animateWithDuration:0.3 animations:^{
            [self.navigationBar hq_setBackgroundColor:tempColor];
        }];
    }
    
    [self popViewControllerAnimated:YES];
}


@end
