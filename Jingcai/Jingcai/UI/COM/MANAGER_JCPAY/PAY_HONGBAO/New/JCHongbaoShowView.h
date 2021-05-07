//
//  JCHongbaoShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/2/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWMyHongbaoBall.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^JCHongbaoPickerSelBlock)(JCWMyHongbaoBall * _Nullable hongbaoBall);

@interface JCHongbaoShowView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) NSArray *dataArray;

@property (copy, nonatomic) JCHongbaoPickerSelBlock hbPickerSelBlock;

@property (copy, nonatomic) void(^JCNoUserHongbao)(void);

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
