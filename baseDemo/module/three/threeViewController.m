//
//  threeViewController.m
//  baseDemo
//
//  Created by gongweiqiang on 15-3-17.
//  Copyright (c) 2015年 Holl. All rights reserved.
//

#import "threeViewController.h"
#import "MJRefresh.h"
@interface threeViewController ()
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation threeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myTableView.tableFooterView = [[UIView alloc] init];
    
    __weak UITableView *tableView = _myTableView;
    [_myTableView addHeaderWithCallback:^{
        NSLog(@"header refresh");
        [tableView headerEndRefreshing];
    }];
    [_myTableView addFooterWithCallback:^{
        NSLog(@"footer refresh");
        [tableView footerEndRefreshing];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"three will appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"three will disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
