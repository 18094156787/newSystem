//
//  JCConfigModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCConfigModel.h"

@implementation JCConfigModel

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.customer = [aDecoder decodeObjectForKey:@"customer"];
        self.customer_award = [aDecoder decodeObjectForKey:@"customer_award"];
        self.get_about = [aDecoder decodeObjectForKey:@"get_about"];
        self.get_question = [aDecoder decodeObjectForKey:@"get_question"];
        self.get_customer = [aDecoder decodeObjectForKey:@"get_customer"];
        self.get_privacy = [aDecoder decodeObjectForKey:@"get_privacy"];
        self.get_purchase = [aDecoder decodeObjectForKey:@"get_purchase"];
        self.get_service = [aDecoder decodeObjectForKey:@"get_service"];
        self.get_tz = [aDecoder decodeObjectForKey:@"get_tz"];
        self.get_jctzsc = [aDecoder decodeObjectForKey:@"get_jctzsc"];

    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.customer forKey:@"customer"];
    [aCoder encodeObject:self.customer_award forKey:@"customer_award"];
    [aCoder encodeObject:self.get_about forKey:@"get_about"];
    [aCoder encodeObject:self.get_customer forKey:@"get_customer"];
    [aCoder encodeObject:self.get_privacy forKey:@"get_privacy"];
    [aCoder encodeObject:self.get_purchase forKey:@"get_purchase"];
    [aCoder encodeObject:self.get_service forKey:@"get_service"];
    [aCoder encodeObject:self.get_tz forKey:@"get_tz"];
    [aCoder encodeObject:self.get_jctzsc forKey:@"get_jctzsc"];
    [aCoder encodeObject:self.get_question forKey:@"get_question"];
    
}

#pragma mark - 扩展
+ (void)save:(JCConfigModel *)configModel {
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:configModel];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"JCConfigModel"];

}

+ (instancetype)currentConfigModel {
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"JCConfigModel"];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
+ (void)clear {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCConfigModel"];


}

@end
