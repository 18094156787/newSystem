//
//  JCYCNewUserGiftBagView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCNewUserGiftBagView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,copy) void(^JCBlock)(void);

@property (nonatomic,copy) void(^JCCloseBlock)(void);

@end

NS_ASSUME_NONNULL_END
