//
//  JCDatePickerView.m
//  Jingcai
//
//  Created by Administrator on 2019/1/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCDatePickerView.h"

@interface JCDatePickerView ()
@property (weak, nonatomic) IBOutlet UIView * backView;
@property (weak, nonatomic) IBOutlet UIView * alertView;
@property (weak, nonatomic) IBOutlet UIDatePicker * datePicker;
@end

@implementation JCDatePickerView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.baseBackView = self.backView;
    self.baseAlertView = self.alertView;
    self.animationStyle = JCAlertViewAnimationStyleSheet;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backViewTap)];
//    [self.backView addGestureRecognizer:tap];
//    [self.datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
}
- (IBAction)doneItemClick:(UIBarButtonItem *)sender {
    [self hide];
    if (self.completionBlock) {
        self.completionBlock(self.datePicker.date);
    }
}
//- (void)backViewTap {
//    [self hide];
//    if (self.completionBlock) {
//        self.completionBlock(self.datePicker.date);
//    }
//}
- (void)dateChange:(UIDatePicker *)datePicker {
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    //设置时间格式
//    formatter.dateFormat = @"yyyy 年 MM 月 dd 日";
//    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
//    self.text = dateStr;
//    if (self.changeBlock) {
//        self.changeBlock(self.datePicker.date);
//    }
}
- (void)setDate:(NSDate *)date {
    _date = date;
    self.datePicker.date = date ? date : [NSDate date];
}
@end
