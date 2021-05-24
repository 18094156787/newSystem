//
//  JCBasketBalMatchFilterWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBalMatchFilterWMVC.h"
#import "JCMatchFilterVC.h"
#import "JCMatchSelectModel.h"
#import "JCMatchFilterModel.h"
@interface JCBasketBalMatchFilterWMVC ()

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *selMatchLab;

@property (nonatomic,strong) JCMatchFilterVC *hotVC;

@property (nonatomic,strong) JCMatchFilterVC *allVC;

@property (nonatomic,strong) JCMatchFilterVC *jcVC;

@property (nonatomic,assign) NSInteger selMatchCount;

@property (nonatomic,strong) UIButton *filterBtn;

@property (nonatomic,strong) NSString *lastType;

@property (nonatomic,strong) NSString *lastTime;

@end

@implementation JCBasketBalMatchFilterWMVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
//    [self  configData];

}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [self initWMViews];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"筛选";
    [self initViews];
    
}

//- (void)setType:(NSString *)type {
//    _type = type;
//}

- (void)setTime:(NSString *)time {
    _time = time;

    
//    self.hotVC.time = self.time;
//    if (![self.lastTime isEqualToString:time]&&) {
//        [self getDataList];
//    }
    [self getDataList];
    self.lastTime = time;
    
}

- (void)configData {
        if (self.hotVC.dataSource.count>0||self.allVC.dataSource.count>0||self.jcVC.dataSource.count>0) {
            return;
        }
    [self getDataList];
}


- (void)resetData {
    [self.hotVC resetData];
    [self.allVC resetData];
    [self.jcVC resetData];

}

- (void)getDataList {
    [self resetData];
    
    [self.view showLoading];
    JCBasketBallMatchService_New *service = [JCBasketBallMatchService_New new];
    [service getMatchEventListWithTime:self.time type:self.type Success:^(id  _Nullable object) {
            [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
           NSArray *hotArray = [JCWJsonTool arrayWithJson:object[@"data"][@"hot_match"] class:[JCMatchFilterModel class]];//热门数据
            if (!hotArray||hotArray.count==0) {
                hotArray = @[];
            }
            self.hotVC.dataSource = [hotArray mutableCopy];
            NSArray *allArray = [JCWJsonTool arrayWithJson:object[@"data"][@"all_match"] class:[JCMatchSelectModel class]];//全部赛事
            if (!allArray||allArray.count==0) {
                allArray = @[];
            }
            self.allVC.dataSource = [allArray mutableCopy];
           NSArray *jcArray = [JCWJsonTool arrayWithJson:object[@"data"][@"get_guess"] class:[JCMatchFilterModel class]];//精彩数据
            if (!jcArray||jcArray.count==0) {
                jcArray = @[];
            }
            self.jcVC.dataSource = [jcArray mutableCopy];
            [self selMatchCountWithIndex:0];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
         [self.view endLoading];
    }];




}

- (void)initWMViews {
    self.menuViewStyle = WMMenuViewStyleLine;
    self.progressViewBottomSpace = 0;
    self.progressColor= JCBaseColor;
    self.titleColorSelected = COLOR_333333;
    self.titleColorNormal = COLOR_333333;
    self.titleSizeNormal = AUTO(14);
    self.titleSizeSelected = AUTO(14);
    self.progressHeight = 2;
    self.progressWidth = AUTO(28);
    //    self.pageAnimatable = YES;
//    self.titleFontName = @"PingFangSC-Semibold";
//    self.itemMargin = 20;
    self.menuView.backgroundColor = [UIColor whiteColor];
//    self.menuItemWidth =50;
    self.automaticallyCalculatesItemWidths = YES;
    
    

    

}

- (void)initViews {
    self.view.backgroundColor = COLOR_F0F0F0;
//    UIBarButtonItem *fileterItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"match_icon_sx") style:0 target:self action:@selector(filterItemClick)];
    UIButton *filterBtn = [UIButton initWithText:@"全选" FontSize:13 Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_1B1B1B];
    [filterBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
    [filterBtn setImage:JCIMAGE(@"yuce_select_normal") forState:UIControlStateHighlighted];
    [filterBtn setImage:JCIMAGE(@"protocol_select") forState:UIControlStateSelected];//protocol_select
    [filterBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    filterBtn.selected = YES;
    [filterBtn addTarget:self action:@selector(filterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    filterBtn.frame = CGRectMake(0, 0, 50, 44);
    self.filterBtn = filterBtn;
    UIBarButtonItem *fileterItem = [[UIBarButtonItem alloc] initWithCustomView:filterBtn];
    fileterItem.tintColor = JCWhiteColor;
    self.navigationItem.rightBarButtonItem = fileterItem;
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(70+kBottomTabSafeAreaHeight);
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
        make.height.mas_equalTo(70);
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"确定" FontSize:AUTO(14) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [sureBtn hg_setAllCornerWithCornerRadius:28];
    [self.bottomView addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomView).offset(AUTO(-15));
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(128, 44));
    }];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bottomView addSubview:self.selMatchLab];
    [self.selMatchLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(sureBtn);
    }];
    
    
}


#pragma mark <WMPageControllerDelegate>
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController * _Nonnull)pageController {
    return  self.titles.count;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.scrollView.backgroundColor = JCWhiteColor;
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, 0, SCREEN_WIDTH, 44);
}

-(CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 44+8, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-44-8-kBottomTabSafeAreaHeight-70);
    
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        self.hotVC.type =  index+1;
        self.hotVC.time = self.time;
        return self.hotVC;
    }
    if (index==1) {
        self.allVC.type = index+1;
        self.allVC.time = self.time;
        return self.allVC;
    }
    self.jcVC.type =  index+1;
    self.jcVC.time = self.time;
    return self.jcVC;
    
   
    
    
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    NSLog(@"%d",self.selectIndex);
    
    return;
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    [self selMatchCountWithIndex:self.selectIndex];
    [self configSelectStatus];//同步当前的全选状态
}


- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}





- (NSArray<NSString *> *)titles {
    return @[@"重要",@"全部",@"竞篮"];
}

- (void)configSelectStatus {
    if (self.selectIndex==0) {
        self.filterBtn.selected = self.hotVC.isSelectAll;
    }
    if (self.selectIndex==1) {
        self.filterBtn.selected = self.allVC.isSelectAll;
    }
    if (self.selectIndex==2) {
        self.filterBtn.selected = self.jcVC.isSelectAll;
    }

}


- (void)filterBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.selectIndex==0) {
        [self.hotVC selectAllWithStatus:sender.selected];
    }
    if (self.selectIndex==1) {
        [self.allVC selectAllWithStatus:sender.selected];
    }
    if (self.selectIndex==2) {
        [self.jcVC selectAllWithStatus:sender.selected];
    }

    [self selMatchCountWithIndex:self.selectIndex];
    
}

//选择联赛的数量
- (void)selMatchCountWithIndex:(NSInteger)index {
    if (index==0) {
        self.selMatchCount = 0;
        [self.hotVC.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                self.selMatchCount++;
            }
        }];
//        if (self.selMatchCount==self.hotVC.dataArr.count) {
//            self.hotVC.isSelectAll = ye
//        }
        self.hotVC.isSelectAll = self.selMatchCount==self.hotVC.dataArr.count?YES:NO;
        self.filterBtn.selected = self.selMatchCount==self.hotVC.dataArr.count?YES:NO;

    }
    if (index==1) {
        self.selMatchCount = 0;
        [self.allVC.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                self.selMatchCount++;
            }
        }];
        self.allVC.isSelectAll = self.selMatchCount==self.allVC.dataArr.count?YES:NO;
        self.filterBtn.selected = self.selMatchCount==self.allVC.dataArr.count?YES:NO;
        self.selMatchLab.text = [NSString stringWithFormat:@"已选择%ld个联赛",self.selMatchCount];
    }
    
    if (index==2) {
        self.selMatchCount = 0;
        [self.jcVC.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                self.selMatchCount++;
            }
        }];
        self.jcVC.isSelectAll = self.selMatchCount==self.jcVC.dataArr.count?YES:NO;
        self.filterBtn.selected = self.selMatchCount==self.jcVC.dataArr.count?YES:NO;
        self.selMatchLab.text = [NSString stringWithFormat:@"已选择%ld个联赛",self.selMatchCount];
    }

    NSString *count = [NSString stringWithFormat:@"已选 %ld 个联赛",self.selMatchCount];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:count];
    NSRange range = [count rangeOfString:[NSString stringWithFormat:@"%ld",self.selMatchCount]];
    [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)]} range:range];
    self.selMatchLab.attributedText = attr;
}

- (void)sureBtnClick {
    if (self.selectIndex==0) {
        NSMutableArray *array = [NSMutableArray array];
        [self.hotVC.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                [array addObject:obj.competition_id];
            }
        }];
        if (array.count==0) {
            [JCWToastTool showHint:@"至少选择一场赛事"];
            return;
        }
        if (self.JCFilterBlock) {
            self.JCFilterBlock(array,@"2");
        }
        
    }
    if (self.selectIndex==1) {
        NSMutableArray *array = [NSMutableArray array];
        [self.allVC.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                [array addObject:obj.competition_id];
            }
        }];
        if (array.count==0) {
            [JCWToastTool showHint:@"至少选择一场赛事"];
            return;
        }
        if (self.JCFilterBlock) {
            self.JCFilterBlock(array,@"3");
        }
    }
    
    if (self.selectIndex==2) {
        NSMutableArray *array = [NSMutableArray array];
        [self.jcVC.dataArr enumerateObjectsUsingBlock:^(JCMatchFilterModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                [array addObject:obj.competition_id];
            }
        }];
        if (array.count==0) {
            [JCWToastTool showHint:@"至少选择一场赛事"];
            return;
        }
        if (self.JCFilterBlock) {
            self.JCFilterBlock(array,@"4");
        }
    }
    
}


#pragma mark lazyload

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = JCWhiteColor;
    }
    return _bottomView;
}

- (UILabel *)selMatchLab {
    if (!_selMatchLab) {
        _selMatchLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _selMatchLab;
}

- (JCMatchFilterVC *)hotVC {
    if (!_hotVC) {
        _hotVC = [JCMatchFilterVC new];
        _hotVC.style = 1;
        WeakSelf;
        _hotVC.JCSelectBlock = ^(NSInteger type) {
            [weakSelf selMatchCountWithIndex:type];
        };
    }
    return _hotVC;
}
- (JCMatchFilterVC *)allVC {
    if (!_allVC) {
        _allVC = [JCMatchFilterVC new];
        _allVC.style = 1;
        _allVC.type = 2;
        _allVC.selectIndex = 1;
        WeakSelf;
        _allVC.JCSelectBlock = ^(NSInteger type) {
            [weakSelf selMatchCountWithIndex:type];
        };
    }
    return _allVC;
}

- (JCMatchFilterVC *)jcVC {
    if (!_jcVC) {
        _jcVC = [JCMatchFilterVC new];
        _jcVC.style = 1;
        _jcVC.selectIndex = 2;
        WeakSelf;
        _jcVC.JCSelectBlock = ^(NSInteger index) {
            [weakSelf selMatchCountWithIndex:index];
        };
    }
    return _jcVC;
}



@end
