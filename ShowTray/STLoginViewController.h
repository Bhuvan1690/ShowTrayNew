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
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *FBloginButton;
@end

