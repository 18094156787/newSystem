//
//  JCJingCaiAIYLModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIYLModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *count;

@property (nonatomic,strong) NSString *yl;

@property (nonatomic,strong) NSString *yl_desc;

@property (nonatomic,strong) NSString *yl_desc_color;

@property (nonatomic,assign) NSInteger qy;

@property (nonatomic,assign) NSInteger qs;

@property (nonatomic,assign) NSInteger yb;

@property (nonatomic,assign) NSInteger sb;

@property (nonatomic,assign) NSInteger zs;

@property (nonatomic,strong) NSString *qy_percent;

@property (nonatomic,strong) NSString *qs_percent;

@property (nonatomic,strong) NSString *sb_percent;

@property (nonatomic,strong) NSString *yb_percent;

@property (nonatomic,strong) NSString *zs_percent;


@end

NS_ASSUME_NONNULL_END
