//
//  tabbarView.h
//  baseDemo
//
//  Created by gongweiqiang on 15-3-17.
//  Copyright (c) 2015年 Holl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tabbarView;

@protocol tabbarViewDelegate <NSObject>

@required

- (NSInteger)tabbarViewNumOfItem:(tabbarView *)tabbar;
//- (UIView *)tabbarViewItem:(tabbarView *)tabbar index:(NSInteger)index;

@optional
- (void)tabbarViewAction:(tabbarView *)tabbar clickIndex:(NSInteger)index;

@end

@interface tabbarView : UIView

@property (nonatomic,assign) id <tabbarViewDelegate>delegate;

- (void)reloadData;

@end
