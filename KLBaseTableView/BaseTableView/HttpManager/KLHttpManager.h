//
//  HttpManager.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
    HttpManagerResultTypeSuccess, //请求成功
    HttpManagerResultTypeNoData, //请求成功,没有数据
    HttpManagerResultTypeFail       //请求失败
}HttpManagerResultType;

@interface KLHttpManager : NSObject

+ (void)post:(NSString *)postURL class:(Class)aClass params:(NSDictionary *)params block:(void (^)(id result, HttpManagerResultType type))block;

@end
