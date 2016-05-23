//
//  WaterFailTopicTableViewCell.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubRefreshTwoTableViewCell.h"
#import "UITableViewCell+ConfigModel.h"
#import "SubRefreshModel.h"

@interface SubRefreshTwoTableViewCell ()
@property (nonatomic, weak) IBOutlet UILabel *titleLB;

@end

@implementation SubRefreshTwoTableViewCell

- (void)configWithModel:(id)model {
    self.titleLB.text = [model content];
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(KLTableViewRowItem *)item {
    return 60.0f;
}

@end
