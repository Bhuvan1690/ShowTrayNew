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
@import GoogleSignIn;

@interface STLoginViewController ()<GIDSignInUIDelegate>

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
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    //[[GIDSignIn sharedInstance] signInSilently];
    
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
    
//    UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"MainST" bundle:nil];
//    
//    // Load the initial view controller from the storyboard.
//    // Set this by selecting 'Is Initial View Controller' on the appropriate view controller in the storyboard.
//    SWRevealViewController *theInitialViewController = [secondStoryBoard instantiateInitialViewController];
//    [self.navigationController pushViewController:theInitialViewController animated:YES];
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}


- (IBAction)actionGoogleLogin:(id)sender {
    [[GIDSignIn sharedInstance] signIn];
}

@end
