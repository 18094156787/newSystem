//
//  JCActivityRedPacketListView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityRedPacketListView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *bgImgView;

@end

NS_ASSUME_NONNULL_END
