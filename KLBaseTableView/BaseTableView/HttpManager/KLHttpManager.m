//
//  HttpManager.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLHttpManager.h"
#import "AFAppDotNetAPIClient.h"
#import "MJExtension.h"

@implementation KLHttpManager

+ (void)post:(NSString *)post class:(Class)aClass params:(NSDictionary *)params block:(void (^)(id result, HttpManagerResultType type))block {
    [[AFAppDotNetAPIClient sharedClient] POST:post parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (!block) {
            return;
        }
        //这里的具体操作逻辑可以根据数据返回类型来操作
        
        //数据转模型
        if (!aClass) {//没有传入对象类型,直接返回数据
            block(responseObject ,HttpManagerResultTypeSuccess);
            return;
        }
        id item = [responseObject isKindOfClass:[NSDictionary class]] ? [aClass mj_objectWithKeyValues:responseObject] : [aClass mj_objectArrayWithKeyValuesArray:responseObject];
        
        if ([item isKindOfClass:[NSArray class]] && [item count] == 0) {//空数组
            block([NSArray array] ,HttpManagerResultTypeNoData);
            return;
        }
        if (!item) {//空对象
            block([[aClass alloc] init] ,HttpManagerResultTypeNoData);
            return;
        }
        
        block(item ,HttpManagerResultTypeSuccess);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil ,HttpManagerResultTypeFail);
        }
    }];
}




@end
