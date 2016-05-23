//
//  UITableView+RegisterNib.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 16/5/20.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "UITableView+RegisterNib.h"

@implementation UITableView (RegisterNib)

- (void)registerNibWithIdentifiers:(NSArray *)identifiers {
    for (NSString *identife in identifiers) {
        [self registerNib:[UINib nibWithNibName:identife bundle:nil] forCellReuseIdentifier:identife];
    }
}

@end
