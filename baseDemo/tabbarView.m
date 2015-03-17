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
@end

@implementation tabbarView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _btnOne = (UIButton *)[self viewWithTag:10];
        _btnTwo = (UIButton *)[self viewWithTag:11];
        _btnThree = (UIButton *)[self viewWithTag:12];
        [_btnOne addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btnTwo addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btnThree addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_btnOne setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_btnTwo setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_btnThree setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        _btnOne.selected = YES;
    }
    return self;
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
            if (_delegate && [_delegate respondsToSelector:@selector(buttonClick:)]) {
                [_delegate buttonClick:2];
            }
        }
            break;
    }
}

@end
