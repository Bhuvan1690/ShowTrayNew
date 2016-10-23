//
//  STTableViewCell.m
//  ShowTray
//
//  Created by Ashwani on 22/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import "STTableViewCell.h"

@implementation STTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


@implementation STProfileHeaderCell : UITableViewCell

@end

@implementation STProfileItemsCell : UITableViewCell

@end

@implementation STEditProfileCell : UITableViewCell

@end
