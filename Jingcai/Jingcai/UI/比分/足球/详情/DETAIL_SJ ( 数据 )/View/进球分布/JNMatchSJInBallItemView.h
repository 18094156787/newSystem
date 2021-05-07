//
//  JNMatchSJInBallItemView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJInBallItemView : JCBaseView

@property(nonatomic,strong) UILabel *nameLab;

@property(nonatomic,strong) UILabel *totalLab;

@property(nonatomic,strong) UILabel *label15;

@property(nonatomic,strong) UILabel *label30;

@property(nonatomic,strong) UILabel *label45;

@property(nonatomic,strong) UILabel *label60;

@property(nonatomic,strong) UILabel *label75;

@property(nonatomic,strong) UILabel *label90;

@property(nonatomic,assign) NSInteger isHome;

@property(nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
