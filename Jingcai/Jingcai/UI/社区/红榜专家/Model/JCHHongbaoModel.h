//
//  JCHHongbaoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWMyHongbaoBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHHongbaoModel : JCWBaseBall

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *expiry_time;

@property (nonatomic,strong) NSString *highest;

@property (nonatomic,strong) NSString *is_ff;

@property (nonatomic,strong) NSString *is_mf;//有免费红包

@property (nonatomic,strong) JCWMyHongbaoBall *selHongbaoModel;//选中的红包


@end

NS_ASSUME_NONNULL_END
