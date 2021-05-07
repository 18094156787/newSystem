//
//  JCCommentMatchCell.m
//  Jingcai
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCCommentMatchCell.h"

@interface JCCommentMatchCell ()
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@end

@implementation JCCommentMatchCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = COLOR_F0F0F0;
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)setMatchDic:(NSDictionary *)matchDic {
    _matchDic = matchDic;
    
    NSString *match_name = matchDic[@"match_name"];
    if (match_name.length==0) {
        self.titleLabel.text = [NSString stringWithFormat:@"%@ %@  %@ vs %@", matchDic[@"match_time"], matchDic[@"league_name"], matchDic[@"home_name"], matchDic[@"away_name"]];
    }else{
        self.titleLabel.text = [NSString stringWithFormat:@"%@ [%@] %@  %@ vs %@", matchDic[@"match_time"],match_name, matchDic[@"league_name"], matchDic[@"home_name"], matchDic[@"away_name"]];
    }
    
//    self.titleLabel.text = [NSString stringWithFormat:@"%@ [%@] %@ | %@ vs %@", matchDic[@"match_time"],matchDic[@"match_name"], matchDic[@"league_name"], matchDic[@"home_name"], matchDic[@"away_name"]];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}
//- (void)setTitle:(NSString *)title {
//    _title = title;
//    self.titleLabel.text = title;
//}
@end
