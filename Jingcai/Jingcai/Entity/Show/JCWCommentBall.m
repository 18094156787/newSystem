//
//  JCWCommentBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/12.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWCommentBall.h"
#import "JCWInterfaceTool.h"
#import "JCWStringTool.h"

@implementation JCWCommentBall
- (BOOL)bool_is_plus {
    //1已点赞、2未点赞
    return [_is_plus isEqualToString:@"1"];
}
- (NSString *)check_avatar {
    if ([JCWStringTool isUrlAddress:_avatar]) {
        return _avatar;
    }
    return [NSString stringWithFormat:@"%@%@", [JCWInterfaceTool imageUrl], _avatar];
}
@end
