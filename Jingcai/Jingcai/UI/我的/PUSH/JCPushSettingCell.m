
//
//  JCPushSettingCell.m
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPushSettingCell.h"

@interface JCPushSettingCell ()
@property (weak, nonatomic) IBOutlet UISwitch * pushSwitch;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView * indicatorView;
@end

@implementation JCPushSettingCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.pushSwitch.onTintColor = JCBaseColor;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setIsOn:(BOOL)isOn {
    _isOn = isOn;
    self.pushSwitch.on = isOn;
}
- (void)showLoading {
    self.pushSwitch.hidden = YES;
    [self.indicatorView startAnimating];
}
- (void)hideLoading {
    self.pushSwitch.hidden = NO;
    [self.indicatorView stopAnimating];
}
- (IBAction)pushSwitchValueChanged:(UISwitch *)sender {
    if (self.swichBlock) {
        self.swichBlock(sender.isOn, self);
    }
}
@end
