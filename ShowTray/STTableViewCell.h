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
@property (weak, nonatomic) IBOutlet UIView *viewContainer;
@end


@interface STProfileHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblMobile;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;
@end


@interface STEditProfileCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *btnUserImg;
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;
@property (weak, nonatomic) IBOutlet UITextField *txtFName;
@property (weak, nonatomic) IBOutlet UITextField *txtLName;
@property (weak, nonatomic) IBOutlet UITextField *txtDOB;
@property (weak, nonatomic) IBOutlet UILabel *lblMobile;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;

@end

