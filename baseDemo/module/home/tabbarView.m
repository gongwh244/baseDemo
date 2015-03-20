//
//  tabbarView.m
//  baseDemo
//
//  Created by gongweiqiang on 15-3-17.
//  Copyright (c) 2015年 Holl. All rights reserved.
//

#import "tabbarView.h"
@interface tabbarView ()
@property (nonatomic,strong)UIButton *btnOne;
@property (nonatomic,strong)UIButton *btnTwo;
@property (nonatomic,strong)UIButton *btnThree;

@property (nonatomic,strong)UILabel *labelOne;
@property (nonatomic,strong)UILabel *labelTwo;
@property (nonatomic,strong)UILabel *labelThree;

@end

@implementation tabbarView
{
    NSInteger _indexNum;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)reloadData
{
    if (_delegate && [_delegate respondsToSelector:@selector(tabbarViewNumOfItem:)]) {
        _indexNum = [_delegate tabbarViewNumOfItem:self];
    }
    for (int i = 0; i < _indexNum; i++) {
        UIView *itemView = [[UIView alloc] initWithFrame:CGRectZero];
        itemView.backgroundColor = [UIColor yellowColor];
        itemView.tag = i + 1000;
        [self addSubview:itemView];
        itemView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f * i/_indexNum constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f * (i + 1)/_indexNum constant:0.0f]];
        [self updateConstraints];
        
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
        [itemView addGestureRecognizer:tapGR];
    }
}

- (void)gestureAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"press %ld",sender.view.tag);
    if (_delegate && [_delegate respondsToSelector:@selector(tabbarViewAction:clickIndex:)]) {
        [_delegate tabbarViewAction:self clickIndex:(sender.view.tag - 1000)];
    }
}


@end
