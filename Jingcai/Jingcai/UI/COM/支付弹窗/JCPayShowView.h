//
//  JCPayShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCPayWayBall.h"
#import "JCHongbaoShowCell.h"
#import "JCBuyPlanPayWayCell.h"
#import "JCDakaBuyPlanProtocolCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPayShowView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIButton *sureProtocolBtn;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property(nonatomic,strong) NSMutableArray *payWayArray;

@property (nonatomic,strong) JCPayWayBall *selPayWay;

@property(nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSArray *hongbaoArray;

@property (nonatomic,strong) JCWTjInfoBall *payInfoModel;

@property (nonatomic,strong) JCWMyHongbaoBall *useHbModel;//当前选中的红包

@property (nonatomic,strong) NSString *price;

@property (nonatomic,copy) void(^JCSureBlock)(NSString *hb_id);

@property (nonatomic,copy) void(^JCRechargeBlock)(void);

@property (nonatomic,copy) void(^JCProtocolBlock)(void);

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
