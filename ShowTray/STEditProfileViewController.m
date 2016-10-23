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
    return 6;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row ==0) {
        static NSString *CellIdentifierHeader = @"ProfileHeaderCell";
        STProfileHeaderCell *cellHeader = [tableView dequeueReusableCellWithIdentifier: CellIdentifierHeader forIndexPath: indexPath];
        return cellHeader;
        
    }
    else{
        static NSString *CellIdentifierItem = @"ProfileItemsCell";
        STProfileItemsCell *cellItem = [tableView dequeueReusableCellWithIdentifier: CellIdentifierItem forIndexPath: indexPath];
        cellItem.viewContainer.layer.cornerRadius = 10;
        return cellItem;
        
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return 201;
    }
    else{
        return 75;
    }
}



@end

