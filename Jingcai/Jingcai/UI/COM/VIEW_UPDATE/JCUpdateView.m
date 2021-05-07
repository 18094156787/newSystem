//
//  JCUpdateView.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCUpdateView.h"

@interface JCUpdateView ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *forceUpdateBtn;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@end

@implementation JCUpdateView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.baseBackView = self.backView;
  
    self.baseAlertView = self.alertView;
    self.animationStyle = JCAlertViewAnimationStyleAlert;
    self.cancelButton.layer.borderColor = UIColorFromRGB(0xDCDCDC).CGColor;
    self.cancelButton.layer.borderWidth = 1.f;
    self.forceUpdateBtn.hidden = YES;

}
- (void)setUpdateBall:(JCUpdateBall *)updateBall {
    _updateBall = updateBall;
    self.msgLabel.text = NonNil(updateBall.msg);
    if ([updateBall.mandatory integerValue]==1) {
        self.forceUpdateBtn.hidden = NO;
        self.updateBtn.hidden = YES;
        self.cancelButton.hidden = YES;
    }else{
        self.forceUpdateBtn.hidden = YES;
        self.updateBtn.hidden = NO;
        self.cancelButton.hidden = NO;
    }

}
- (IBAction)updateBtnClick:(UIButton *)sender {
    if (self.updateClickBlock) {
        self.updateClickBlock(self.updateBall.link);
    }
}
- (IBAction)cancelBtnClick:(UIButton *)sender {
    [self hide];
}

- (void)setBaseBackView:(UIView *)baseBackView {
    
}
@end
