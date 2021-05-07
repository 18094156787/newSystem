//
//  JCCommunity_HB_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunity_HB_HeadView.h"
#import "UISegmentedControl+Extension.h"
#import "JCCommunity_HB_Item_HeadView.h"
#import "JCCommunityRankInfoModel.h"
#import "JCExpertWMViewController.h"
@implementation JCCommunity_HB_HeadView

- (void)initViews {
    
    
    [self addSubview:self.scrollowView];
    [self.scrollowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.offset(AUTO(-40));
        make.top.offset(AUTO(50));
    }];

    
    [self addSubview:self.moreView];
    [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(AUTO(30));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"查看全部达人" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.moreView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self.moreView);
    }];
    
    UIImageView *indicateImgView = [UIImageView new];
    indicateImgView.image = JCIMAGE(@"icon_more_right");
    [self.moreView addSubview:indicateImgView];
    [indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label);
        make.left.equalTo(label.mas_right).offset(3);
        make.size.mas_equalTo(CGSizeMake(8, 8));
    }];
    
    WeakSelf;
    [self.moreView bk_whenTapped:^{
        JCExpertWMViewController *vc = [JCExpertWMViewController new];
        vc.selectIndex = 1;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count==0) {
        return;
    }
//    [self.segmentController removeAllSegments];
//    [self.segmentController mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(AUTO(77)*dataSource.count, AUTO(26)));
//    }];

    for (UIView *subViews in self.scrollowView.subviews) {
        [subViews removeFromSuperview];
    }
    
    NSMutableArray *titleArray = [NSMutableArray array];
    for (int i=0; i<dataSource.count; i++) {
        
        self.scrollowView.contentSize = CGSizeMake(SCREEN_WIDTH*i, AUTO(210));
        JCCommunityRankInfoModel *model = dataSource[i];
        [titleArray addObject:NonNil(model.type_name)];
        JCCommunity_HB_Item_HeadView *itemView = [JCCommunity_HB_Item_HeadView new];
        itemView.type = model.type;
        itemView.isHongbang = YES;
        NSMutableArray *array = [NSMutableArray arrayWithArray:model.list];
        JCWExpertBall *moreModel = [JCWExpertBall new];
        moreModel.user_name = @"更多";
        moreModel.localImage = JCIMAGE(@"more_pp");
        moreModel.type = model.type;
        [array addObject:moreModel];
        itemView.dataSource = [NSArray arrayWithArray:array];
        itemView.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, AUTO(210));
        [self.scrollowView addSubview:itemView];
//        [self.segmentController insertSegmentWithTitle:model.name atIndex:i animated:NO];
        
    }
    
    
    if (self.tabSegment) {
//        self.tabSegment = nil;
        [self.tabSegment removeFromSuperview];
    }
    if (titleArray.count>0) {
        float start = SCREEN_WIDTH/2.0f-AUTO(77)*titleArray.count/2.0f;
        self.tabSegment = [[LMJTab alloc] initWithFrame:CGRectMake(start, AUTO(12), AUTO(77)*titleArray.count, AUTO(26)) lineWidth:1 lineColor:[UIColor whiteColor]];
        self.tabSegment.layer.cornerRadius = 5.0;
//        self.tabSegment.hidden = YES;
        [self.tabSegment setItemsWithTitle:titleArray normalItemColor:COLOR_F0F0F0 selectItemColor:JCBaseColor normalTitleColor:COLOR_9F9F9F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
        self.tabSegment.delegate = self;
//        self.tabSegment.centerX = self.centerX;
        
        [self addSubview:self.tabSegment];
    }


    self.moreView.hidden = NO;
    
    if (self.JCSelectBlock) {
        if (self.dataSource.count>0) {
            JCCommunityRankInfoModel *model = self.dataSource[0];
            self.JCSelectBlock(model.list.count);
        }


    }
    
}



-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    NSLog(@"CLICKED:%ld",tab.selectIndex);
    [self.scrollowView setContentOffset:CGPointMake(SCREEN_WIDTH*number, 0) animated:YES];
    if (self.JCSelectBlock) {
        JCCommunityRankInfoModel *model = self.dataSource[number];
        self.JCSelectBlock(model.list.count);

    }
}

- (UIImage *)imageWithColor: (UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



- (void)reloadIndex {
    [self.scrollowView setContentOffset:CGPointMake(SCREEN_WIDTH*self.tabSegment.selectIndex, 0) animated:YES];
    if (self.JCSelectBlock) {
        if (self.dataSource.count>0) {
            JCCommunityRankInfoModel *model = self.dataSource[self.tabSegment.selectIndex];
            self.JCSelectBlock(model.list.count);
        }


    }
}



-(UIScrollView *)scrollowView {
    if (!_scrollowView) {
        _scrollowView = [UIScrollView new];
        _scrollowView.scrollEnabled = NO;
    }
    return _scrollowView;
}

- (UIView *)moreView {
    if (!_moreView) {
        _moreView = [UIView new];
        _moreView.hidden = YES;
    }
    return _moreView;
}
@end
