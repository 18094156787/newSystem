//
//  JCQRCodeManager.m
//  Jingcai
//
//  Created by Administrator on 2019/4/4.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCQRCodeManager.h"

@implementation JCQRCodeManager
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static JCQRCodeManager * instance;
    dispatch_once(&onceToken, ^{
        instance = [[JCQRCodeManager alloc] init];
    });
    return instance;
}
+ (void)recognizeQRCodeWithImage:(UIImage *)image {
    //图像识别类
    CIDetector * dectector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy:CIDetectorAccuracyLow}];
    CIImage * originImage = [CIImage imageWithCGImage:image.CGImage];
    NSArray * features = [dectector featuresInImage:image.CIImage];
    NSLog(@"features.");
}
@end
