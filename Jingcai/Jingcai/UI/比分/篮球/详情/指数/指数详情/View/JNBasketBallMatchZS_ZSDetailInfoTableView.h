//
//  JNBasketBallMatchZS_ZSDetailInfoTableView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JNMatchZS_PLInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNBasketBallMatchZS_ZSDetailInfoTableView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,assign) NSInteger type;//type  1胜负 2让分 3总分

@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) NSArray *dataSource;

@property(nonatomic,strong) JNMatchZS_PLInfoModel *currentModel;



@end

NS_ASSUME_NONNULL_END
