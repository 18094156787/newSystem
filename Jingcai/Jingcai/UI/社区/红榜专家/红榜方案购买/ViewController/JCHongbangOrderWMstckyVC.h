//
//  JCHongbangOrderWMstckyVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"
#import "JCWTjInfoDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangOrderWMstckyVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic,strong) NSString *tjInfoId;

@property (nonatomic,strong) JCWTjInfoDetailBall *tjInfoDetailBall;

@property (nonatomic,strong) NSDictionary *dataDic;

@property (nonatomic,strong) JCHongbangDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
