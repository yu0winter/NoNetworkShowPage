//
//  CustomNoNetworkView.m
//  邮币卡我发
//
//  Created by 冯旭 on 03/03/2017.
//  Copyright © 2017 iosfxi. All rights reserved.
//

#import "CustomNoNetworkView.h"
#import <AVFoundation/AVFoundation.h>

@interface CustomNoNetworkView() {
    
    NSString * reloading;
}

@property (strong, nonatomic) UIImageView *image;

@property (strong, nonatomic) UIButton *restart_loading;

@property (strong, nonatomic) UILabel * prompt;


@end




@implementation CustomNoNetworkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //默认隐藏
        self.hidden = YES;
        [self initWithUI];
    }
    return self;
}

- (void)initWithUI {

    
    _restart_loading = [[UIButton alloc]init];
    [_restart_loading setImage:[UIImage imageNamed:@""] forState:(UIControlStateNormal)];
    [_restart_loading setTitle:@"网络异常,请重新加载" forState:(UIControlStateNormal)];
    _restart_loading.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [_restart_loading setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
//    [_restart_loading setBackgroundColor:[UIColor greenColor]];
    [_restart_loading addTarget:self action:@selector(restartLoading:) forControlEvents:(UIControlEventTouchUpInside)];
    [_restart_loading.layer setBorderWidth:1.0];
    _restart_loading.layer.borderColor = [UIColor grayColor].CGColor;
    //设置圆角
    _restart_loading.layer.cornerRadius = 10;
    //将多余的部分切掉
    _restart_loading.layer.masksToBounds = YES;
    
    [self addSubview:_restart_loading];
    [_restart_loading mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@30);
        make.width.equalTo(@160);
        make.height.equalTo(@30);
    }];
    
    _image = [[UIImageView alloc]init];
    _image.image = [UIImage imageNamed:@"noNetworkingImage"];
    [self addSubview:_image];
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_restart_loading.mas_centerX);
        make.width.equalTo(@120);
        make.height.equalTo(@120);
        make.bottom.equalTo(_restart_loading.mas_top).equalTo(-20);
    }];
    
}



- (void)restartLoading:(UIButton *)sender {
    reloading = @"re_loading";
    self.btnClick(reloading);
}



#pragma mark - 无网络界面的显示与隐藏
- (void)showLoadingFailPage {
    if (self.hidden == YES) {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration:1.0];
        self.alpha = 1.0;
        self.hidden = NO;
        [UIView commitAnimations];
    }
}
- (void)hiddenLoadingFailPage {
    if (self.hidden == NO) {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration:1.0];
        self.alpha = 0.0;
        self.hidden = YES;
        [UIView commitAnimations];
    }
}














@end
