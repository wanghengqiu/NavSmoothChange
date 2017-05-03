//
//  ShouyeViewController.m
//  TestNav
//
//  Created by 王恒求 on 2016/6/11.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import "ShouyeViewController.h"
#import "HomeViewController.h"
#import "UIViewController+navColor.h"

@interface ShouyeViewController ()

@end

@implementation ShouyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* testBtn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    testBtn.backgroundColor=[UIColor redColor];
    [testBtn addTarget:self action:@selector(testBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    [self.navigationController.navigationBar hq_setBackgroundColor:HEX2RGB(kNavBackgroundColor)];
    
    self.navColor = HEX2RGB(kNavBackgroundColor);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navColor = HEX2RGB(kNavBackgroundColor);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navColor = HEX2RGB(kNavBackgroundColor);
}

-(void)testBtnClicked
{
    HomeViewController* vc=[[HomeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
