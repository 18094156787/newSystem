//
//  RNNoDataDIYView.m
//  Jingcai
//
//  Created by Administrator on 2019/7/12.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "RNNoDataDIYView.h"

@implementation RNNoDataDIYView
+ (UIView *)noDataClearViewWithTitle:(NSString *)title {
    UILabel *titleLab = [UILabel initWithTitle:title andFont:14 andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    titleLab.backgroundColor= JCClearColor;
    return titleLab;
}
+ (UIView *)noQingbaoDataView {
    UILabel * label = [UILabel new];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.textColor = UIColorFromRGB(0xCECECE);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"暂无情报";
    return label;
}
+ (UIView *)noCommentDataView {
    UILabel * label = [UILabel new];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.textColor = UIColorFromRGB(0xCCCCCC);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"暂无评论，留下你的第一句话吧！";
    return label;
}
+ (UIView *)noZhiBoDataView {
    
    UIView *view = [UIView new];
    UILabel *titleLab = [UILabel initWithTitle:@"暂无直播" andFont:14 andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    titleLab.frame = CGRectMake(0, AUTO(130), SCREEN_WIDTH, 30);
    [view addSubview:titleLab];
    UILabel *contentLab = [UILabel initWithTitle:@"换个别的看看吧~~" andFont:12 andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    contentLab.frame = CGRectMake(0, AUTO(155), SCREEN_WIDTH, 30);
    [view addSubview:contentLab];
    return view;
}
@end
