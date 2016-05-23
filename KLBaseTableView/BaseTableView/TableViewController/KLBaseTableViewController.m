//
//  KLBaseController.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLBaseTableViewController.h"
#import "UITableView+RegisterNib.h"

@interface KLBaseTableViewController ()

@end

@implementation KLBaseTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _tableViewStyle = UITableViewStylePlain;
        _dataSource = [self configDataSource];
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _tableViewStyle = UITableViewStylePlain;
        _dataSource = [self configDataSource];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _tableViewStyle = UITableViewStylePlain;
        _dataSource = [self configDataSource];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self.tableView registerNibWithIdentifiers:[self nibCellsName]];
}
- (NSArray *)nibCellsName {
    return @[];
}
- (KLTableViewDataSource *)configDataSource {
    return [[KLTableViewDataSource alloc] init];
}
- (void)createTableView {
    if (!self.tableView) {
        self.tableView = [[KLTableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        self.tableView.klDelegate = self;
        self.tableView.klDataSource = self.dataSource;
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:(CGRect){0, 0, 0, 0.01}];
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRect){0, 0, 0, 0.01}];
        [self.view addSubview:self.tableView];
    }
}

@end
