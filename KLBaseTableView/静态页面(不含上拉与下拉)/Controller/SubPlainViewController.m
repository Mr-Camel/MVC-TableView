//
//  SubViewController.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubPlainViewController.h"
#import "SubGroupViewController.h"
#import "SubTableViewCell.h"
#import "SubPlainDataSource.h"

@interface SubPlainViewController ()

@end

@implementation SubPlainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (NSArray *)nibCellsName {
    return @[NSStringFromClass([SubTableViewCell class])];
}
- (KLTableViewDataSource *)configDataSource {
    //静态数据
    return [[SubPlainDataSource alloc] init];
}

#pragma mark - 点击事件
- (void)didSelectWithRowItem:(KLTableViewRowItem *)item atIndexPath:(NSIndexPath *)indexPath {
    SubGroupViewController *vc = [[SubGroupViewController alloc] init];
    vc.title = item.model;
    vc.tableViewStyle = UITableViewStyleGrouped;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
