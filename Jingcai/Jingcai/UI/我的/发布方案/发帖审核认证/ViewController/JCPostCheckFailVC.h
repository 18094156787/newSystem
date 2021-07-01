//
//  JCPostCheckFailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckFailVC : JCBaseViewController

@property (strong, nonatomic) UIButton *editBtn;

@property (strong, nonatomic) UIButton *backBtn;

@property (strong, nonatomic) UIImageView *imgView;

@property (strong, nonatomic) UILabel* titleLab;

@property (strong, nonatomic) UILabel* infLab;

@property (strong, nonatomic) NSString  *fabu;//是否可以发布方案 0 不能发布 1 可以发布 2被禁 3审核中 4审核被拒 5.审核被退回


@end

NS_ASSUME_NONNULL_END
