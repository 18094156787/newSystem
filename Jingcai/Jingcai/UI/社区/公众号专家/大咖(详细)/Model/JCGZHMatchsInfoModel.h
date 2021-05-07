//
//  JCGZHMatchsInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCGZHTuiJianModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCGZHMatchsInfoModel : JCWBaseBall

@property (nonatomic,strong) NSArray <JCGZHTuiJianModel *>*tuijian;

@property (nonatomic,assign) NSInteger index;

@end

NS_ASSUME_NONNULL_END
