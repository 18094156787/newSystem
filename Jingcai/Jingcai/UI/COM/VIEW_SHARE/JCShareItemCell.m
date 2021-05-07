//
//  JCShareItemCell.m
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCShareItemCell.h"

@interface JCShareItemCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation JCShareItemCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    self.nameLabel.textColor = COLOR_2F2F2F;
}
- (void)setShareType:(JCShareTypeEnum)shareType {
    _shareType = shareType;
    switch (shareType) {
        case JCShareTypeEnumWeChatTimeLine:
            self.iconImageView.image = [UIImage imageNamed:@"share_friend_circle"];
            self.nameLabel.text = @"朋友圈";
            break;
        case JCShareTypeEnumWeChatSession:
            self.iconImageView.image = [UIImage imageNamed:@"share_wechat"];
            self.nameLabel.text = @"微信";
            break;
        case JCShareTypeEnumSina:
            self.iconImageView.image = [UIImage imageNamed:@"share_weibo"];
            self.nameLabel.text = @"微博";
            break;
        case JCShareTypeEnumQQ:
            self.iconImageView.image = [UIImage imageNamed:@"share_qq"];
            self.nameLabel.text = @"QQ";
            break;
        case JCShareTypeEnumCopy:
            self.iconImageView.image = [UIImage imageNamed:@"share_copyLink"];
            self.nameLabel.text = @"复制链接";
            break;
        default:
            self.iconImageView.image = nil;
            self.nameLabel.text = @"";
            break;
    }
}
@end
