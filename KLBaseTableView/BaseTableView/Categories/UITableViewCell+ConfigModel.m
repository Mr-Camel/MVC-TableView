//
//  UITableViewCell+ConfigModel.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "UITableViewCell+ConfigModel.h"
#import <objc/runtime.h>

char *const UI_TABLEVIEW_CELL_CALL_BACK_BLOCK = "UITableViewCell_Callback_Block";

@implementation UITableViewCell (ConfigModel)

- (void)setCellBlock:(void (^)(UITableViewCell *, NSString *))cellBlock {
    objc_setAssociatedObject(self, UI_TABLEVIEW_CELL_CALL_BACK_BLOCK, cellBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITableViewCell *, NSString *))cellBlock {
    return objc_getAssociatedObject(self, UI_TABLEVIEW_CELL_CALL_BACK_BLOCK);
}

- (void)configWithModel:(id)model {
    
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(KLTableViewRowItem *)item {
    return 44.0f;
}

@end
