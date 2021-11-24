//
//  JCTransactionDataModelDetailDataInfoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailDataInfoHeadView.h"

@implementation JCTransactionDataModelDetailDataInfoHeadView

- (void)initViews {
    [self addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
    }];
    
    [self addSubview:self.jiLab];
    [self.jiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(AUTO(-15));
    }];
}

- (void)setDetailModel:(JCKellyDataDetailModel *)detailModel {
    _detailModel = detailModel;
    for (int i=0; i<detailModel.compare_odds.count; i++) {
        NSArray *array = detailModel.compare_odds[i];
        if (i==0) {
            if (array.count==3) {
                NSString *win = array[0];
                self.chuWin = win;
                NSString *equal = array[1];
                self.chuEqual = equal;
                NSString *lose = array[2];
                self.chuLose = lose;
                NSString *title = [NSString stringWithFormat:@"初指 %@ (%@) %@",win,equal,lose];
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
                NSRange range = [title rangeOfString:equal];
                if (range.location!=NSNotFound) {
                    [attr addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x0050D0)} range:range];
                }
                self.chuLab.attributedText = attr;
                if ([self.type integerValue]==1) {
                    self.chuLab.text = [NSString stringWithFormat:@"初指 %@ %@ %@",win,equal,lose];
                }
            }
        }
        if (i==1) {
            if (array.count==3) {
                NSString *win = array[0];
                NSString *equal = array[1];
                NSString *lose = array[2];
                NSString *title = [NSString stringWithFormat:@"即指 %@ (%@) %@",win,equal,lose];
                if ([self.type integerValue]==1) {
                    title = [NSString stringWithFormat:@"即指 %@ %@ %@",win,equal,lose];
                }
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];

                if ([self.type integerValue]==1) {
                    NSRange winRange = [title rangeOfString:NonNil(win)];
                    NSRange equalRange = [title rangeOfString:NonNil(equal)];
                    NSRange loseRange = [title rangeOfString:NonNil(lose)];
                    if (winRange.location!=NSNotFound) {
                        if ([win floatValue]>[self.chuWin floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:winRange];
                        }else if ([win floatValue]==[self.chuWin floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:winRange];
                        }else{
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_30B27A} range:winRange];
                        }
                    }
                    
                    if (equalRange.location!=NSNotFound) {
                        if ([equal floatValue]>[self.chuEqual floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:equalRange];
                        }else if ([equal floatValue]==[self.chuEqual floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:equalRange];
                        }else{
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_30B27A} range:equalRange];
                        }
                    }
                    if (loseRange.location!=NSNotFound) {
                        if ([lose floatValue]>[self.chuLose floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:loseRange];
                        }else if ([lose floatValue]==[self.chuLose floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:loseRange];
                        }else{
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_30B27A} range:loseRange];
                        }
                    }
                    self.jiLab.attributedText = attr;

                }else{
                    NSRange winRange = [title rangeOfString:NonNil(win)];
                    NSRange equalRange = [title rangeOfString:NonNil(equal)];
                    NSRange loseRange = [title rangeOfString:NonNil(lose)];
                    if (winRange.location!=NSNotFound) {
                        if ([win floatValue]>[self.chuWin floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:winRange];
                        }else if ([win floatValue]==[self.chuWin floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:winRange];
                        }else{
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_30B27A} range:winRange];
                        }
                    }
                    

                        if (equalRange.location!=NSNotFound) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x0050D0)} range:equalRange];
                        }
                    
                    if (loseRange.location!=NSNotFound) {
                        if ([lose floatValue]>[self.chuLose floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:loseRange];
                        }else if ([lose floatValue]==[self.chuLose floatValue]) {
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:loseRange];
                        }else{
                            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_30B27A} range:loseRange];
                        }
                    }
                    self.jiLab.attributedText = attr;
                    

                }
            }
            
        }
    }
}

//- (void)data {
//    self.chuLab.text = @"初指 2.25 24 .245";
//    self.jiLab.text = @"即指 2.25 24 .245";
//}

- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuLab;
}

- (UILabel *)jiLab {
    if (!_jiLab) {
        _jiLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jiLab;
}
@end
