//
//  KLBaseController.h
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//
/**
 *  静态页面可直接继承此控制器 , 如设置页面
 */

#import <UIKit/UIKit.h>
#import "KLTableView.h"

@interface KLBaseTableViewController : UIViewController <KLTableViewDelegate>

@property (nonatomic, strong) KLTableView *tableView;
@property (nonatomic, strong) KLTableViewDataSource *dataSource;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;//默认为UITableViewStylePlain

/**
 *  子类重写此方法
 *  @return  需要注册的cell的classString(需要有xib)
 */
- (NSArray *)nibCellsName;
/**
 *  @brief  可重写此方法 , 将数据处理放入KLTableViewDataSource的子类中实现
 */
- (KLTableViewDataSource *)configDataSource;

@end
