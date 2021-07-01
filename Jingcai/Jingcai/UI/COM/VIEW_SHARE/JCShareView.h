//
//  JCShareView.h
//  Jingcai
//
//  Created by Administrator on 2019/2/1.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCShareView : JCBaseView
@property (strong, nonatomic) NSString * titleString;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * content;
@property (strong, nonatomic) NSString * desc;
//@property (strong, nonatomic) NSString * imageUrl;
@property (strong, nonatomic) UIImage * image;
@property (strong, nonatomic) NSString * imageUrl;
@property (strong, nonatomic) NSString * webPageUrl;
@property (strong, nonatomic) NSString * friend_url;
@property (assign, nonatomic) BOOL allow_AllPlaformAnalyse;//允许所有平台统计分析
@property (nonatomic, copy) void(^JCAllShareBlock)(NSInteger type);//type 1是微信好友 2是朋友圈 3是复制链接
@property (nonatomic, copy) void(^JCShareBlock)(void);//只响应点击,不管是否分享成功,只能微信和朋友圈
- (void)show;
- (void)hide;
@end
NS_ASSUME_NONNULL_END
