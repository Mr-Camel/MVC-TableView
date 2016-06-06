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
 *  分区头标题 , 默认为空
 */
@property (nonatomic, copy) NSString *sectionHeaderTitle;
/**
 *  分区尾标题 , 默认为空
 */
@property (nonatomic, copy) NSString *sectionFooterTitle;


@property (nonatomic, strong) NSMutableArray<KLTableViewRowItem *> *items;//每个对象都是tableviewitem , 即数据源

- (instancetype)initWithItems:(NSMutableArray<KLTableViewRowItem *> *)items;

@end
