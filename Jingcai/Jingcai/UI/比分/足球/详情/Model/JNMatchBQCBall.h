//
//  JNMatchBQCBall.h
//  Jingcai
//
//  Created by Administrator on 2019/7/2.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchBQCBall : JCWBaseBall
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * match_num;
@property (nonatomic, strong) NSString * ss;
@property (nonatomic, strong) NSString * sp;
@property (nonatomic, strong) NSString * sf;
@property (nonatomic, strong) NSString * ps;
@property (nonatomic, strong) NSString * pp;
@property (nonatomic, strong) NSString * pf;
@property (nonatomic, strong) NSString * fs;
@property (nonatomic, strong) NSString * fp;
@property (nonatomic, strong) NSString * ff;
@property (nonatomic, assign) NSInteger type;
//@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, assign) BOOL isBeidan;
#pragma mark //新版接口
@property (nonatomic, strong) NSString * l00;//负负
@property (nonatomic, strong) NSString * l01;//负平
@property (nonatomic, strong) NSString * l03;//负胜
@property (nonatomic, strong) NSString * l10;//平负
@property (nonatomic, strong) NSString * l11;//平平
@property (nonatomic, strong) NSString * l13;//平胜
@property (nonatomic, strong) NSString * l30;//胜负
@property (nonatomic, strong) NSString * l31;//胜平
@property (nonatomic, strong) NSString * l33;//胜胜
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * created_desc;
@end
NS_ASSUME_NONNULL_END
