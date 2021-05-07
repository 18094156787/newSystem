//
//  JNDIYemptyView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/27.
//  Copyright © 2019年 jingcai. All rights reserved.
//

#import "JNDIYemptyView.h"

@implementation JNDIYemptyView

- (void)prepare{
    [super prepare];
    
    self.actionBtnTitleColor = JCWhiteColor;
    self.actionBtnBackGroundColor = JCBaseColor;
    self.actionBtnWidth = 275;
    self.actionBtnHeight = 44;
    self.actionBtnCornerRadius = 22;
    self.subViewMargin = 20.f;
    self.titleLabMargin = 10;


}

+ (instancetype)diyNoDataEmpty{
    return [JNDIYemptyView emptyViewWithImageStr:@"nonet"
                                    titleStr:@"哎呀，网络找不到啦~"
                                   detailStr:nil];
}

+ (instancetype)diyNoNetworkEmptyWithBlock:(LYActionTapBlock)btnClickBlock {
    JNDIYemptyView *emptyView = [JNDIYemptyView emptyActionViewWithImageStr:@"nonet" titleStr:@"哎呀，网络找不到啦~" detailStr:nil btnTitleStr:@"点击重试" btnClickBlock:btnClickBlock];
    emptyView.autoShowEmptyView = NO;
     [emptyView.actionButton setBackgroundImage:JCIMAGE(@"button-f") forState:0];
    return emptyView;
}

+ (instancetype)diyNoDataEmptyViewWithBlock:(LYActionTapBlock)btnClickBlock {
    JNDIYemptyView *emptyView = [JNDIYemptyView emptyActionViewWithImageStr:@"nodata" titleStr:@"空的，啥也没有啦~" detailStr:nil btnTitleStr:@"点击重试" btnClickBlock:btnClickBlock];
    emptyView.autoShowEmptyView = NO;
    emptyView.actionButton.hidden = YES;
    
//    [emptyView.actionButton setBackgroundImage:JCIMAGE(@"button-f") forState:0];
    return emptyView;
}

- (void)chageImageStr:(NSString *)ImageStr Title:(NSString *)title BtnTitle:(NSString *)btnTtitle {
    self.imageStr = ImageStr;
    self.titleStr = title;
    self.ly_emptyView.btnTitleStr = btnTtitle;
}

- (void)chageImageStr:(NSString *)ImageStr Title:(NSString *)title BtnTitle:(NSString *)btnTtitle hideBtn:(BOOL)hide{
    self.imageStr = ImageStr;
    self.titleStr = title;
    self.ly_emptyView.btnTitleStr = btnTtitle;
    self.ly_emptyView.actionButton.hidden = hide;
}

@end
