//
//  JCYCFriendUserCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCInviteCodeInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCFriendUserCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *phoneLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) JCInviteCodeInfoModel *model;

@end

NS_ASSUME_NONNULL_END
