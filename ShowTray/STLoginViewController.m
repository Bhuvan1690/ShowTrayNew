//
//  STLoginViewController.m
//  ShowTray
//
//  Created by Ashwani on 16/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import "STLoginViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface STLoginViewController ()

@end

@implementation STLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // check fb login status
    
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
    }
    _FBloginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionFBLogin:(id)sender {
}

- (IBAction)actionGoogleLogin:(id)sender {
}
@end
