//
//  JCDaShangShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDaShangShowView.h"
#import "JCCaiyunBall.h"
#import "JCChargeVC.h"



@implementation JCDaShangShowView

- (void)initViews {
    NSArray *dataArray = @[@"1",@"5",@"8",@"18",@"88",@"188"];
    for (int i=0; i<dataArray.count; i++) {
        JCCaiyunBall *ball = [JCCaiyunBall new];
        NSString *prize = dataArray[i];
        ball.prize = [prize integerValue];
        [self.dataArray addObject:ball];
    }
    
   
    
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(AUTO(0));
        make.height.mas_equalTo(AUTO(450)+kBottomTabSafeAreaHeight);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"用户打赏" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.centerX.equalTo(self);
    }];
    
    [self.bgView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(titleLab);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(17));
        make.height.mas_equalTo(0.5);
    }];
    
    [self.bgView addSubview:self.userImgView];
    [self.userImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(lineView).offset(AUTO(15));
        make.width.height.mas_equalTo(AUTO(32));
    }];
    
    [self.bgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userImgView);
        make.left.equalTo(self.userImgView.mas_right).offset(AUTO(8));
        make.right.offset(AUTO(-15));
    }];
    
    [self.bgView addSubview:self.collectionView];
//    self.priceView.frame = CGRectMake(0, 200, SCREEN_WIDTH, 150);
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(96));
    }];
    
    [self.bgView addSubview:self.priceTF];
    [self.priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(36));
    }];
    
    UILabel *hbLab = [UILabel initWithTitle:@"红币余额:" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:hbLab];
    [hbLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.priceTF.mas_bottom).offset(AUTO(16));
    }];
    
    [self.bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(hbLab.mas_right).offset(3);
        make.centerY.equalTo(hbLab);
        make.width.mas_lessThanOrEqualTo(AUTO(200));
    }];
    
    [self.bgView addSubview:self.rechargeBtn];
    [self.rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(hbLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(35)));
    }];
    
    [self.bgView addSubview:self.sureProtocolBtn];
    [self.sureProtocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hbLab.mas_bottom).offset(AUTO(25));
        make.left.offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
    }];
    
    [self.bgView addSubview:self.protocolLab];
    [self.protocolLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sureProtocolBtn);
        make.left.equalTo(self.sureProtocolBtn.mas_right);
    }];
    
        NSString *codeLoginString = @"阅读并同意《鲸猜足球用户购买协议》";
        NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:codeLoginString attributes:@{NSForegroundColorAttributeName:COLOR_A9A9A9,NSFontAttributeName:[UIFont systemFontOfSize:AUTO(12)]}];
        NSRange loginRange = [codeLoginString rangeOfString:@"《鲸猜足球用户购买协议》"];
    //    [atext yy_setFont:[UIFont systemFontOfSize:AUTO(12)] range:atext.yy_rangeOfAll];
        [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_5194E3} range:loginRange];
        YYTextHighlight *hi = [YYTextHighlight new];
        [atext setTextHighlight:hi range:codeLoginString.rangeOfAll];
        
        WeakSelf;
        hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            if (weakSelf.JCBlock) {
                weakSelf.JCBlock();
            }
            WebViewController *vc = [WebViewController new];
                vc.titleStr = @"鲸猜足球用户购买协议";
                NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_purchase];
                vc.urlStr = NonNil(urlStr);
//                [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
            [[weakSelf getViewController] presentViewController:vc animated:YES completion:nil];
        };

    self.protocolLab.attributedText=atext;
    
    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.sureProtocolBtn.mas_bottom).offset(AUTO(40));
        make.height.mas_equalTo(AUTO(40));
    }];
    
    
    self.position = AUTO(40)+kNavigationBarHeight;//contentTV的y坐标
    self.position = AUTO(220);
    self.height = AUTO(450);//contentTV的高度
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];


    
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


    float width = (SCREEN_WIDTH-AUTO(30)-AUTO(24))/3.0f;
    return CGSizeMake(width-3, AUTO(36));
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return AUTO(12);
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return AUTO(12);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    JCDaShangPriceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCDaShangPriceCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    for (JCCaiyunBall * itemBall in self.dataArray) {
        itemBall.state_issel = NO;
    }

    JCCaiyunBall * caiyunBall = self.dataArray[indexPath.row];
    caiyunBall.state_issel = YES;
    self.selItemBall = caiyunBall;
    [self.collectionView reloadData];
    self.priceTF.text = @"";

 
}

#pragma mark UITextField Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.length >= 1) { // 删除数据, 都允许删除
         return YES;
     }
         if (![self checkDecimal:[textField.text stringByAppendingString:string]]){
           
             if (textField.text.length > 0 && [string isEqualToString:@"."] && ![textField.text containsString:@"."]) {
                 return YES;
             }
             
             return NO;
             
         }
    if (self.selItemBall) {
        [self clearSelItem];
        self.selItemBall = nil;
    }
    return YES;
}

- (BOOL)checkDecimal:(NSString *)str
{
    NSString *regex = @"^[0-9]+(\\.[0-9]{1,2})?$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if([pred evaluateWithObject: str])
    {
        return YES;
    }else{
        return NO;
    }
}


- (void)keyboardWillShow:(NSNotification *)notification

{

    //获取键盘高度，在不同设备上，以及中英文下是不同的

    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;

    // 取得键盘的动画时间，这样可以在视图上移的时候更连贯

    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    CGFloat offset = SCREEN_HEIGHT - (self.position+self.height+kbHeight);

    if(offset<=0)

    {

        [UIView animateWithDuration:duration animations:^{

            CGRect frame = self.frame;

            frame.origin.y = offset;

            self.frame = frame;

        }];

    }

}

/**

 *  键盘消失

 */

- (void)keyboardWillHide:(NSNotification *)notification

{

    // 键盘动画时间

    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    

    //视图下沉恢复原状

    [UIView animateWithDuration:duration animations:^{

        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

    }];

}


//清除选中档位
- (void)clearSelItem {
    for (JCCaiyunBall * itemBall in self.dataArray) {
        itemBall.state_issel = NO;
    }
    [self.collectionView reloadData];
    
}
- (void)setUser_name:(NSString *)user_name {
    _user_name = user_name;
    self.nameLab.text = NonNil(user_name);
}

- (void)setUser_img:(NSString *)user_img {
    _user_img = user_img;
    [self.userImgView sd_setImageWithURL:[NSURL URLWithString:user_img] placeholderImage:JCIMAGE(@"userImg_default")];

}

- (void)rechargeBtnClick {
    if (self.JCRechargeBlock) {
        self.JCRechargeBlock();
    }
}

- (void)sureBtnClick {
    if (!self.sureProtocolBtn.selected) {
        [JCWToastTool showHint:@"请阅读《鲸猜足球用户购买协议》并点击同意"];
        return ;
    }
    if (self.priceTF.text.length==0&&!self.selItemBall) {
        [JCWToastTool showHint:@"请选择打赏金额"];
        return;
    }
    if (self.selItemBall) {
        if (self.selItemBall.prize>[[JCWUserBall currentUser].prize floatValue]/100) {
            if (self.JCRechargeBlock) {
                self.JCRechargeBlock();
                [JCWToastTool showHint:@"红币不足，请充值"];
            }
            return;
        }
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        [alertView alertTitle:@"确认打赏" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_2F2F2F SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
            if (self.JCDSBlock) {
                self.JCDSBlock([NSString stringWithFormat:@"%ld",self.selItemBall.prize]);
                
            }
            [alertView removeFromSuperview];

        } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
           [alertView removeFromSuperview];
        }];
        NSString *price =  [NSString stringWithFormat:@"%ld",self.selItemBall.prize];
        NSString *title = [NSString stringWithFormat:@"您确认支付%@红币打赏吗？",price];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange count_range = [title rangeOfString:price];
        if (count_range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
        }

        
        alertView.contentLab.attributedText = attr;
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
  
        
 
        
        return;
       
    }
    BOOL isPureFloat = [self isPureFloat:self.priceTF.text];
    BOOL isPureInt = [self isPureInt:self.priceTF.text];
    if (!isPureFloat&&!isPureInt) {
        [JCWToastTool showHint:@"请输入正确的金额"];
        return;
    }
    if ([self.priceTF.text floatValue]<0.01f) {
        NSLog(@"%f",[self.priceTF.text floatValue]);
        [JCWToastTool showHint:@"请填写大于等于0.01元的数字"];
        return;
    }
    if ([self.priceTF.text floatValue]>[[JCWUserBall currentUser].prize floatValue]/100) {
        if (self.JCRechargeBlock) {
            [JCWToastTool showHint:@"红币不足，请充值"];
            self.JCRechargeBlock();
        }
        return;
    }
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    [alertView alertTitle:@"确认打赏" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_2F2F2F SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
        if (self.JCDSBlock) {
            if (self.priceTF.text.length>0) {
                self.JCDSBlock(self.priceTF.text);
            }
        }
        [alertView removeFromSuperview];

    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
       [alertView removeFromSuperview];
    }];
    NSString *price =  self.priceTF.text;
    NSString *title = [NSString stringWithFormat:@"您确认支付%@红币打赏吗？",price];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange count_range = [title rangeOfString:price];
    if (count_range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
    }
    alertView.contentLab.attributedText = attr;
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];


}

- (void)closeBtnClick {
    [self endEditing:YES];
    [self hide];
}

- (void)sureProtocolBtnClick {
    self.sureProtocolBtn.selected = !self.sureProtocolBtn.selected;
    if(self.sureProtocolBtn.selected){
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"JCFanganAgree"];
    }else{
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JCFanganAgree"]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCFanganAgree"];
        }
        
    }
}


- (void)show {
    
    //清除上次打赏记录
    self.priceTF.text = @"";
    if (self.selItemBall) {
        self.selItemBall = nil;
        for (JCCaiyunBall * itemBall in self.dataArray) {
            itemBall.state_issel = NO;
        }
        [self.collectionView reloadData];
    }
    
    JCWUserBall *userBall = [JCWUserBall currentUser];
    NSString *price = [NSString stringWithFormat:@"%@红币",[JCCommomTool formatePointZero1:userBall.prize]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange range = [price rangeOfString:@"红币"];
    [attr addAttributes:@{NSForegroundColorAttributeName: COLOR_2F2F2F,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:range];
    self.priceLab.attributedText = attr;
    
    self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
        WeakSelf;
        [UIView animateWithDuration:0.3f animations:^{
            weakSelf.bgView.transform = CGAffineTransformIdentity;
        }];
    
}



- (void)hide {
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
         
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeFromSuperview];;
    });
}

//判断字符串是否为浮点数
- (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
//判断是否为整形：
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"ic_column_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"ic_column_close") forState:UIControlStateHighlighted];
        [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

-  (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setCornerOnTopWithRadius:20];
    }
    return _bgView;
}

- (UIImageView *)userImgView {
    if (!_userImgView) {
        _userImgView = [UIImageView new];
        [_userImgView hg_setAllCornerWithCornerRadius:AUTO(16)];
    }
    return _userImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0,AUTO(10), 0);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource= self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCWhiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[JCDaShangPriceCell class]
            forCellWithReuseIdentifier:@"JCDaShangPriceCell"];
    }
    return _collectionView;
}

- (UITextField *)priceTF {
    if (!_priceTF) {
        _priceTF = [UITextField new];
        _priceTF.textColor = JCBlackColor;
        _priceTF.textAlignment = NSTextAlignmentCenter;
        _priceTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        _priceTF.placeholder  = @"请填写其他打赏金额";
        _priceTF.layer.cornerRadius = 4;
        _priceTF.layer.masksToBounds = YES;
        _priceTF.layer.borderColor = COLOR_9F9F9F.CGColor;
        _priceTF.layer.borderWidth = 1;
        _priceTF.delegate = self;
        _priceTF.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return _priceTF;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)rechargeBtn {
    if (!_rechargeBtn) {
        _rechargeBtn = [UIButton initWithText:@"前往充值" FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:UIColorFromRGB(0x0085C7)];
        [_rechargeBtn addTarget:self action:@selector(rechargeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rechargeBtn;
}

- (UIButton *)sureProtocolBtn {
    if (!_sureProtocolBtn) {
        _sureProtocolBtn = [UIButton new];
        [_sureProtocolBtn setImage:JCIMAGE(@"protocol_select") forState:UIControlStateSelected];
        [_sureProtocolBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_sureProtocolBtn addTarget:self action:@selector(sureProtocolBtnClick) forControlEvents:UIControlEventTouchUpInside];

        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JCFanganAgree"]) {
            _sureProtocolBtn.selected = YES;
        }
    }
    return _sureProtocolBtn;
}

- (YYLabel *)protocolLab {
    if (!_protocolLab) {
        _protocolLab = [YYLabel new];
        _protocolLab.textColor = COLOR_999999;
        _protocolLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];

    }
    return _protocolLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认打赏" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new") forState:0];
        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new") forState:UIControlStateHighlighted];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn hg_setAllCornerWithCornerRadius:40];
    }
    return _sureBtn;
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
