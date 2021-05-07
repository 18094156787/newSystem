//
//  JCWShowBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/9.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWShowBall : JCWBaseBall
@property (strong, nonatomic) NSString * avatar;
@property (strong, nonatomic) NSString * content;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * id;
@property (assign, nonatomic) NSInteger comment_num;
@property (strong, nonatomic) NSString * image;
@property (strong, nonatomic) NSString * is_plus;
@property (strong, nonatomic) NSString * user_id;
@property (assign, nonatomic) NSInteger plus;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSArray * comment;

#pragma mark - 扩展
@property (strong, nonatomic) NSString  * checked_avatar;
@property (strong, nonatomic) NSString  * checked_image;
@property (strong, nonatomic) NSString  * show_plus;
@property (strong, nonatomic) NSString  * show_comment_num;
@property (assign, nonatomic) BOOL bool_is_plus;
//{
//    avatar = "http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMbEskM9UiaaVMeo4oevzfKlv1kZPUQhlDu9Qt9jUraMRxfhVFab7Ih1icecibtXnMOOlePTv96c6tw/132",
//    content = "以小博大，成功收米",
//    time = "10/18",
//    id = "746",
//    comment_num = "-5",
//    image = "/upload/image/1/d79aac075930c83c2f1e369a511148fe.jpg",
//    is_plus = "2",
//    user_id = "188152",
//    plus = "13",
//    comment =     (
//    ),
//    name = "姚超",
//},

@end

NS_ASSUME_NONNULL_END
