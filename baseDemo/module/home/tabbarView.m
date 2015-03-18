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
        _btnOne = (UIButton *)[self viewWithTag:10];
        _btnTwo = (UIButton *)[self viewWithTag:11];
        _btnThree = (UIButton *)[self viewWithTag:12];
        [_btnOne addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btnTwo addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btnThree addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _labelOne = (UILabel *)[self viewWithTag:100];
        _labelTwo = (UILabel *)[self viewWithTag:101];
        _labelThree = (UILabel *)[self viewWithTag:102];
        
        [_btnOne setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_btnTwo setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [_btnThree setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        _btnOne.selected = YES;
        _labelOne.textColor = [UIColor redColor];
        
        [_btnOne setImage:[UIImage imageNamed:@"home_f"] forState:UIControlStateSelected];
        [_btnTwo setImage:[UIImage imageNamed:@"home_f"] forState:UIControlStateSelected];
        [_btnThree setImage:[UIImage imageNamed:@"home_f"] forState:UIControlStateSelected];
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
