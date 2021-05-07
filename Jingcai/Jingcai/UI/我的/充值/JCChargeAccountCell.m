//
//  JCChargeAccountCell.m
//  Jingcai
//
//  Created by Administrator on 2019/1/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeAccountCell.h"

@interface JCChargeAccountCell ()
@property (weak, nonatomic) IBOutlet UILabel * nameLabel;
@property (weak, nonatomic) IBOutlet UILabel * caiyunLabel;
@end

@implementation JCChargeAccountCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.nameLabel.textColor = COLOR_2F2F2F;
    self.caiyunLabel.textColor = JCBaseColor;
    self.nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    self.caiyunLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
//- (void)setUserBall:(JCWUserBall *)userBall {
//    _userBall = userBall;
//    self.nameLabel.text = NonNil(userBall.user_name);
//    //self.caiyunLabel.text = [NSString stringWithFormat:@"%@ 红币", NonNil(userBall.caiyun)];
//}
- (void)setName:(NSString *)name {
    _name = name;
    self.nameLabel.text = NonNil(name);
}
- (void)setCaiyun:(NSString *)caiyun {
    _caiyun = caiyun;

  NSString *money_float = [JCCommomTool formatePointZero1:caiyun];
    NSString *money = [NSString stringWithFormat:@"%@ 红币", money_float];
    NSRange range = [money rangeOfString:money_float];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:money];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{ NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:24]} range:range];
    }
    self.caiyunLabel.attributedText = attr;
}@end
