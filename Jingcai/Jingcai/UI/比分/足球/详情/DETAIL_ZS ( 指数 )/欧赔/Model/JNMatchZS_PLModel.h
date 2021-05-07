//
//  JNMatchZS_PLModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JNMatchZS_PLInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_PLModel : JCWBaseBall

@property (strong, nonatomic) NSString * company_name;

@property (assign, nonatomic) BOOL is_select;

@property (strong, nonatomic) NSArray    * info;

#pragma mark //新接口

@property (strong, nonatomic) NSString *company_id;

@property (strong, nonatomic) NSArray    <JNMatchZS_PLInfoModel *>* detail;




@end

NS_ASSUME_NONNULL_END
