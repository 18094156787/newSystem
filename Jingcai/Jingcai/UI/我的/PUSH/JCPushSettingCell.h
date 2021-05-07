//
//  JCPushSettingCell.h
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell.h"
@class JCPushSettingCell;
typedef void(^JCPushSettingSwichBlock)(BOOL isOn, JCPushSettingCell * pushSettingCell);

NS_ASSUME_NONNULL_BEGIN
@interface JCPushSettingCell : JCBaseTableViewCell
@property (nonatomic, copy) JCPushSettingSwichBlock swichBlock;
@property (nonatomic, assign) BOOL isOn;
- (void)showLoading;
- (void)hideLoading;
@end
NS_ASSUME_NONNULL_END
