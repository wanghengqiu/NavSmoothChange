//
//  HomeViewController.m
//  TestNav
//
//  Created by 王恒求 on 2016/6/11.
//  Copyright © 2016年 王恒求. All rights reserved.
//

#import "HomeViewController.h"

#define NAVBAR_CHANGE_POINT 50

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, retain) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets= NO;
    
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.rowHeight=50;
    [self.view addSubview:self.tableView];
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    image.image=[UIImage imageNamed:@"bg"];
    self.tableView.tableHeaderView=image;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        
        self.navColor=[[UIColor blueColor] colorWithAlphaComponent:alpha];
    } else {
        self.navColor=[[UIColor blueColor] colorWithAlphaComponent:0];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.tableView.delegate = nil;
//    [self.navigationController.navigationBar hq_reset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}

static NSString* cellIdnetifier = @"CellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdnetifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdnetifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSString* titleStr = @"测试";
    cell.textLabel.text = titleStr;
    cell.textLabel.textColor = HEX2RGB(@"888888");
    return cell;
}

@end
