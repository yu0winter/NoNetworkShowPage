//
//  CustomNoNetworkView.h
//  邮币卡我发
//
//  Created by 冯旭 on 03/03/2017.
//  Copyright © 2017 iosfxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNoNetworkView : UIView

typedef void(^clik)(id);
//按钮点击事件的回调
@property (nonatomic, copy) clik btnClick;
//显示无网络界面
- (void)showLoadingFailPage;
//隐藏无网络界面
- (void)hiddenLoadingFailPage;

@end
