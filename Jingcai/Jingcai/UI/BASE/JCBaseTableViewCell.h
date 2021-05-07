//
//  JCBaseTableViewCell.h
//  Jingcai
//
//  Created by Rain on 2018/10/9.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^JCBaseTableViewCellNeedLayoutBlock)(void);
//typedef void (^JCBaseTableViewCellNeedReturnHeightBlock)(c);

NS_ASSUME_NONNULL_BEGIN
@interface JCBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) NSString * pageID;
@property (nonatomic, copy) JCBaseTableViewCellNeedLayoutBlock needLayoutBlock;
//@property (nonatomic, copy) JCBaseTableViewCellNeedReturnHeightBlock needReturnHeightBlock;
- (CGFloat)cellH;
- (CGFloat)maxTitleY;
@end
NS_ASSUME_NONNULL_END
