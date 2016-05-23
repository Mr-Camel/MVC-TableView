//
//  SubTableViewCell.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubTableViewCell.h"
#import "UITableViewCell+ConfigModel.h"

@interface SubTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation SubTableViewCell

- (void)configWithModel:(id)model {
    self.label.text = model;
}
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(KLTableViewRowItem *)item {
    return 60.0f;
}
@end
