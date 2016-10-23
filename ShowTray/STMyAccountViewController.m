//
//  STMyAccountViewController.m
//  ShowTray
//
//  Created by Ashwani on 22/10/16.
//  Copyright © 2016 Ashwani. All rights reserved.
//

#import "STMyAccountViewController.h"

@interface STMyAccountViewController ()

@end

@implementation STMyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
       // [_revealButton setTarget: self.revealViewController];
       // [_revealButton setAction: @selector(revealToggle:)];
        
        [_revealButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row ==0) {
        static NSString *CellIdentifierHeader = @"ProfileHeaderCell";
        STProfileHeaderCell *cellHeader = [tableView dequeueReusableCellWithIdentifier: CellIdentifierHeader forIndexPath: indexPath];
        
        [cellHeader.btnEdit addTarget:self action:@selector(btnEditProfile:) forControlEvents:UIControlEventTouchUpInside];
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


# pragma mark Actions

-(void)btnEditProfile:(UIButton*)sender
{
    STEditProfileViewController *controller = (STEditProfileViewController*)[STUFF_STORYBOARD instantiateViewControllerWithIdentifier: @"EditProfile"];
    [self.navigationController pushViewController:controller animated:YES];
}



@end
