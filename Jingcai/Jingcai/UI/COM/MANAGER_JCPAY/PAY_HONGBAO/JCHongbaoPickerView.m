//
//  JCHongbaoPickerView.m
//  Jingcai
//
//  Created by Administrator on 2018/12/29.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCHongbaoPickerView.h"

#define JC_HBToolHeight 44.f
#define JC_HBPickerDuration 0.1f

@interface JCHongbaoPickerView () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIView * contentView;
@property (weak, nonatomic) IBOutlet UIView * backView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * bottomConstraint;
@property (weak, nonatomic) IBOutlet UIToolbar * hbToolbar;
@property (weak, nonatomic) IBOutlet UIPickerView * hbPickerView;
@end

@implementation JCHongbaoPickerView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //[self intiSubViews];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 模拟红包数据
//    JCWMyHongbaoBall * bbbb = [JCWMyHongbaoBall new];
//    bbbb.name = @"AAAA";
//    self.hbArr = @[bbbb,bbbb,bbbb,bbbb,bbbb];
    
    // 点击消失
    UITapGestureRecognizer * backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backViewClick)];
    [self.backView addGestureRecognizer:backTap];
    
//    self.hbToolBar = [[UIToolbar alloc] init];
//    self.hbToolBar.tintColor = [UIColor blackColor];
//    UIBarButtonItem * doneItem = [[UIBarButtonItem alloc] initWithTitle:@"    完成    " style:UIBarButtonItemStylePlain target:self action:@selector(doneItemClick)];
//    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//    self.hbToolBar.items = @[spaceItem,doneItem];
//    [self addSubview:self.hbToolBar];
//
//    self.hbPickerView = [[UIPickerView alloc] init];
//    self.hbPickerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    self.hbPickerView.delegate = self;
//    self.hbPickerView.dataSource = self;
//    [self addSubview:self.hbPickerView];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = [UIScreen mainScreen].bounds;
}
- (IBAction)doneItemClick:(UIBarButtonItem *)sender {
    [self hide];
    // 选择了某个红包
    if (self.selIndex>0) {
        JCWMyHongbaoBall * hbBall = self.hbArr[self.selIndex];
        if (self.hbPickerSelBlock) {
            self.hbPickerSelBlock(hbBall);
        }
    }

}
- (void)backViewClick {
    [self hide];
}

#pragma mark - Setter
- (void)setHbArr:(NSArray<JCWMyHongbaoBall *> *)hbArr {
    _hbArr = hbArr;
    [self.hbPickerView reloadAllComponents];
}

#pragma mark -
- (void)doneItemClick {
    [self hide];
}
- (void)show {
    //变换
    self.backView.alpha = 0;
    self.contentView.transform = CGAffineTransformMakeTranslation(0, self.contentView.bounds.size.height);
    [UIView animateWithDuration:0.1f animations:^{
        self.backView.alpha = 1;
        self.contentView.transform = CGAffineTransformIdentity;
    }];
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    for (UIView * view in window.subviews) {
        if ([view isKindOfClass:[self class]]) {
            return ;
        }
    }
    [window addSubview:self];
}
- (void)hide {
    [UIView animateWithDuration:0.1f animations:^{
        self.backView.alpha = 0;
        self.contentView.transform = CGAffineTransformMakeTranslation(0, self.contentView.bounds.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger count = self.hbArr.count;
    if (count == 0) {
//        self.hongbaoNameLabel.text = @"无可用的抵扣红包";
//        self.hongbaoView.userInteractionEnabled = NO;
    } else {
//        self.hongbaoView.userInteractionEnabled = YES;
    }
    return count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    JCWMyHongbaoBall * hongbaoBall = self.hbArr[row];
    return hongbaoBall.name;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (!self.hbArr || self.hbArr.count <= 0) {
        return ;
    }
    // 选择了某个红包
    JCWMyHongbaoBall * hbBall = self.hbArr[row];
    if (self.hbPickerSelBlock) {
        self.hbPickerSelBlock(hbBall);
    }
    self.selIndex = row;
    //self.hongbaoNameLabel.text = hongbaoBall.name;
    // 如果红包可以全额抵扣的话
//    if (hongbaoBall.prize >= self.tjInfoBall.sf) {
//        [self makeOptionsHidden:YES];
//        return ;
//    }
//    [self makeOptionsHidden:NO];
}
@end
