//
//  JCKindInviteView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKindInviteView : JCBaseView

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic,strong) UIButton *shareBtn;

@property (nonatomic,strong) NSString *imgUrl;

@property (nonatomic,assign) BOOL isFinish;

@property (nonatomic,strong) UIImage *shareImage;

@property (nonatomic,copy) void(^JCBlock)(UIImage *image);

@property (nonatomic,copy) void(^JCCloseBlock)(void);



@end

NS_ASSUME_NONNULL_END
