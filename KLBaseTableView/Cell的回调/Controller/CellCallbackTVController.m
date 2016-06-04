//
//  CellCallbackTVController.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 2016/6/4.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "CellCallbackTVController.h"
#import "CallbackCell.h"
#import "SubCallbackDataSource.h"
#import "SubRefreshTVController.h"

@interface CellCallbackTVController ()

@end

@implementation CellCallbackTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (NSArray *)nibCellsName {
    return @[NSStringFromClass([CallbackCell class])];
}
- (KLTableViewDataSource *)configDataSource {
    return [[SubCallbackDataSource alloc] init];
}
/**
 *  cell的子内容点击回调(如头像/关注/点赞等) , 可在cell中自定义callbackID来判断回调类型
 */
- (void)cellCallbackWithRowItem:(KLTableViewRowItem *)item callbackID:(NSString *)callbackID atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"callbackID --> %@" ,callbackID);
    if ([callbackID isEqualToString:@"delete"]) {
        [[self.dataSource.sections[indexPath.section] items] removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
/**
 *  tableviewCell的点击事件
 */
- (void)didSelectWithRowItem:(KLTableViewRowItem *)item atIndexPath:(NSIndexPath *)indexPath {
    SubRefreshTVController *vc = [[SubRefreshTVController alloc] init];
    vc.tableViewStyle = UITableViewStyleGrouped;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
