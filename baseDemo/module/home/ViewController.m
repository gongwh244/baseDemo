//
//  ViewController.m
//  baseDemo
//
//  Created by gongweiqiang on 15-3-17.
//  Copyright (c) 2015年 Holl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet tabbarView *tabView;

@property (nonatomic,strong) NSMutableArray *childArray;
@property (nonatomic,strong) NSMutableArray *nameArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    scrollViewController *scrollVC = [story instantiateViewControllerWithIdentifier:@"scroll"];
    scrollVC.delegate = self;
    [self addChildViewController:scrollVC];
    [self.view addSubview:scrollVC.view];
    scrollVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollVC.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollVC.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollVC.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollVC.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [self updateViewConstraints];
    
    _tabView.delegate = self;
    [_tabView reloadData];
    
    _childArray = [[NSMutableArray alloc] init];
    _nameArray = [[NSMutableArray alloc] initWithObjects:@"one",@"two",@"three", nil];
    for (int i = 0; i < 3; i++) {
        UIStoryboard *storys = [UIStoryboard storyboardWithName:_nameArray[i] bundle:nil];
        UIViewController *vc = [storys instantiateViewControllerWithIdentifier:_nameArray[i]];
        [_childArray addObject:vc];
    }
    [self buttonClick:0];
}

- (void)enterHomeViewController
{
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isKindOfClass:[scrollViewController class]]) {
            
            [UIView animateWithDuration:1.0f animations:^{
                vc.view.alpha = 0.0f;
            } completion:^(BOOL finished) {
                [vc.view removeFromSuperview];
                [vc removeFromParentViewController];
            }];
        }
    }
}

- (NSInteger)tabbarViewNumOfItem:(tabbarView *)tabbar
{
    return 3;
}

//- (UIView *)tabbarViewItem:(tabbarView *)tabbar index:(NSInteger)index
//{
//    
//}

- (void)buttonClick:(NSInteger)index
{
    UIViewController *vc = _childArray[index];
    [self addChildViewController:vc];
    [self.contentView addSubview:vc.view];
    vc.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:vc.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:vc.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:vc.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:vc.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f]];
    [self updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
