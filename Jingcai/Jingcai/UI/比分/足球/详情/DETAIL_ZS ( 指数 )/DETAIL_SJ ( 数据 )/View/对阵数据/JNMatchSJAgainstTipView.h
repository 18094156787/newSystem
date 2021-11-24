//
//  JNMatchSJAgainstTipView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCBigDataMonthProduceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstTipView : JCBaseView

@property (nonatomic,strong) UIImageView *tipImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UIView *buyBgView;

@property (nonatomic,strong) UIButton *buyOneBtn;//购买本场

@property (nonatomic,strong) UIButton *buyMonthBtn;//购买本月

@property (assign, nonatomic) BOOL isOnlyMonth;//只能包月

@property (strong, nonatomic) JCBigDataMonthProduceModel *productModel;

@property (nonatomic, assign) BOOL is_free;//标记免费

@property (nonatomic, copy) void(^JCSingleMatchBlock)(NSInteger type);//type 1是单场,2是包月

@end

NS_ASSUME_NONNULL_END
