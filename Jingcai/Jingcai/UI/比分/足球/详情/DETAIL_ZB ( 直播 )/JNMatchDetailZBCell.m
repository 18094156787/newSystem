//
//  JNMatchDetailZBCell.m
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDetailZBCell.h"
#import "JCWConvertTool.h"

@interface JNMatchDetailZBCell ()
@property (weak, nonatomic) IBOutlet UIImageView * iconImageView;
@property (weak, nonatomic) IBOutlet UILabel * msgLabel;
@end

@implementation JNMatchDetailZBCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setLiveBall:(JNMatchLiveBall *)liveBall {
    _liveBall = liveBall;
    self.msgLabel.text = NonNil(liveBall.data);
    self.iconImageView.image = [JCWConvertTool imageWithColor:[UIColor groupTableViewBackgroundColor]];
    //10,11,12,26,27
    if ((liveBall.type >= 10 && liveBall.type <= 12) || (liveBall.type >= 26 && liveBall.type <= 27) ) {
        self.iconImageView.image = [UIImage imageNamed:@"match_live_10-12_26-27"];
        return ;
    }
    //19-25
    if (liveBall.type >= 19 && liveBall.type <= 25) {
        self.iconImageView.image = [UIImage imageNamed:@"match_live_19-25"];
        return ;
    }
    //其它
    self.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"match_live_%ld",liveBall.type]];
}
@end
