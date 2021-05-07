//
//  JCHongbangDetailWMstckyVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangWMstckyVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic,assign) BOOL isMine;//yes表示个人的信息页面

@property (nonatomic,strong) NSString *autherID;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@end

NS_ASSUME_NONNULL_END
