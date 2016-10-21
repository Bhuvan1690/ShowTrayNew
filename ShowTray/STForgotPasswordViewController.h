//
//  STForgotPasswordViewController.h
//  ShowTray
//
//  Created by Ashwani on 21/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProcessDataDelegate <NSObject>
@optional
- (void) processSuccessful: (BOOL)success;
@end

@interface STForgotPasswordViewController : UIViewController
{
    __weak IBOutlet UITextField *txtOTP;
    
}
- (IBAction)btnReset:(id)sender;
- (IBAction)btnConfirm:(id)sender;
- (IBAction)btnCancel:(id)sender;

@property(retain) id <ProcessDataDelegate> processDelegate;

@end
