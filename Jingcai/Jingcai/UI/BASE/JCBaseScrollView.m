//
//  JCBaseScrollView.m
//  Jingcai
//
//  Created by Rain on 2018/10/15.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseScrollView.h"

@implementation JCBaseScrollView
+ (instancetype)viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
@end
