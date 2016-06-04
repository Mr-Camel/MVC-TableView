//
//  CallbackCell.m
//  KLBaseTableView
//
//  Created by 骆鸿泰 on 2016/6/4.
//  Copyright © 2016年 骆鸿泰. All rights reserved.
//

#import "CallbackCell.h"
#import "UITableViewCell+ConfigModel.h"
#import "CallbackModel.h"

@interface CallbackCell ()

@property (nonatomic, weak) IBOutlet UIImageView *headIV;
@property (nonatomic, weak) IBOutlet UILabel *nameLB;

@end

@implementation CallbackCell

- (void)awakeFromNib {
    self.headIV.userInteractionEnabled = YES;
    [self.headIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeadIV)]];
}

- (void)configWithModel:(id)model {
    self.headIV.image = [UIImage imageNamed:[model imgName]];
    self.nameLB.text = [model name];
}

- (void)clickHeadIV {
    if (self.cellBlock) {
        self.cellBlock(self ,@"headIV");
    }
}

- (IBAction)clickToDelete {
    if (self.cellBlock) {
        self.cellBlock(self ,@"delete");
    }
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(KLTableViewRowItem *)item {
    return 80;
}

@end
