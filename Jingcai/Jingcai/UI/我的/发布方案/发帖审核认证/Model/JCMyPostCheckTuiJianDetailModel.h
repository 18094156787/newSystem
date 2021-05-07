//
//  JCMyPostCheckTuiJianDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCPostImageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyPostCheckTuiJianDetailModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *content;

@property (nonatomic,strong) NSString *citation;

@property (nonatomic,strong) NSArray *image;

@property (nonatomic,strong) NSString *classfly;

@property (nonatomic,strong) NSString *type;

@property (nonatomic,strong) NSString *status;



@end

NS_ASSUME_NONNULL_END
