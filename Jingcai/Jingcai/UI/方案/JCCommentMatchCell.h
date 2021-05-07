//
//  JCCommentMatchCell.h
//  Jingcai
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCCommentMatchCell : JCBaseTableViewCell

@property (nonatomic, strong) NSDictionary * matchDic;

@property (nonatomic, strong) NSString *title;
@end
NS_ASSUME_NONNULL_END
