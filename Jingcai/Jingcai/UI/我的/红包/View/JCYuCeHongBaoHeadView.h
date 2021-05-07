//
//  JCYuCeHongBaoHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/5.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYuCeHongBaoHeadView : JCBaseView

@property (nonatomic,strong) UILabel *moneyLabel;//金额

@property (nonatomic,strong) UILabel *countLabel;//金额

@property (nonatomic,strong) UILabel *moneyLab;//金额

@property (nonatomic,strong) UILabel *countLab;//次数

@property (nonatomic,assign) NSInteger type;//2是红币红包(免单券) 3是红包优惠券

@end

NS_ASSUME_NONNULL_END
