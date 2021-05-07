//
//  JCTeamMatchInfoScoreRuleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoScoreRuleCell.h"

@implementation JCTeamMatchInfoScoreRuleCell

- (void)initViews {
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-10));
    }];
}

//- (void)data {
//    self.contentLab.text = @"英超联赛积分规则\n1.每队胜一场得3分，平一场得1分，负一场得0分\n2.联赛结束 积分多的队名次列前\n3.如果两队或两队以上积分相等，依下列顺序排列名次\na）净胜球\nb）总进球\nc）采取相同排名\nd）涉及冠军or升降级名额则两队在中立场进行一场附加赛决出排名\n欧战or降级名额\n（一）联赛前四直接参加下赛季欧冠联赛\n（二）第五名参加下赛季欧联杯\n（三）足总杯冠军可参加欧联杯，若其已获得欧战资格则名额让给联赛未获欧战资格中排名靠前的队伍\n（四）联赛杯冠军可参加欧联杯第三轮资格赛，若其已获得欧战资格则名额让给联赛未获欧战资格中排名靠前的队伍\n（五）若欧冠、欧联冠军都是英超球队，且两支球队都未通过联赛获得欧冠资格，则第四名参加欧联杯\n（六）排名最后三位的球队降入英冠联赛";
//}

- (void)setRule:(NSString *)rule {
    _rule = rule;
    self.contentLab.text = rule;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

@end
