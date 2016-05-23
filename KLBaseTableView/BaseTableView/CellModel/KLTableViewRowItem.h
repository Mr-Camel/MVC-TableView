//
//  KLTableViewRowItem.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//
/**
 *  一区有多少行就需要建多少个KLTableViewRowItem对象
 *  一个KLTableViewRowItem包含一行的所有信息
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT CGFloat const CellDefaultHeight;

@interface KLTableViewRowItem : NSObject

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, copy) NSString  * _Nonnull cellClassName;
/**
 *  数据模型
 */
@property (nonatomic, strong) id _Nullable model;

- (instancetype _Nullable)initWithCellClassName:(NSString * _Nonnull)cellClassName model:(id _Nullable)model;

@end
