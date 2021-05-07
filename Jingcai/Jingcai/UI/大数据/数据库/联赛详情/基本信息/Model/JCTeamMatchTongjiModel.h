//
//  JCTeamMatchTongjiModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchTongjiModel : JCWBaseBall

@property (nonatomic,strong) NSString *team_name;

@property (nonatomic,strong) NSString *team_times;

@property (nonatomic,strong) NSString *team_type;//type=1 卫冕冠军 =2 夺冠最多

@property (nonatomic,strong) NSString *team_logo;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *team_id;

@property (nonatomic,strong) NSString *name_zh;

@property (nonatomic,strong) NSString *name_en;

@property (nonatomic,strong) NSString *short_name_zh;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *title_holder_num;

@property (nonatomic,strong) NSString *most_titles_num;//卫冕冠军次数

@end

NS_ASSUME_NONNULL_END
