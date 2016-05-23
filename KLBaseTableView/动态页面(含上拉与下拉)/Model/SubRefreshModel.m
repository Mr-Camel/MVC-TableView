//
//  WaterFallModel.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubRefreshModel.h"
#import "MJExtension.h"

@implementation SubRefreshModel

+ (NSDictionary *)objectClassInArray {
    return @{@"two" : [SubRefreshTwo class] , @"onw" : [SubRefreshOne class]};
}

@end

@implementation SubRefreshOne

@end

@implementation SubRefreshTwo

@end

