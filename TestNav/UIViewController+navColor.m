//
//  UIViewController+navColor.m
//  TestNav
//
//  Created by 王恒求 on 2016/6/11.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import "UIViewController+navColor.h"
#import <objc/runtime.h>
#import "UINavigationBar+BackView.h"

@implementation UIViewController (navColor)

//定义常量 必须是C语言字符串
static char *NavColorKey = "NavColorKey";

-(void)setNavColor:(UIColor *)navColor
{
    /*
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     */
    
    objc_setAssociatedObject(self, NavColorKey, navColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self.navigationController.navigationBar hq_setBackgroundColor:navColor];
}

-(UIColor*)navColor
{
    return objc_getAssociatedObject(self, NavColorKey);
}

@end
