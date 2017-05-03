//
//  UINavigationController+navColor.m
//  TestNav
//
//  Created by 王恒求 on 2016/6/11.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import "UINavigationController+navColor.h"
#import <objc/runtime.h>
#import "UIViewController+navColor.h"
#import "UINavigationBar+BackView.h"
#import "UIColor+Extern.h"


@implementation UINavigationController (navColor)

+(void)initialize
{
    if (self == [UINavigationController self]) {
        // 交换方法
        SEL originalSelector = NSSelectorFromString(@"_updateInteractiveTransition:");
        SEL swizzledSelector = NSSelectorFromString(@"et__updateInteractiveTransition:");
        Method originalMethod = class_getInstanceMethod([self class], originalSelector);
        Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)et__updateInteractiveTransition:(CGFloat)percentComplete
{
    [self et__updateInteractiveTransition:percentComplete];
    
    UIViewController *topVc = self.topViewController;
    if (topVc !=nil) {
        id<UIViewControllerTransitionCoordinator> coor = topVc.transitionCoordinator;
        if (coor != nil) {
            UIColor *fromColor = [coor viewControllerForKey:UITransitionContextFromViewControllerKey].navColor;
            UIColor *toColor = [coor viewControllerForKey:UITransitionContextToViewControllerKey].navColor;
            
            NSString *fromString = [fromColor getRGBAFormat];
            NSString *toString = [toColor getRGBAFormat];
            
            NSLog(@"=======原有的颜色%@,%@",fromString,toString);
            
            if ([fromString isEqualToString:toString]) {
                return;
            } else {
                UIColor *newColor = [self getNewColor:fromString toColor:toString percent:percentComplete];
                [self.navigationBar hq_setBackgroundColor:newColor];
            }
        }
    }
}

-(UIColor*)getNewColor:(NSString*)fromColor toColor:(NSString*)toColor percent:(CGFloat)percent
{
    unsigned int red, green, blue;
    unsigned int alpha;
    NSRange range;
    range.length =2;
    
    unsigned int fromRed, fromGreen, fromBlue, fromAlpha;
    unsigned int toRed, toGreen, toBlue, toAlpha;
    
    NSArray *fromArr = [fromColor componentsSeparatedByString:@"x"];
    fromRed = (unsigned int)[fromArr[0] integerValue];
    fromGreen = (unsigned int)[fromArr[1] integerValue];
    fromBlue = (unsigned int)[fromArr[2] integerValue];
    fromAlpha = (unsigned int)[fromArr[3] integerValue];
    
    NSArray *toArr = [toColor componentsSeparatedByString:@"x"];
    toRed = (unsigned int)[toArr[0] integerValue];
    toGreen = (unsigned int)[toArr[1] integerValue];
    toBlue = (unsigned int)[toArr[2] integerValue];
    toAlpha = (unsigned int)[toArr[3] integerValue];
    
    if (toRed>=fromRed) {
        red = (toRed-fromRed)*percent+fromRed;
    } else {
        red = fromRed-(fromRed-toRed)*percent;
    }
    
    if (toGreen>=fromGreen) {
        green = (toGreen-fromGreen)*percent+fromGreen;
    } else {
        green = fromGreen-(fromGreen-toGreen)*percent;
    }
    
    if (toBlue>=fromBlue) {
        blue = (toBlue-fromBlue)*percent+fromBlue;
    } else {
        blue = fromBlue-(fromBlue-toBlue)*percent;
    }
    
    if (alpha>=fromAlpha) {
        alpha = (toAlpha-fromAlpha)*percent+fromAlpha;
    } else {
        alpha = fromAlpha-(fromAlpha-toAlpha)*percent;
    }
    
//    red = (toRed-fromRed)*percent+fromRed;
//    green = (toGreen-fromGreen)*percent+fromGreen;
//    blue = (toBlue-fromBlue)*percent+fromBlue;
//    alpha = (toAlpha-fromAlpha)*percent+fromAlpha;
    
    NSLog(@"======newColor===%@",[NSString stringWithFormat:@"%dx%dx%dx%d",red,green,blue,alpha]);
    
    return [UIColor colorWithRed:((float) red / 255.0f) green:((float) green / 255.0f) blue:((float) blue / 255.0f) alpha:((float) alpha / 255.0f)];;
}

@end
