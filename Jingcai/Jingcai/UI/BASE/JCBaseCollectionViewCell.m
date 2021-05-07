//
//  JCBaseCollectionViewCell.m
//  Jingcai
//
//  Created by Rain on 2018/10/10.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"
#import <CoreMotion/CoreMotion.h>

@interface JCBaseCollectionViewCell ()
@property (nonatomic, strong) CMMotionManager * motionMgr;
@end

@implementation JCBaseCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    //加速度
//    if (self.motionMgr.isAccelerometerAvailable) {
//        NSOperationQueue * queue = [[NSOperationQueue alloc] init];
//        [self.motionMgr startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
//            if (error) {
//                [self.motionMgr stopAccelerometerUpdates];
//                NSLog(@"加速计发生错误!");
//                return ;
//            }
//            CMAcceleration acceleration = accelerometerData.acceleration;
//            NSLog(@"x:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
//            //跟随
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.transform = CGAffineTransformMakeTranslation(10*acceleration.x, 10*acceleration.y);
//            });
//        }];
//    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        [self data];
    }
    return self;
}

- (void)initViews {
    
}

- (void)data {
    
}

- (CMMotionManager *)motionMgr {
    if (!_motionMgr) {
        _motionMgr = [[CMMotionManager alloc] init];
    }
    return _motionMgr;
}
@end
