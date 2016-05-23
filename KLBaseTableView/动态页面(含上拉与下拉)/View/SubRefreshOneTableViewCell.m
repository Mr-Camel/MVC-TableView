//
//  WaterFallAdvTableViewCell.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/21.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "SubRefreshOneTableViewCell.h"
#import "UITableViewCell+ConfigModel.h"

@interface SubRefreshOneTableViewCell ()
@property (nonatomic, weak) IBOutlet UILabel *titleLB;

@end

@implementation SubRefreshOneTableViewCell

- (void)configWithModel:(id)model {
    self.titleLB.text = [model title];
}


@end
