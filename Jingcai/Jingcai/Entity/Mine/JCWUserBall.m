//
//  JCWUserBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/6.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWUserBall.h"
#import "JCWInterfaceTool.h"
#import "JCWStringTool.h"
#import "JCWCacheTool.h"
#import "JCWConst.h"
#import "JCJPushManager.h"
#import "JCWAppTool.h"
#import "JCWJsonTool.h"

@implementation JCWUserBall

- (BOOL)isBindTel {
    return ![JCWStringTool isEmptyStr:_user_phone];
}
- (NSString *)secTel {
//    if (self.user_phone.length != 11) {
//
//        NSLog(@"111-%ld",self.user_phone.length);
//        return @"";
//    }
    if (self.user_phone.length>7) {
        NSLog(@"111-%ld",self.user_phone.length);
        return [NSString stringWithFormat:@"%@****%@", [_user_phone substringToIndex:3], [_user_phone substringFromIndex:7]];
    }
    return @"";
//    return _user_phone;
}



#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.user_id = [aDecoder decodeObjectForKey:@"user_id"];


        self.user_code = [aDecoder decodeObjectForKey:@"user_code"];
        self.caiyun = [aDecoder decodeObjectForKey:@"caiyun"];
        self.fabu_type = [aDecoder decodeObjectForKey:@"fabu_type"];
        self.info = [aDecoder decodeObjectForKey:@"info"];
        self.qy = [aDecoder decodeObjectForKey:@"qy"];
        
        //
        self.token = [aDecoder decodeObjectForKey:@"token"];
//        self.token = @"44";
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.user_name = [aDecoder decodeObjectForKey:@"user_name"];
        self.fensi = [aDecoder decodeObjectForKey:@"fensi"];
        self.zhiding = [aDecoder decodeObjectForKey:@"zhiding"];
        self.tuijian = [aDecoder decodeObjectForKey:@"tuijian"];
        self.top = [aDecoder decodeObjectForKey:@"top"];
        self.prize = [aDecoder decodeObjectForKey:@"prize"];
        self.money = [aDecoder decodeObjectForKey:@"money"];
        self.sendmoney = [aDecoder decodeObjectForKey:@"sendmoney"];
        self.ten_red = [aDecoder decodeObjectForKey:@"ten_red"];
        self.user_img = [aDecoder decodeObjectForKey:@"user_img"];
        self.fabu_count = [aDecoder decodeObjectForKey:@"fabu_count"];
//        self.fabu_count = @"3";
        self.hongbao_count = [aDecoder decodeObjectForKey:@"hongbao_count"];
        self.unread_messages = [aDecoder decodeObjectForKey:@"unread_messages"];
        self.focus_on_count = [aDecoder decodeObjectForKey:@"focus_on_count"];
        
        self.user_phone = [aDecoder decodeObjectForKey:@"user_phone"];
        self.desc = [aDecoder decodeObjectForKey:@"desc"];
        self.fabu = [aDecoder decodeObjectForKey:@"fabu"];
//        self.fabu = @"1";
        self.remaining_double = [aDecoder decodeObjectForKey:@"remaining_double"];
        self.bankcard_number = [aDecoder decodeObjectForKey:@"bankcard_number"];
        self.tuisong = [aDecoder decodeObjectForKey:@"tuisong"];
        self.can_change_nickname = [aDecoder decodeObjectForKey:@"can_change_nickname"];
        self.can_change_avatar = [aDecoder decodeObjectForKey:@"can_change_avatar"];
        self.can_change_introduction = [aDecoder decodeObjectForKey:@"can_change_introduction"];

        

    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.user_id forKey:@"user_id"];
    [aCoder encodeObject:self.user_img forKey:@"user_img"];
    [aCoder encodeObject:self.caiyun forKey:@"caiyun"];
    [aCoder encodeObject:self.user_code forKey:@"user_code"];
    [aCoder encodeObject:self.fabu_type forKey:@"fabu_type"];
    [aCoder encodeObject:self.info forKey:@"info"];
    [aCoder encodeObject:self.qy forKey:@"qy"];

    
    
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.user_name forKey:@"user_name"];
    [aCoder encodeObject:self.user_phone forKey:@"user_phone"];
    
    [aCoder encodeObject:self.fensi forKey:@"fensi"];
    [aCoder encodeObject:self.zhiding forKey:@"zhiding"];
    [aCoder encodeObject:self.tuijian forKey:@"tuijian"];
    [aCoder encodeObject:self.top forKey:@"top"];
    [aCoder encodeObject:self.prize forKey:@"prize"];
    [aCoder encodeObject:self.money forKey:@"money"];
    [aCoder encodeObject:self.sendmoney forKey:@"sendmoney"];
    [aCoder encodeObject:self.ten_red forKey:@"ten_red"];
    [aCoder encodeObject:self.fabu_count forKey:@"fabu_count"];
    [aCoder encodeObject:self.hongbao_count forKey:@"hongbao_count"];
    [aCoder encodeObject:self.unread_messages forKey:@"unread_messages"];
    [aCoder encodeObject:self.focus_on_count forKey:@"focus_on_count"];
    [aCoder encodeObject:self.desc forKey:@"desc"];
    [aCoder encodeObject:self.fabu forKey:@"fabu"];
    [aCoder encodeObject:self.remaining_double forKey:@"remaining_double"];
    [aCoder encodeObject:self.bankcard_number forKey:@"bankcard_number"];
    [aCoder encodeObject:self.tuisong forKey:@"tuisong"];
    [aCoder encodeObject:self.can_change_nickname forKey:@"can_change_nickname"];
    [aCoder encodeObject:self.can_change_avatar forKey:@"can_change_avatar"];
    [aCoder encodeObject:self.can_change_introduction forKey:@"can_change_introduction"];

}

#pragma mark - 扩展
+ (void)save:(JCWUserBall *)userBall {
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:userBall];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"JCWUserBall"];
    //发送通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUserChange object:nil];
//    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationUserLogin object:nil];
    
        //设置推送别名
    [[JCJPushManager sharedManager] setAliasShowHUD:NO completion:^(BOOL succeed) {
        //
    }];

}
+ (void)saveWithoutAction:(JCWUserBall *)userBall {
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:userBall];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"JCWUserBall"];
}
+ (instancetype)currentUser {
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"JCWUserBall"];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
+ (void)logOut {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCWUserBall"];
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUserChange object:nil];
    //清除列表缓存数据
    [JCWCacheTool removeObjectForKey:CacheKeyMySubscribe];
//    [JCWCacheTool removeObjectForKey:CacheKeyMyBuyTuijian];
//    [JCWCacheTool removeObjectForKey:CacheKeyMyShow];
//    [JCWCacheTool removeObjectForKey:CacheKeyMyHuodong];
    
    //删除推送别名
    [[JCJPushManager sharedManager] deleteAliasShowHUD:NO completion:^(BOOL succeed) {
        //
    }];
}

+ (void)logOut_wechat {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCWUserBall"];
}


@end
