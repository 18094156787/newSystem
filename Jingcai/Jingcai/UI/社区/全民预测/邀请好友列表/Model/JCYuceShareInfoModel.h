//
//  JCYuceShareInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYuceShareInfoModel : JCWBaseBall

@property (nonatomic, strong) NSString *url;//微信url

@property (nonatomic, strong) NSString *friend_url;//朋友圈url

@property (nonatomic, strong) NSString *information;// 分享吧标题

@property (nonatomic, strong) NSString *position;//分享标题（副）

@property (nonatomic, strong) NSString *desc;//分享内容

@property (nonatomic, strong) NSString *shareCount;//邀请成功人数

@property (nonatomic, strong) NSString *sharegift;//邀请固定奖励

@property (nonatomic, strong) NSString *cjCount;//未拆礼包

@end

NS_ASSUME_NONNULL_END
