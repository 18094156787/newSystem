//
//  JCTeamMatchInfoZhenRongCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamMatchPlayerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoZhenRongCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *bgImgView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) NSArray *dataArray;


@property (nonatomic,strong) NSString *zhenRongTime;


@end

NS_ASSUME_NONNULL_END
