//
//  JNMatchBattleCell.h
//  Jingcai
//
//  Created by Administrator on 2019/7/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCWMatchBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchBattleCell : UITableViewCell
@property (nonatomic, strong) NSArray * homeArr;
@property (nonatomic, strong) NSArray * awayArr;
@property (nonatomic, strong) JCWMatchBall * matchBall;
@end
NS_ASSUME_NONNULL_END
