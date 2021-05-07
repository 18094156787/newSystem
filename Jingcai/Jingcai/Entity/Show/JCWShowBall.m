//
//  JCWShowBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/9.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWShowBall.h"
#import "JCWInterfaceTool.h"
#import "JCWStringTool.h"

@implementation JCWShowBall
- (NSString *)checked_avatar {
    if ([JCWStringTool isUrlAddress:_avatar]) {
        return _avatar;
    }
    return [NSString stringWithFormat:@"%@%@", [JCWInterfaceTool imageUrl], _avatar];
}
- (NSString *)checked_image {
    if ([JCWStringTool isUrlAddress:_image]) {
        return _image;
    }
    return [NSString stringWithFormat:@"%@%@", [JCWInterfaceTool imageUrl], _image];
}
- (NSString *)show_plus {
    NSInteger showPlus = _plus < 0 ? 0 : _plus;
    return [NSString stringWithFormat:@"%ld", showPlus];
}
- (NSString *)show_comment_num {
    NSInteger showNum = _comment_num + 5;
    showNum = showNum < 0 ? 0 : showNum;
    return [NSString stringWithFormat:@"%ld", showNum];
}
- (BOOL)bool_is_plus {
    //1已点赞、2未点赞
    return [_is_plus isEqualToString:@"1"];
}
@end
