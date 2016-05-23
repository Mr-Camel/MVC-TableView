//
//  WaterFallModel.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//
/**
 *  @brief  网络请求数据模型
 */

#import <Foundation/Foundation.h>
@class SubRefreshTwo;
@class SubRefreshOne;

@interface SubRefreshModel : NSObject

@property (nonatomic, strong) NSArray<SubRefreshTwo *> *two;
@property (nonatomic, strong) NSArray<SubRefreshOne *> *one;

@end

@interface SubRefreshTwo : NSObject

@property (nonatomic, copy) NSString *content;

@end

@interface SubRefreshOne : NSObject

@property (nonatomic, copy) NSString *title;

@end

