//
//  STLoginViewController.h
//  ShowTray
//
//  Created by Ashwani on 16/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface STLoginViewController : UIViewController
{
    __weak IBOutlet UIView *viewEmail;
    __weak IBOutlet UIView *viewPassword;
    
    __weak IBOutlet UITextField *txtEmail;
    __weak IBOutlet UIView *txtPassword;
}

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *FBloginButton;

- (IBAction)actionFBLogin:(id)sender;
- (IBAction)actionGoogleLogin:(id)sender;

@end

