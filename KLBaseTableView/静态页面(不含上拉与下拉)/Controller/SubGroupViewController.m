//
//  SubGroupController.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubGroupViewController.h"
#import "SubPlainViewController.h"
#import "SubTableViewCell.h"
#import "SubGroupDataSource.h"

@interface SubGroupViewController ()

@end

@implementation SubGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (NSArray *)nibCellsName {
    return @[NSStringFromClass([SubTableViewCell class])];
}
- (KLTableViewDataSource *)configDataSource {
    //静态数据
    return [[SubGroupDataSource alloc] init];
}

#pragma mark - 点击事件
- (void)didSelectWithRowItem:(KLTableViewRowItem *)item atIndexPath:(NSIndexPath *)indexPath {
    SubPlainViewController *vc = [[SubPlainViewController alloc] init];
    vc.title = item.model;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
