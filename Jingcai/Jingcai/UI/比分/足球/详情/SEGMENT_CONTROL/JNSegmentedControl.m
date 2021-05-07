//
//  JNSegmentedControl.m
//  Jingcai
//
//  Created by Administrator on 2019/7/10.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNSegmentedControl.h"

@implementation JNSegmentedControl
- (void)awakeFromNib {
    [super awakeFromNib];//UIColorFromRGB(0x333333)
    [self setTitleTextAttributes:@{
                                   NSForegroundColorAttributeName:JCBaseColor,
                                   NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14]}
                        forState:UIControlStateNormal];
}
@end
