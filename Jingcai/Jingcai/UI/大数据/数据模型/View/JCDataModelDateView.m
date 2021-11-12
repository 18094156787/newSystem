//
//  JCDataModelDateView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDataModelDateView.h"
#import "JCDataModelDateCell.h"
#import "BRDatePickerView.h"
#import "NSDate+BRPickerView.h"
@implementation JCDataModelDateView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, AUTO(8), SCREEN_WIDTH, AUTO(65)) collectionViewLayout:flowLayout];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, AUTO(10), 0, AUTO(10));
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    self.collectionView.backgroundColor = JCWhiteColor;
    self.collectionView.scrollEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //    注册Cell，必须要有
    [self.collectionView registerClass:[JCDataModelDateCell class] forCellWithReuseIdentifier:@"JCDataModelDateCell"];
    [self addSubview:self.collectionView];
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.edges.insets(UIEdgeInsetsMake(0, AUTO(16), 0, AUTO(56)));
//        make.edges.insets(UIEdgeInsetsZero);
//    }];
    

//    [self addSubview:self.datePickBtn];
//    [self.datePickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self);
//        make.centerY.equalTo(self);
//        make.size.mas_equalTo(CGSizeMake(AUTO(56), AUTO(43)));
//    }];
    
//    UIView *lineView = [UIView new];
//    lineView.backgroundColor = COLOR_DDDDDD;
//    [self addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self);
//        make.bottom.equalTo(self);
//        make.height.mas_equalTo(0.5);
//    }];
    

//    WeakSelf;
//    [self.datePickBtn bk_whenTapped:^{
//        [weakSelf showdDataPickView];
//    }];


}
#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
     return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataArray.count;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(AUTO(52), AUTO(56));

}


//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 0;
}
//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

     return 0;
}



//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JCDataModelDateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCDataModelDateCell" forIndexPath:indexPath];
    cell.clearBg = self.clearBg;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentModel.select = NO;
    JCMatchTimeModel *model = self.dataArray[indexPath.row];
    model.select = YES;;
    self.currentModel = model;
    [self.collectionView reloadData];


    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    if (self.JCTimeBlock) {
        self.JCTimeBlock(model.time);
    }
}

- (void)setClearBg:(BOOL)clearBg {
    _clearBg = clearBg;
    if (self.clearBg) {
        self.collectionView.backgroundColor = JCClearColor;
        self.backgroundColor = JCClearColor;
    }else{
        self.collectionView.backgroundColor = JCWhiteColor;
        self.backgroundColor = JCWhiteColor;
    }
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    
    [self.collectionView reloadData];
    
//    if ([self.type intValue]==2) {
////        [dat]
//        for (int i=0; i<dataArray.count; i++) {
//            JCMatchTimeModel *model = dataArray[i];
//            if (model.select) {
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                         [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
//                });
//                break;
//                
//            }
//        }
//
//
//    }
}



- (void)showdDataPickView {
    // 1.创建日期选择器
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
    // 2.设置属性
    datePickerView.pickerMode = BRDatePickerModeYMD;
    datePickerView.title = @"日期";
    // datePickerView.selectValue = @"2019-10-30";
    
    if (self.currentDay.length==0) {
        datePickerView.selectDate = [NSDate date];
    }else{
        datePickerView.selectDate = [NSDate dateWithString:self.currentDay format:@"yyyy-MM-dd"];
    }

//    if ([self.type intValue]==9999) {
//
//        NSDate *shortDate = [NSDate dateWithString:@"2021-06-12" format:@"yyyy-MM-dd"];
//        NSDate *longDate = [NSDate dateWithString:@"2021-07-12" format:@"yyyy-MM-dd"];
//        datePickerView.minDate = shortDate;
//        datePickerView.maxDate = longDate;
//    }else if ([self.type intValue]==2) {
//        NSDate *longDate = [NSDate dateWithString:@"2000-01-01" format:@"yyyy-MM-dd"];
//        datePickerView.minDate = longDate;
//        datePickerView.maxDate = [NSDate date];
//    }else {
//        datePickerView.minDate = [NSDate date];
//        datePickerView.maxDate = [self getDate:[NSDate date] day:7];
//    }
    
    datePickerView.minDate = [NSDate date];
    datePickerView.maxDate = [self getDate:[NSDate date] day:7];

    datePickerView.isAutoSelect = NO;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        NSLog(@"选择的值：%@", selectValue);
        self.currentDay = selectValue;
        NSTimeInterval stamp = [selectDate timeIntervalSince1970];
        NSString *time = [NSString stringWithFormat:@"%.0f",stamp];
        NSLog(@"%@",time);
        
        //赛选出来的时间,年月日
        NSString *nym = [NSDate timeStringWithIntervalWithFormatMMDD:stamp];
        self.haveDate = NO;
        self.currentModel = nil;
        [self.dataArray enumerateObjectsUsingBlock:^(JCMatchTimeModel  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.select = NO;
        }];
        for (int i=0; i<self.dataArray.count; i++) {
            JCMatchTimeModel *model = self.dataArray[i];
//            NSString *nym1 = [NSDate timeStringWithIntervalWithFormatMMDD:[model.time longLongValue]];
            NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
            [formater setDateFormat:@"MM-dd"];
            NSDate *toDay = [formater dateFromString:model.xq];
            NSString * nym1 = [formater stringFromDate:toDay];
            if ([selectValue isEqualToString:model.time]) {
                NSLog(@"%@",nym1);
                self.haveDate = YES;
                self.currentModel.select = NO;
                model.select = YES;
                self.currentModel = model;
//                if (self.JCTimeBlock) {
//                    self.JCTimeBlock(self.currentModel.time);
//                }
                break;
            }
        }
        if (!self.haveDate) {

            
//            JCMatchTimeModel *model = self.dataArray[i];

            
            if (self.JCTimeBlock) {
                self.JCTimeBlock(selectValue);
            }
        }
 
        [self.collectionView reloadData];
        if (self.currentModel) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if ([self.dataArray containsObject:self.currentModel]) {
                    NSInteger index = [self.dataArray indexOfObject:self.currentModel];
                    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
                    [self collectionView:self.collectionView didSelectItemAtIndexPath:path];
                }

            });
            
        }else{
            
        }

    };
//    datePickerView.changeBlock = ^(NSDate *selectDate, NSString *selectValue) {
//
//    };
    // 设置自定义样式
    BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
    customStyle.titleTextColor = COLOR_212121;
    customStyle.pickerColor = JCWhiteColor;
    customStyle.pickerTextColor = COLOR_212121;
    customStyle.separatorColor = JCClearColor;
    customStyle.pickerTextFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(24)];
    customStyle.pickerTextColor = COLOR_212121;
    customStyle.doneTextFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    customStyle.doneTextColor = JCBtnColor;
    customStyle.cancelTextFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    customStyle.cancelTextColor = JCBtnColor;
    datePickerView.pickerStyle = customStyle;
    // 3.显示
    [datePickerView show];
}
- (NSDate *)getDate:(NSDate *)currentDate day:(NSInteger)day {
    NSInteger days = day;    // n天后的天数
    days = (days == 0 ? 2.f : days);//未指定天数则默认为两天
    NSDate *appointDate;    // 指定日期声明
    NSTimeInterval oneDay = 24 * 60 * 60;  // 一天一共有多少秒
    appointDate = [currentDate initWithTimeIntervalSinceNow: +(oneDay * days)];
    return appointDate;
}

- (UIButton *)datePickBtn {
    if (!_datePickBtn) {
        _datePickBtn = [UIButton new];
        [_datePickBtn setImage:JCIMAGE(@"icon_match_date") forState:0];
        [_datePickBtn setImage:JCIMAGE(@"icon_match_date") forState:UIControlStateHighlighted];
    }
    return _datePickBtn;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
    }
    return _bottomLineView;
}

@end
