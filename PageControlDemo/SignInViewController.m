//
//  SignInViewController.m
//  PageControlDemo
//
//  Created by admin on 04/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

- (void)setupAppearance
{
    [self.txtEmail setTextColor:[UIColor redColor]];
    [self.txtEmail setFont:[UIFont fontWithName:@"Arial" size:17.0f]];
    [self.txtEmail setTintColor:[UIColor blackColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



- (IBAction)btnForgetTapped:(id)sender {
}
@end
