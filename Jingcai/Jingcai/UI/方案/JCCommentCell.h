//
//  JCCommentCell.h
//  Jingcai
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell.h"
#import "JCDianPingBall.h"

typedef void(^JCDianPingMatchClickBlock)(NSString * _Nullable matchNum);
typedef void(^JCDianPingUserClickBlock)(NSString * _Nullable tjUserId);

NS_ASSUME_NONNULL_BEGIN
@interface JCCommentCell : JCBaseTableViewCell
@property (strong, nonatomic) JCDianPingBall * dianPingBall;
@property (copy, nonatomic) JCDianPingMatchClickBlock matchClickBlock;
@property (copy, nonatomic) JCDianPingUserClickBlock userClickBlock;

@property (nonatomic, copy) void(^JCLikeBlock)(void);

@property (nonatomic, copy) void(^JCShareBlock)(void);


//@property (copy, nonatomic) 
//@property (copy, nonatomic)
@end
NS_ASSUME_NONNULL_END
