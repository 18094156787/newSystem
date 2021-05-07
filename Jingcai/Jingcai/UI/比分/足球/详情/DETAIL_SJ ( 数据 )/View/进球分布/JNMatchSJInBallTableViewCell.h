//
//  JNMatchSJInBallTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchSJInBallItemView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJInBallTableViewCell : JCBaseTableViewCell_New

@property(nonatomic,strong) UILabel *label00;

@property(nonatomic,strong) UILabel *label15;

@property(nonatomic,strong) UILabel *label30;

@property(nonatomic,strong) UILabel *label45;

@property(nonatomic,strong) UILabel *label60;

@property(nonatomic,strong) UILabel *label75;

@property(nonatomic,strong) UILabel *label90;

@property(nonatomic,strong) JNMatchSJInBallItemView *homeView;

@property(nonatomic,strong) JNMatchSJInBallItemView *awayView;

@property(nonatomic,strong) NSArray *homeGoalArr;

@property(nonatomic,strong) NSArray *awayGoalArr;

@property(nonatomic,strong) NSString *homeName;

@property(nonatomic,strong) NSString *awayName;

@end

NS_ASSUME_NONNULL_END
