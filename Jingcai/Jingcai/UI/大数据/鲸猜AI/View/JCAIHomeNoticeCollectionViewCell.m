//
//  JCAIHomeNoticeCollectionViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAIHomeNoticeCollectionViewCell.h"

@implementation JCAIHomeNoticeCollectionViewCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-45));
    }];
    
    [self.contentView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-15));
    }];

}

- (void)setModel:(JCJingCaiAINoticeModel *)model {
    _model = model;
    NSString *title = [NSString stringWithFormat:@"%@ %@ %@ %@:%@ %@ ",NonNil(model.competition_name),model.match_time,model.home_team_name,model.home_scores,model.away_scores,model.away_team_name];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSString *rangeStr = [NSString stringWithFormat:@"%@:%@",model.home_scores,model.away_scores];
//    NSRange  scoreRange = [title rangeOfString:rangeStr];
//    if (scoreRange.location!=NSNotFound) {
//        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:scoreRange];
//    }
    self.statusLab.text = @"命中";
//    self.titleLab.attributedText = attr;
    
    NSArray *array = [self rangeOfSubString:rangeStr inString:title];
    if (array.count>0) {
        NSValue * value = array.lastObject;
        NSRange range = [value rangeValue];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
            self.titleLab.attributedText = attr;
        }
    }
    
}

- (void)setAModel:(JCJingCaiAINoticeModel *)aModel {
    _aModel = aModel;
    NSString *title = [NSString stringWithFormat:@"%@ %@ %@ vs %@ ",NonNil(aModel.competition_name),aModel.match_time,aModel.home_team_name,aModel.away_team_name];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
//    NSRange  mzRange = [title rangeOfString:@"命中"];
    NSRange  vsRange = [title rangeOfString:@"vs"];
    if (vsRange.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:vsRange];
    }
//    [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_0091FF} range:mzRange];
    self.titleLab.attributedText = attr;
    
   
}

- (NSArray*)rangeOfSubString:(NSString*)subStr inString:(NSString*)string {

      NSMutableArray *rangeArray = [NSMutableArray array];

      NSString*string1 = [string stringByAppendingString:subStr];

      NSString *temp;

      for(int i =0; i < string.length; i ++) {

            temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];

            if ([temp isEqualToString:subStr]) {

                  NSRange range = {i,subStr.length};

                  [rangeArray addObject: [NSValue valueWithRange:range]];

            }

      }

      return rangeArray;

}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}

@end
