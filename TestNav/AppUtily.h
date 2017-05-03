//
//  AppUtily.h
//  QiZhiWatch
//
//  Created by 王恒求 on 2016/2/12.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kBackgroundColor        @"#efeff4"
#define kNavBackgroundColor     @"#db3f34"

/* 强弱引用的宏*/
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;

#define HEX2RGB(string) [AppUtily colorWithName:string]

@interface AppUtily : NSObject

+ (UIColor *)colorWithName:(NSString *)name;

@end
