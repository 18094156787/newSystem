//
//  JNTabBarMainButton.h
//  Jingcai
//
//  Created by Administrator on 2019/6/4.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface JNTabBarMainButton : UIButton
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * normalImage;
@property (strong, nonatomic) NSString * selectImage;
@property (nonatomic, strong) UIImageView * iconImageView;

//@property (non)

@end
NS_ASSUME_NONNULL_END
