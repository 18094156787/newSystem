//
//  JCColumnService.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnService.h"

@implementation JCColumnService

//获取专栏详情
//column_id 专栏id
- (void)getColumnInfoWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{@"column_id":column_id};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"column_info" paramDic:param ignoreArray:@[]];
    urlString = @"http://192.168.10.223:9501/column_info?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOlsiMTcyLjE4LjAuNjo5NTAzIl0sImF1ZCI6WyIxNzIuMTguMC42Ojk1MDMiXSwiaWF0IjoxNjExNTY2Nzg3LCJuYmYiOjE2MTE1NjY3ODcsImV4cCI6MTYxMTgyNTk4NywianRpIjp7ImlkIjoyNzEwNTcsInR5cGUiOiJKV1QifX0.6Aq-0SUWjqKyiBVQEHJnHHDGFBUba6gR72d2nVYXJPA&column_id=2";
    [manager GET:urlString parameters:param headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self deathWithSuccessInfo:responseObject];
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        [self dealWithError:error];
    }];
}
//关注专栏
- (void)getConcernColumnWithID:(NSString *)column_id success:(successBlock)successBlock failure:(failureBlock)failureBlock {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSDictionary * param = @{};
    NSString * urlString = [JCWInterfaceTool_New serviceUrlWithRoute:@"column_subscribe" paramDic:param ignoreArray:@[]];
    [manager POST:urlString parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

@end
