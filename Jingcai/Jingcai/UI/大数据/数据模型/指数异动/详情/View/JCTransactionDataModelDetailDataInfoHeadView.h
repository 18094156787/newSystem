//
//  JCTransactionDataModelDetailDataInfoHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCKellyDataDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelDetailDataInfoHeadView : JCBaseView

@property (nonatomic,strong) UILabel *chuLab;

@property (nonatomic,strong) UILabel *jiLab;

@property (nonatomic,strong) NSString *type;//0全部 1胜平负、2让球、3进球数

@property (nonatomic,strong) NSString *chuWin;

@property (nonatomic,strong) NSString *chuEqual;

@property (nonatomic,strong) NSString *chuLose;

@property (nonatomic,strong) JCKellyDataDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
