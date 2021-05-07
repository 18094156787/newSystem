//
//  JCZBIncidentModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCZBIncidentModel : JCWBaseBall
//1 进球 足球技术统计
//2 角球 足球技术统计
//3 黄牌 足球技术统计
//4 红牌 足球技术统计
//5 界外球 足球技术统计
//6 任意球 足球技术统计
//7 球门球 足球技术统计
//8 点球 足球技术统计
//9 换人 足球技术统计
//10 比赛开始 足球技术统计
//11 中场 足球技术统计
//12 结束 足球技术统计
//13 半场比分 足球技术统计
//15 两黄变红 足球技术统计
//16 点球未进 足球技术统计
//17 乌龙球 足球技术统计
//19 伤停补时 足球技术统计
//21 射正 足球技术统计
//22 射偏 足球技术统计
//23 进攻 足球技术统计
//24 危险进攻 足球技术统计
//25 控球率 足球技术统计
//26 加时赛结束 足球技术统计
//27 点球大战结束
//28 VAR(视频助理裁判)
@property (nonatomic,strong) NSString *type;//(type事件 1 3 4  8 9  10 11 12 15 16 17)p

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *position;

@end

NS_ASSUME_NONNULL_END
