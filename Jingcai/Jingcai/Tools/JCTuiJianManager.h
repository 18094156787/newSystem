//
//  JCTuiJianManager.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlocks) (void);
NS_ASSUME_NONNULL_BEGIN

@interface JCTuiJianManager : NSObject
//红榜详情
//从我的购买记录进去,需要传type=2和order_id,其他页面进去不用
+ (void)getTuiJianDetailWithTuiJianID:(NSString *)tuijian_id orderID:(NSString *)order_id type:(NSString *)type  WithViewController:(UIViewController *)viewController is_push:(BOOL)push success:(successBlocks)successBlock;
//公众号详情
//从我的购买记录进去,需要传type=2和order_id,其他页面进去不用
+ (void)loadGZH_ArticleDetailWithArticleID:(NSString *)ID orderID:(NSString *)order_id type:(NSString *)type WithViewController:(UIViewController *)viewController is_push:(BOOL)push;
@end

NS_ASSUME_NONNULL_END
