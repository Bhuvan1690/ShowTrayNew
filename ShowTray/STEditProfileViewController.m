//
//  STEditProfileViewController.m
//  ShowTray
//
//  Created by Ashwani on 22/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import "STEditProfileViewController.h"

@interface STEditProfileViewController ()

@end

@implementation STEditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];
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

- (IBAction)btnSubmit:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    STEditProfileCell *cellHeader;
    
    switch (indexPath.row) {
        case 0:
            CellIdentifier = @"EditProfileCell1";
          
            break;
        case 1:
            CellIdentifier = @"EditProfileCell2";

            break;
        case 2:
            CellIdentifier = @"EditProfileCell3";

            break;
        case 3:
            CellIdentifier = @"EditProfileCell4";

            break;
        case 4:
            CellIdentifier = @"EditProfileCell5";

            break;
            
        default:
            break;
    }
    
    cellHeader = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    return cellHeader;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 140;
            break;
        case 1:
            return 70;
            break;
        case 2:
            return 70;
            break;
        case 3:
            return 70;
            break;
        case 4:
            return 161;
            break;
            
        default:
            return 0;
            break;
    }
}



@end

