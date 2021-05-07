//
//  JCLogTool.m
//  Jingcai
//
//  Created by Administrator on 2018/12/29.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCLogTool.h"

@implementation JCLogTool
+ (void)logMsg:(NSString *)msg {
    NSLog(@"%@", msg);
}
+ (void)logRect:(CGRect)rect {
    CGFloat xxxx = rect.origin.x;
    CGFloat yyyy = rect.origin.y;
    CGFloat wwww = rect.size.width;
    CGFloat hhhh = rect.size.height;
    NSLog(@"origin %f, %f, size %f, %f",xxxx,yyyy,wwww,hhhh);
}
@end
