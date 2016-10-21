//
//  STSignUpViewController.h
//  ShowTray
//
//  Created by Ashwani on 18/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"

@interface STSignUpViewController : UIViewController
{
    __weak IBOutlet UITextField *txtMobile;
    __weak IBOutlet UITextField *txtPassword;
    __weak IBOutlet UITextField *txtEmail;
}

- (IBAction)btnSignUp:(id)sender;
- (IBAction)btnFbSignUp:(id)sender;
- (IBAction)btnGoogle:(id)sender;
- (IBAction)btnBack:(id)sender;


@end
