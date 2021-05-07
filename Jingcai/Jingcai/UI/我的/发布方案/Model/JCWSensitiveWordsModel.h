//
//  JCWSensitiveWordsModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWSensitiveWordsModel : JCWBaseBall

@property (nonatomic,strong) NSString *word;

@property (nonatomic,strong) NSString *replace_word;

@end

NS_ASSUME_NONNULL_END
