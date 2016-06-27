//
//  KLTableViewDataSource.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "KLTableViewDataSource.h"
#import "UITableViewCell+ConfigModel.h"

@interface KLTableViewDataSource ()

@property (nonatomic, copy) void (^cellCallback)(UITableViewCell *cell ,NSString *callbackID);

@end

@implementation KLTableViewDataSource

#pragma mark - init
- (instancetype)init {
    self = [super init];
    if (self) {
        _sections = [NSMutableArray array];
    }
    return self;
}
- (instancetype)initWithSections:(NSMutableArray<KLTableViewSectionObject *> *)sections {
    self = [self init];
    if (self) {
        [self.sections addObjectsFromArray:sections];
    }
    return self;
}

- (void)cleanAllSections {
    self.sections = [NSMutableArray array];
}

- (void)refreshWithModel:(id)model {
    @throw [NSException exceptionWithName:@"Cann't use this method"
                                   reason:@"You can only call this method in subclass --> [subclass refreshWithModel:]"
                                 userInfo:nil];
}
- (void)loadWithModel:(id)model {
    @throw [NSException exceptionWithName:@"Cann't use this method"
                                   reason:@"You can only call this method in subclass --> [subclass loadWithModel:]"
                                 userInfo:nil];
}

#pragma mark - KLTableViewDataSource(供外部调用)
- (KLTableViewRowItem *)tableView:(UITableView *)tableView itemForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections.count > indexPath.section) {
        KLTableViewSectionObject *sectionOBJ = self.sections[indexPath.section];
        if (sectionOBJ.items.count > indexPath.row) {
            return sectionOBJ.items[indexPath.row];
        }
    }
    return nil;
}
- (KLTableViewSectionObject *)tableView:(UITableView *)tableView objectOfSection:(NSInteger)section {
    return (self.sections.count > section) ? self.sections[section] : nil;
}
- (void)cellCallbackBlock:(void (^)(UITableViewCell *, NSString *))cellCallback {
    self.cellCallback = cellCallback;
}
#pragma mark - UITableViewDataSource(内部实现)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections ? self.sections.count : 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.sections.count > 0) ? [[self.sections[section] items] count] : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KLTableViewRowItem *item = [self tableView:tableView itemForRowAtIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.cellClassName];
    if (cell == nil) {
        cell = [[NSClassFromString(item.cellClassName) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:item.cellClassName];
    }
    [cell configWithModel:item.model];
    if (self.cellCallback) {
        cell.cellBlock = self.cellCallback;
    }
    return cell;
}
#pragma mark - 区头区尾标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return  [[self tableView:tableView objectOfSection:section] sectionFooterTitle];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return  [[self tableView:tableView objectOfSection:section] sectionHeaderTitle];
}

@end
