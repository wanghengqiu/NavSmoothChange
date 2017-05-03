//
//  UINavigationBar+BackView.h
//  TestNav
//
//  Created by 王恒求 on 2016/6/11.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (BackView)

@property (nonatomic,retain)UIView *overlay;
- (void)hq_setBackgroundColor:(UIColor *)color;
- (void)hq_reset;
- (void)hq_setTranslationY:(CGFloat)translationY;
- (void)hq_setElementsAlpha:(CGFloat)alpha;

@end
