//
//  JNMatchDetailZBTopCell.h
//  Jingcai
//
//  Created by Administrator on 2019/3/20.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell.h"
#import "JNMatchLiveBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchDetailZBTopCell : JCBaseTableViewCell
@property (nonatomic, strong) JNMatchLiveBall * liveBall;
@property (nonatomic, strong) NSString *content;
@end
NS_ASSUME_NONNULL_END
