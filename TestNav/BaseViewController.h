//
//  BaseViewController.h
//  QiZhiWatch
//
//  Created by 王恒求 on 2017/4/8.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppUtily.h"
#import "UINavigationBar+BackView.h"
#import "UIViewController+navColor.h"

@interface BaseViewController : UIViewController

- (void)addBackButton;
- (void)clickBackButton:(UIButton*)sender;

- (void)removeBackButton;

@end
