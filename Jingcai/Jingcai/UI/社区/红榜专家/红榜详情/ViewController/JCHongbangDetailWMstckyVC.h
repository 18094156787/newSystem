//
//  JCHongbangDetailWMstckyVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDetailWMstckyVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic,strong) NSString *tjInfoId;

@property (nonatomic,strong) NSDictionary *dataDic;

@property (nonatomic,strong) JCHongbangDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
