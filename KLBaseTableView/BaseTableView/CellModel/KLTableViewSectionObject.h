//
//  KLTableViewSectionObject.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//
/**
 *  有多少区就需要建多少个KLTableViewSectionObject对象
 *  一个KLTableViewSecionObject包含一个分区的所有信息
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class KLTableViewRowItem;

@interface KLTableViewSectionObject : NSObject

/**
 *  分区头标题 , 默认为空 , 与分区头视图不可同时存在
 */
@property (nonatomic, copy) NSString *sectionHeaderTitle;
/**
 *  分区尾标题 , 默认为空 , 与分区尾视图不可同时存在
 */
@property (nonatomic, copy) NSString *sectionFooterTitle;
/**
 *  分区头高度 , 默认为0
 */
@property (nonatomic, assign) CGFloat sectionHeaderHeight;
/**
 *  分区尾高度 , 默认为0
 */
@property (nonatomic, assign) CGFloat sectionFooterHeight;
/**
 *  分区头视图 , 默认为空 , 与分区头标题不可同时存在
 */
@property (nonatomic, strong) UIView *sectionHeaderView;
/**
 *  分区尾视图 , 默认为空 , 与分区尾标题不可同时存在
 */
@property (nonatomic, strong) UIView *sectionFooterView;


@property (nonatomic, strong) NSMutableArray<KLTableViewRowItem *> *items;//每个对象都是tableviewitem , 即数据源

- (instancetype)initWithItems:(NSMutableArray<KLTableViewRowItem *> *)items;

@end
