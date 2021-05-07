//
//  JCRacePickerView.h
//  Jingcai
//
//  Created by Administrator on 2019/2/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseAlertView.h"
#import "JCCalculateBall.h"

typedef void(^JCRacePickerSelNoneBlock)(void);
typedef void(^JCRacePickerSelItemBlock)(JCCalculateBall * calculateBall);

NS_ASSUME_NONNULL_BEGIN
@interface JCRacePickerView : JCBaseAlertView
@property (nonatomic, strong) NSArray <JCCalculateBall *> * raceArray;
@property (nonatomic, copy) JCRacePickerSelNoneBlock selNoneBlock;
@property (nonatomic, copy) JCRacePickerSelItemBlock selItemBlock;
@end
NS_ASSUME_NONNULL_END
