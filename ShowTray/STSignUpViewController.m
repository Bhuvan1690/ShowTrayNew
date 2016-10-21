//
//  STSignUpViewController.m
//  ShowTray
//
//  Created by Ashwani on 18/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import "STSignUpViewController.h"

@interface STSignUpViewController ()

@end

@implementation STSignUpViewController

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

- (IBAction)btnSignUp:(id)sender {
}

- (IBAction)btnFbSignUp:(id)sender {
        UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"MainST" bundle:nil];
    
        // Load the initial view controller from the storyboard.
        // Set this by selecting 'Is Initial View Controller' on the appropriate view controller in the storyboard.
        SWRevealViewController *theInitialViewController = [secondStoryBoard instantiateInitialViewController];
        [self.navigationController pushViewController:theInitialViewController animated:YES];
}

- (IBAction)btnGoogle:(id)sender {
}

- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
