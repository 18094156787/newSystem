//
//  JCWMyShowBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/13.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWMyShowBall : JCWBaseBall <NSCoding>
@property (strong, nonatomic) NSString * content;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * image;
@property (assign, nonatomic) NSInteger plus;
@property (assign, nonatomic) NSInteger click;
@property (assign, nonatomic) NSInteger commment;
@end
NS_ASSUME_NONNULL_END
