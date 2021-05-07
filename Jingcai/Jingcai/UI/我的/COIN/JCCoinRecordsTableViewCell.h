//
//  JCCoinRecordsTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/24.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWCoinRecordBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCCoinRecordsTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (strong, nonatomic) JCWCoinRecordBall * recordBall;

@end

NS_ASSUME_NONNULL_END
