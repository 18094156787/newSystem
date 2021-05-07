//
//  JCMyPostCheckTuiJianModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMyPostCheckTuiJianDetailModel.h"
#import "JCPostPlanMathInfoModel.h"
#import "JCPostPlanRequestModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyPostCheckTuiJianModel : JCWBaseBall

@property (nonatomic,strong) JCMyPostCheckTuiJianDetailModel *tujian;

@property (nonatomic,strong) NSArray <JCPostPlanMathInfoModel*>*matchData;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *tuijian_id;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *content;

@property (nonatomic,strong) NSString *image;

@property (nonatomic,strong) NSString *classfly;

@property (nonatomic,strong) NSString *citation;

@property (nonatomic,assign) NSInteger sf;

@property (nonatomic,strong) NSString *is_push;

@property (nonatomic,strong) NSString *push_time;

@property (nonatomic,strong) NSString *refund;

@property (nonatomic,strong) NSString *hb;



@property (nonatomic,strong) NSString *status;//1已审核/上架 2 待审核 3 已拒绝 4 已退回 7 已过期 6已审核 下架

@property (nonatomic,strong) NSArray <JCPostImageModel *>* img_info;

@property (nonatomic,strong) NSArray <JCPostPlanMathInfoModel*>*match_data;

@property (nonatomic,strong) NSArray <JCPostPlanMathInfoModel*>*zucai_examine_tuijian_match;

@property (nonatomic,strong) NSArray <JCPostPlanMathInfoModel*>*zucai_tuijian_match;

@end

NS_ASSUME_NONNULL_END
