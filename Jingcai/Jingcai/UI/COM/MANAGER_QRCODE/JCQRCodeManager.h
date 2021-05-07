//
//  JCQRCodeManager.h
//  Jingcai
//
//  Created by Administrator on 2019/4/4.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCQRCodeManager : NSObject
+ (instancetype)shareManager;
+ (void)recognizeQRCodeWithImage:(UIImage *)image;
@end
NS_ASSUME_NONNULL_END
