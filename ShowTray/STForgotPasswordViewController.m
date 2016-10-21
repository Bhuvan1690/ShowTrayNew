//
//  STForgotPasswordViewController.m
//  ShowTray
//
//  Created by Ashwani on 21/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import "STForgotPasswordViewController.h"

@interface STForgotPasswordViewController ()

@end

@implementation STForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnReset:(id)sender {
}

- (IBAction)btnConfirm:(id)sender {
    [[self processDelegate] processSuccessful:YES];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnCancel:(id)sender {
    [[self processDelegate] processSuccessful:NO];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
