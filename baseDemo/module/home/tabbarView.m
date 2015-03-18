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

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)reloadData
{
    for (int i = 0; i < 3; i++) {
        UIView *itemView = [[UIView alloc] initWithFrame:CGRectZero];
        itemView.backgroundColor = [UIColor yellowColor];
        [self addSubview:itemView];
        itemView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
    }
}

- (void)btnAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 10://one
        {
            NSLog(@"one click");
            _btnOne.selected = YES;
            _btnTwo.selected = NO;
            _btnThree.selected = NO;
            
            _labelOne.textColor = [UIColor redColor];
            _labelTwo.textColor = [UIColor blackColor];
            _labelThree.textColor = [UIColor blackColor];
            
            if (_delegate && [_delegate respondsToSelector:@selector(buttonClick:)]) {
                [_delegate buttonClick:0];
            }
        }
            break;
        case 11://two
        {
            NSLog(@"two click");
            _btnOne.selected = NO;
            _btnTwo.selected = YES;
            _btnThree.selected = NO;
            
            _labelOne.textColor = [UIColor blackColor];
            _labelTwo.textColor = [UIColor redColor];
            _labelThree.textColor = [UIColor blackColor];
            
            if (_delegate && [_delegate respondsToSelector:@selector(buttonClick:)]) {
                [_delegate buttonClick:1];
            }
        }
            break;
        default://three
        {
            NSLog(@"three click");
            _btnOne.selected = NO;
            _btnTwo.selected = NO;
            _btnThree.selected = YES;
            
            _labelOne.textColor = [UIColor blackColor];
            _labelTwo.textColor = [UIColor blackColor];
            _labelThree.textColor = [UIColor redColor];
            
            if (_delegate && [_delegate respondsToSelector:@selector(buttonClick:)]) {
                [_delegate buttonClick:2];
            }
        }
            break;
    }
}

@end
