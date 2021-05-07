//
//  JNMatchSJAgainstCountdown_Cell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstCountdown_Cell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *leftLineImgView;

@property (nonatomic,strong) UIImageView *rightLineImgView;

@property (nonatomic,strong) UILabel *hoursLab;

@property (nonatomic,strong) UILabel *minutesLab;

@property (nonatomic,strong) UILabel *secondsLab;

@property (nonatomic,strong) NSString * hours;

@property (nonatomic,strong) NSString * minutes;

@property (nonatomic,strong) NSString * seconds;

@end

NS_ASSUME_NONNULL_END
