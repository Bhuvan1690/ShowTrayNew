//
//  ViewController1.m
//  SWTabBar
//
//  Created by Patrick BODET on 24/03/2016.
//  Copyright © 2016 Patrick BODET. All rights reserved.
//

#import "SWRevealViewController.h"
#import "ViewController1.h"

@interface ViewController1 ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButton;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.revealButton setTarget: self.revealViewController];
        [self.revealButton setAction: @selector(revealToggle:)];
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

@end
