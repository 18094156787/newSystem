

//
//  JCBasketBallMatchTongJiTeamModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

    @interface JCBasketBallMatchTongJiTeamModel : JCWBaseBall

@property (nonatomic,strong) NSString * number;//号码

@property (nonatomic,strong) NSString * name;//姓名

@property (nonatomic,strong) NSString * time;//上场时间

@property (nonatomic,strong) NSString * tl;//上场时间

@property (nonatomic,strong) NSString * sf;//3分球

@property (nonatomic,strong) NSString * fq;//罚球

@property (nonatomic,strong) NSString * qlb;//前场篮板

@property (nonatomic,strong) NSString * hlb;//后场篮板

@property (nonatomic,strong) NSString * zlb;//全场篮板

@property (nonatomic,strong) NSString * zg;//助攻

@property (nonatomic,strong) NSString * qd;//抢断

@property (nonatomic,strong) NSString * gm;//盖帽

@property (nonatomic,strong) NSString * sw;//失误

@property (nonatomic,strong) NSString * fg;//罚球

//@property (nonatomic,strong) NSString * df;

@property (nonatomic,strong) NSString * tb; // 是否替补 0首发 1替补 "-" 是总计

@property (nonatomic,strong) NSString *zfz;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *zccxsj;//时间

@property (nonatomic,strong) NSString *df;//得分

@property (nonatomic,strong) NSString *zdlb;//篮板

@property (nonatomic,strong) NSString *zgs;//助攻

@property (nonatomic,strong) NSString *mzcs_tlcs;//投篮

@property (nonatomic,strong) NSString *sfqtlmzcs_sftlcs;//三分

@property (nonatomic,strong) NSString *fqmzcs_fqtlcs;//罚球

@property (nonatomic,strong) NSString *jglb;//前板

@property (nonatomic,strong) NSString *fslb;//后板

@property (nonatomic,strong) NSString *qds;//抢断

@property (nonatomic,strong) NSString *gms;//盖帽

@property (nonatomic,strong) NSString *swcs;//失误

@property (nonatomic,strong) NSString *grfgcs;//犯规

@property (nonatomic,strong) NSString *z;//+/-

@property (nonatomic,strong) NSString *mzcs;

@property (nonatomic,strong) NSString *sfqtlmzcs;

@property (nonatomic,strong) NSString *fqmzcs;

@property (nonatomic,strong) NSString *tlcs;

@property (nonatomic,strong) NSString *sftlcs;

@property (nonatomic,strong) NSString *fqtlcs;

@property (nonatomic,strong) NSString *sfcc;

@property (nonatomic,strong) NSString *sfzcs;

@property (nonatomic,strong) NSString *sfstb;

@property (nonatomic,assign) NSInteger rank;//排序



@end

NS_ASSUME_NONNULL_END
