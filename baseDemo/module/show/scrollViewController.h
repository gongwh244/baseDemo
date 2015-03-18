//
//  scrollViewController.h
//  baseDemo
//
//  Created by gongweiqiang on 15-3-17.
//  Copyright (c) 2015年 Holl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol showImageDelegate <NSObject>

- (void)enterHomeViewController;

@end

@interface scrollViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic,assign) id<showImageDelegate>delegate;

@end
