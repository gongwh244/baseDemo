//
//  tabbarView.h
//  baseDemo
//
//  Created by gongweiqiang on 15-3-17.
//  Copyright (c) 2015年 Holl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tabbarViewDelegate <NSObject>

- (void)buttonClick:(NSInteger)index;

@end

@interface tabbarView : UIView

@property (nonatomic,assign) id <tabbarViewDelegate>delegate;

@end
