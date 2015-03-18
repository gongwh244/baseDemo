//
//  scrollViewController.m
//  baseDemo
//
//  Created by gongweiqiang on 15-3-17.
//  Copyright (c) 2015年 Holl. All rights reserved.
//
#define DEVICE_WIDTH                [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT               [UIScreen mainScreen].bounds.size.height

#define IMAGE_NUM                   4

#import "scrollViewController.h"

@interface scrollViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation scrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadImageView];
    [self layPageControl];
}

- (void)loadImageView
{
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(IMAGE_NUM * DEVICE_WIDTH, DEVICE_HEIGHT);
    
    for (int i = 0; i < IMAGE_NUM; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(i * DEVICE_WIDTH, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [_scrollView addSubview:image];
        if (i == IMAGE_NUM - 1) {
            UIButton *btn = [[UIButton alloc] init];
            btn.backgroundColor = [UIColor redColor];
            btn.center = image.center;
            btn.bounds = CGRectMake(0, 0, 80, 40);
            [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:btn];
        }
    }
}
- (IBAction)valueChange:(id)sender {
    
    UIPageControl *control = (UIPageControl *)sender;
    [_scrollView setContentOffset:CGPointMake(control.currentPage * DEVICE_WIDTH, 0) animated:YES];
}

- (void)btnClick
{
    if (_delegate && [_delegate respondsToSelector:@selector(enterHomeViewController)]) {
        [_delegate enterHomeViewController];
    }
}

- (void)layPageControl
{
    _pageControl.numberOfPages = 4;
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.pageIndicatorTintColor = [UIColor blueColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / DEVICE_WIDTH;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
