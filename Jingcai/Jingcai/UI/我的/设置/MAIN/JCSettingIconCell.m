//
//  JCSettingIconCell.m
//  Jingcai
//
//  Created by Rain on 2018/10/11.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCSettingIconCell.h"
#import "UIImageView+WebCache.h"

@interface JCSettingIconCell ()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@end

@implementation JCSettingIconCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.leftLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(15)];
    self.leftLabel.textColor = COLOR_333333;
    [self.iconImageView hg_setAllCornerWithCornerRadius:30];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    _leftLabel.text = leftTitle;
}
- (void)setIconImageUrl:(NSString *)iconImageUrl {
    _iconImageUrl = iconImageUrl;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:iconImageUrl] placeholderImage:[UIImage imageNamed:@"userImg_default"]];
}
@end
