//
//  STTableViewCell.h
//  ShowTray
//
//  Created by Ashwani on 22/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STTableViewCell : UITableViewCell

@end


@interface STProfileItemsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UIImageView *imgStatus;
@end


@interface STProfileHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblMobile;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;

@end

