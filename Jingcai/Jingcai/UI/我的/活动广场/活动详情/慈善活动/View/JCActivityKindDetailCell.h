//
//  JCActivityKindDetailCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityKindUserVC.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindDetailCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UIScrollView *scrollowView;

@property (nonatomic, strong) JCActivityKindUserVC *userVC;

@property (nonatomic,strong) NSString *actID;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;


@end

NS_ASSUME_NONNULL_END
