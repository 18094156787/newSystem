//
//  JCPostButton.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCPostButton : UIButton

@property (nonatomic,copy) NSString *value;

@property (nonatomic,assign) BOOL isRQ;

@property (nonatomic,strong) NSString *spf;// (123 胜平负  456 让球胜平负)

@property (nonatomic,assign) NSInteger type;//type 1单关 2 多串

@property (nonatomic,copy) NSString *rop_id;//让球或者不让球id

@end

NS_ASSUME_NONNULL_END
