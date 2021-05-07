//
//  JCFootBallBuyPlaneFootView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/17.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCFootBallNormalHeadCell.h"
#import "JCPlanBuyPersonModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCFootBallBuyPlaneFootView : JCBaseView
@property(nonatomic,strong) UILabel *countLab;

@property(nonatomic,strong) UIView *bottomView;
    
@property (nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) UIButton *moreBtn;

@property(nonatomic,copy) void(^JCMoreBlock)(void);



@end

NS_ASSUME_NONNULL_END
