//
//  JCShareModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCShareModel : JCWBaseBall

@property (strong, nonatomic) NSString * share_title;

@property (strong, nonatomic) NSString * share_desc;

@property (strong, nonatomic) NSString * friend_url;

@property (strong, nonatomic) NSString * share_image;

@property (strong, nonatomic) NSString *share_url;

@end

NS_ASSUME_NONNULL_END
