//
//  JNMatchBattleItemCell.m
//  Jingcai
//
//  Created by Administrator on 2019/6/19.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchBattleItemCell.h"
#import "UIImageView+WebCache.h"
#import "JCWConvertTool.h"

@interface JNMatchBattleItemCell ()
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation JNMatchBattleItemCell
- (void)awakeFromNib {
    [super awakeFromNib];
    //主队#FF2500
    //客队#4D5CE2
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setLineupBall:(JNMatchLineupBall *)lineupBall {
    _lineupBall = lineupBall;
    self.numLabel.text = NonNil(lineupBall.shirt_number);
    self.nameLabel.text = NonNil(lineupBall.name);

}
- (void)setIsHomeTeam:(BOOL)isHomeTeam {
    _isHomeTeam = isHomeTeam;
    self.numLabel.backgroundColor = isHomeTeam ? UIColorFromRGB(0xFF2500) : UIColorFromRGB(0x4D5CE2);
    [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:self.lineupBall.logo] placeholderImage:isHomeTeam?JCIMAGE(@"MatchZR_img_mrtx_r"):JCIMAGE(@"MatchZR_img_mrtx_b")];
}
@end
