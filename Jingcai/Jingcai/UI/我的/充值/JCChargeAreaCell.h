//
//  JCChargeAreaCell.h
//  Jingcai
//
//  Created by Administrator on 2019/1/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell.h"
#import "JCCaiyunBall.h"

//typedef void(^JCChargeItemClickBlock)(JCCaiyunBall * caiyunBall);

NS_ASSUME_NONNULL_BEGIN
@interface JCChargeAreaCell : JCBaseTableViewCell
@property (nonatomic, strong) NSArray <JCCaiyunBall *> * chargeItemArray;
//@property (nonatomic, copy) JCChargeItemClickBlock chargeItemClickBlock;
@property (nonatomic, readonly, strong) JCCaiyunBall * selItemBall;//选中的item
@end
NS_ASSUME_NONNULL_END
