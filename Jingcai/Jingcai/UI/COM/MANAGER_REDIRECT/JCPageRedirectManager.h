//
//  JCPageRedirectManager.h
//  Jingcai
//
//  Created by Rain on 2018/11/27.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCPageRedirectManager : NSObject
+ (instancetype)sharedManager;
+ (void)redirectWithRoute:(NSString *)route vc:(UIViewController *)vc;
- (void)redirectToLatest;
- (void)redirectToMatch;
- (void)redirectToCal;
- (void)redirectToCharge;
- (void)redirectToHongbao;
- (void)redirectToInviteFriend;//跳转邀请新人页面
- (void)redirectToMyGuess;//跳转竞猜页面
- (void)redirectToTjUserWithTjUserId:(NSString *)tjUserId;//专家主页
@end
NS_ASSUME_NONNULL_END
