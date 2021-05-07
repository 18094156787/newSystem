//
//  JCRacePickerView.m
//  Jingcai
//
//  Created by Administrator on 2019/2/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCRacePickerView.h"

@interface JCRacePickerView () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView * pickerView;
@property (weak, nonatomic) IBOutlet UIView * backView;
@property (weak, nonatomic) IBOutlet UIView *alertView;
@end

@implementation JCRacePickerView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.baseBackView = self.backView;
    self.baseAlertView = self.alertView;
    self.animationStyle = JCAlertViewAnimationStyleSheet;
}
- (IBAction)doneItemClick:(UIBarButtonItem *)sender {
    [self hide];
    [self endSelection];
}
- (void)setRaceArray:(NSArray<JCCalculateBall *> *)raceArray {
    _raceArray = raceArray;
    [self.pickerView reloadAllComponents];
}
- (void)endSelection {
    NSInteger selRow = [self.pickerView selectedRowInComponent:0];
    if (selRow == 0) {
        if (self.selNoneBlock) {
            self.selNoneBlock();
        }
        return ;
    }
    if (self.selItemBlock) {
        self.selItemBlock(self.raceArray[selRow-1]);
    }
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.raceArray.count+1;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        //没有选择的情况下.
        return @"请选择";
    }
    JCCalculateBall * calculateBall = self.raceArray[row-1];
    return calculateBall.showTitle;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    if (row == 0) {
//        if (self.selNoneBlock) {
//            self.selNoneBlock();
//        }
//        return ;
//    }
//    if (self.selItemBlock) {
//        self.selItemBlock(self.raceArray[row-1]);
//    }
}
@end
