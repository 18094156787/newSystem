//
//  JCFreeView.m
//  Jingcai
//
//  Created by Administrator on 2019/4/11.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCFreeView.h"

@interface JCFreeView ()
@property (weak, nonatomic) IBOutlet UIView * backView;
@property (weak, nonatomic) IBOutlet UIView * alertView;
@end

@implementation JCFreeView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.baseBackView = self.backView;
    self.baseAlertView = self.alertView;
    self.animationStyle = JCAlertViewAnimationStyleAlert;
    //禁用点击遮罩
    self.baseBackView.userInteractionEnabled = NO;
}
- (IBAction)closeBtnClick:(UIButton *)sender {
    if (self.closeClickBlock) {
        self.closeClickBlock();
    }
    [self hide];
}
- (IBAction)useBtnClick:(UIButton *)sender {
    if (self.useClickBlock) {
        self.useClickBlock();
    }
    [self hide];
}
@end
