//
//  JCActivityKindDetailCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindDetailCell.h"

@implementation JCActivityKindDetailCell

- (void)initViews {
//    self.scrollowView.bounces = NO;
//    [self.contentView addSubview:self.scrollowView];
//    self.scrollowView.frame = CGRectMake(0, 44, SCREEN_WIDTH, 400);
//    [self.scrollowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.offset(44);
//        make.width.mas_equalTo(SCREEN_WIDTH);
//        make.height.mas_equalTo(400);
//    }];
    
//    [self.scrollowView]
    self.userVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 400);
    self.userVC.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 400);
    [self.contentView addSubview:self.userVC.view];
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    if (!detailModel) {
        return;
    }
    self.userVC.detailModel = detailModel;
//    self.scoreVC.detailModel = detailModel;
//    self.prizeVC.detailModel = detailModel;
//    self.getScoreImgView.hidden = [detailModel.is_new integerValue]==1?NO:YES;

//    self.listContainerView.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH-50, 500);
}

- (void)setActID:(NSString *)actID {
    _actID = actID;
    self.userVC.actID = actID;
}

- (JCActivityKindUserVC *)userVC {
    if (!_userVC) {
        _userVC = [JCActivityKindUserVC new];
    }
    return _userVC;
}

- (UIScrollView *)scrollowView {
    if (!_scrollowView) {
        _scrollowView = [UIScrollView new];
    }
    return _scrollowView;
}
@end
