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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - delegate

- (NSInteger)tabbarViewNumOfItem:(tabbarView *)tabbar
{
    return 3;
}

- (void)tabbarViewItem:(UIView *)tabItem index:(NSInteger)index
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    if (0 == index) {
        imageView.image = [UIImage imageNamed:@"home_f"];
    }else{
        imageView.image = [UIImage imageNamed:@"home"];
    }
    [tabItem addSubview:imageView];
    
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:tabItem attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:tabItem attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44]];
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44]];
    [tabItem updateConstraints];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = [NSString stringWithFormat:@"%ld0000",index];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    if (0 == index) {
        titleLabel.textColor = [UIColor redColor];
    }else{
        titleLabel.textColor = [UIColor blackColor];
    }
    titleLabel.font = [UIFont systemFontOfSize:15];
    [tabItem addSubview:titleLabel];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:tabItem attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:tabItem attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44]];
    [tabItem addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:15]];
    [tabItem updateConstraints];
}

- (void)tabbarViewAction:(tabbarView *)tabbar clickIndex:(NSInteger)index
{
    for (int i = 0; i < tabbar.count; i++) {
        if (index == i) {
            
            UIView *view = [tabbar viewWithTag:1000 + index];
            for (UIView *tmp in view.subviews) {
                if ([tmp isKindOfClass:[UIImageView class]]) {
                    UIImageView *tmpImage = (UIImageView *)tmp;
                    [tmpImage setImage:[UIImage imageNamed:@"home_f"]];
                }else{
                    UILabel *label = (UILabel *)tmp;
                    label.textColor = [UIColor redColor];
                }
            }
        }else{
            
            UIView *view = [tabbar viewWithTag:1000 + i];
            for (UIView *tmp in view.subviews) {
                if ([tmp isKindOfClass:[UIImageView class]]) {
                    UIImageView *tmpImage = (UIImageView *)tmp;
                    [tmpImage setImage:[UIImage imageNamed:@"home"]];
                }else{
                    UILabel *label = (UILabel *)tmp;
                    label.textColor = [UIColor blackColor];
                }
            }
        }
    }
    
    [self buttonClick:index];
    
}

@end
