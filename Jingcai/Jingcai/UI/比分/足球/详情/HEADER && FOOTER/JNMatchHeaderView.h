//
//  JNMatchHeaderView.h
//  Jingcai
//
//  Created by Administrator on 2019/7/3.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseView.h"

typedef NS_ENUM(NSInteger, JNMatchHeaderSubViewType) {
    JNMatchHeaderSubViewTypeUndefined,
    JNMatchHeaderSubViewTypeSPF,    //胜平负
    JNMatchHeaderSubViewTypeRQSPF,  //让球胜平负
    JNMatchHeaderSubViewTypeRSF,    //让胜负
    JNMatchHeaderSubViewTypeSXP,    //单双数
    JNMatchHeaderSubViewTypeTime,   //发布时间
    JNMatchHeaderSubViewTypeGoal,   //进球分布
    JNMatchHeaderSubViewTypeTable,  //联赛积分
    JNMatchHeaderSubViewTypeZJ      //战绩
};

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchHeaderView : JCBaseView
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) JNMatchHeaderSubViewType subViewType;
@end
NS_ASSUME_NONNULL_END
