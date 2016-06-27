//
//  KLTableViewDataSource.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KLTableViewSectionObject.h"
#import "KLTableViewRowItem.h"

@protocol KLTableViewDataSource <UITableViewDataSource>

- (KLTableViewRowItem *)tableView:(UITableView *)tableView itemForRowAtIndexPath:(NSIndexPath *)indexPath;
- (KLTableViewSectionObject *)tableView:(UITableView *)tableView objectOfSection:(NSInteger)section;
- (void)cellCallbackBlock:(void (^)(UITableViewCell *cell ,NSString *callbackID))cellCallback;

@end

@interface KLTableViewDataSource : NSObject <KLTableViewDataSource>

/**
 * 二维数组 , 每个元素都是一个sectionOBJ对象 , 对象中有一个items数组
 */
@property (nonatomic, strong) NSMutableArray<KLTableViewSectionObject *> *sections;

- (instancetype)initWithSections:(NSMutableArray<KLTableViewSectionObject *> *)sections;

- (void)cleanAllSections;

/**
 *  网络请求下拉刷新时回调数据处理方法 , 交由子类去实现
 */
- (void)refreshWithModel:(id)model;
/**
 *  网络请求上拉加载时回调数据处理方法 , 交由子类去实现
 */
- (void)loadWithModel:(id)model;


@end
