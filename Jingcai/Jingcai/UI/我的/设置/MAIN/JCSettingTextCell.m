//
//  JCSettingTextCell.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingTextCell.h"

@interface JCSettingTextCell ()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *hbImageView;
@end

@implementation JCSettingTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.leftLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(15)];
    self.leftLabel.textColor = COLOR_333333;
    
    self.rightLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(15)];
    self.rightLabel.textColor = COLOR_999999;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    _leftLabel.text = leftTitle;
}

- (void)setRightTitle:(NSString *)rightTitle {
    _rightTitle = rightTitle;
    _rightLabel.text = rightTitle;
}

@end
