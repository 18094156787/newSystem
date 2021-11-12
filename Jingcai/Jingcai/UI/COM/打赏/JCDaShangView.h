//
//  JCDaShangView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDaShangShowView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDaShangView : JCBaseView

@property (nonatomic,strong) UIButton *dsBtn;

@property (nonatomic,strong) UILabel *dsCountLab;

@property (nonatomic,strong) JCDaShangShowView *dsShowView;

@property (nonatomic,strong) NSString *ID;

//下单购买场景(1充值, 2购买专家方案, 3购买大数据订阅, 4购买红榜方案, 5购买ai方案, 6订阅专栏周期,7购买数据模型,8打赏专家方案,9打赏红榜方案,10打赏文章)

@property (nonatomic,strong) NSString *scene;

@property (assign, nonatomic) NSInteger is_reward_open;//打赏开启 0不开1开

@property (assign, nonatomic) NSInteger reward_num;//打赏人数

@end

NS_ASSUME_NONNULL_END
