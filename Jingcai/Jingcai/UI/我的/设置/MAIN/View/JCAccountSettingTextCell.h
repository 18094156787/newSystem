//
//  JCAccountSettingTextCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "KKPaddingLabel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCAccountSettingTextCell : JCBaseTableViewCell_New

@property (strong, nonatomic) UILabel *leftLabel;

@property (strong, nonatomic) UILabel *rightLabel;

@property (strong, nonatomic) UIImageView *indicateImgView;

@property (strong, nonatomic) KKPaddingLabel *checkLabel;

@property (strong, nonatomic) NSString *leftTitle;

@property (strong, nonatomic) NSString *rightTitle;

@property (assign, nonatomic) BOOL isCheck;//审核中

@end

NS_ASSUME_NONNULL_END
