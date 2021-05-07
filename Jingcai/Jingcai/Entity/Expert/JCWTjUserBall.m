//
//  JCWTjUserBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWTjUserBall.h"
#import "JCWInterfaceTool.h"
#import "JCWStringTool.h"

@implementation JCWTjUserBall
- (NSString *)checked_user_img {
    if ([JCWStringTool isUrlAddress:_user_img]) {
        return _user_img;
    }
    return [NSString stringWithFormat:@"%@%@", [JCWInterfaceTool imageUrl], _user_img];
}
- (NSString *)subscribe {
    return [_subscribe isEqualToString:@"关注"] ? [NSString stringWithFormat:@"+ %@", _subscribe] : _subscribe;
}
- (BOOL)isSubscribe {
    return [self.subscribe isEqualToString:@"已关注"];
}
- (BOOL)has_qr_code {
    return ![JCWStringTool isEmptyStr:_qr_code];
}
- (BOOL)isShowZJ {
    return self.ten_tj_win > 5;
}
@end
