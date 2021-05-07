//
//  JCHBExpertZhanjiHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHBExpertZhanjiHeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *huibaoLab;

@property (nonatomic,strong) UILabel *reduLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) NSArray *yllArray;

@property (nonatomic,strong) NSArray *mzArray;

@property (nonatomic,strong) NSDictionary *dataDic;

@property (nonatomic,copy) void(^JCHeadBlock)(NSString *type);



@end

NS_ASSUME_NONNULL_END
