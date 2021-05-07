//
//  JCGZHTuiJianModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWVerTjInfoMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCGZHTuiJianModel : JCWBaseBall

@property (nonatomic,copy) NSString *show;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *analysis;

@property (nonatomic,strong) NSArray <JCWVerTjInfoMatchBall *> *match;

@property (nonatomic,strong) NSArray <JCWVerTjInfoMatchBall *> *match_info;

@property (nonatomic,assign) NSInteger height;

@end

NS_ASSUME_NONNULL_END
