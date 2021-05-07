//
//  JNMatchBFBall.h
//  Jingcai
//
//  Created by Administrator on 2019/7/2.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchBFBall : JCWBaseBall
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * match_num;

@property (nonatomic, strong) NSString * s10;
@property (nonatomic, strong) NSString * s20;
@property (nonatomic, strong) NSString * s21;
@property (nonatomic, strong) NSString * s30;
@property (nonatomic, strong) NSString * s31;
@property (nonatomic, strong) NSString * s32;
@property (nonatomic, strong) NSString * s40;
@property (nonatomic, strong) NSString * s41;
@property (nonatomic, strong) NSString * s42;
@property (nonatomic, strong) NSString * s50;
@property (nonatomic, strong) NSString * s51;
@property (nonatomic, strong) NSString * s52;
@property (nonatomic, strong) NSString * sw;

@property (nonatomic, strong) NSString * s00;
@property (nonatomic, strong) NSString * s11;
@property (nonatomic, strong) NSString * s22;
@property (nonatomic, strong) NSString * s33;
@property (nonatomic, strong) NSString * sp;

@property (nonatomic, strong) NSString * s01;
@property (nonatomic, strong) NSString * s02;
@property (nonatomic, strong) NSString * s03;
@property (nonatomic, strong) NSString * s04;
@property (nonatomic, strong) NSString * s05;
@property (nonatomic, strong) NSString * s12;
@property (nonatomic, strong) NSString * s13;
@property (nonatomic, strong) NSString * s14;
@property (nonatomic, strong) NSString * s15;
@property (nonatomic, strong) NSString * s23;
@property (nonatomic, strong) NSString * s24;
@property (nonatomic, strong) NSString * s25;
@property (nonatomic, strong) NSString * sl;

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, assign) BOOL isShowAll;
#pragma mark //新接口
@property (nonatomic, strong) NSString *created_desc;

@end
NS_ASSUME_NONNULL_END
