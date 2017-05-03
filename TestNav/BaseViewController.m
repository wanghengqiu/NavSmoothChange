//
//  BaseViewController.m
//  QiZhiWatch
//
//  Created by 王恒求 on 2017/4/8.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import "BaseViewController.h"
#import "AppUtily.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEX2RGB(kBackgroundColor);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)addBackButton{
    UIBarButtonItem *backBtn = nil;
    if(self.presentingViewController != nil && self == [self.navigationController.viewControllers firstObject]){
        backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"web_back_nor"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackButton:)];
    }
    else{
        backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"web_back_nor"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackButton:)];
    }
    self.navigationItem.leftBarButtonItem = backBtn;
}

- (void)clickBackButton:(UIButton*)sender{
    if(self.presentingViewController != nil){
        if(self.navigationController == nil){
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
        else if(self == [self.navigationController.viewControllers firstObject]){
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        NSMutableArray* tempArr=[self.navigationController.viewControllers mutableCopy];
        
        if (tempArr.count>=2) {
            UIViewController* tempVc=tempArr[1];
            [self.navigationController.navigationBar hq_setBackgroundColor:tempVc.navColor];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)removeBackButton {
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];;
    self.navigationItem.leftBarButtonItem = backBtn;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
