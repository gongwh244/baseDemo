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
- (void)tabbarViewItem:(UIView *)tabItem index:(NSInteger)index;

@optional
- (void)tabbarViewAction:(tabbarView *)tabbar clickIndex:(NSInteger)index;

@end

@interface tabbarView : UIView

@property (nonatomic,assign) id <tabbarViewDelegate>delegate;

@property (nonatomic,assign) NSInteger count;

- (void)reloadData;

@end
