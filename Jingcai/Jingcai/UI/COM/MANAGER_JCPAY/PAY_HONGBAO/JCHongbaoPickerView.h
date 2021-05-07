//
//  JCHongbaoPickerView.h
//  Jingcai
//
//  Created by Administrator on 2018/12/29.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWMyHongbaoBall.h"

typedef void (^JCHongbaoPickerSelBlock)(JCWMyHongbaoBall * _Nullable hongbaoBall);

NS_ASSUME_NONNULL_BEGIN
@interface JCHongbaoPickerView : JCBaseView
@property (assign, nonatomic) NSInteger selIndex; // 选中的index
@property (copy, nonatomic) JCHongbaoPickerSelBlock hbPickerSelBlock;
@property (strong, nonatomic) NSArray <JCWMyHongbaoBall *> * hbArr;
- (void)show;
- (void)hide;
@end
NS_ASSUME_NONNULL_END
