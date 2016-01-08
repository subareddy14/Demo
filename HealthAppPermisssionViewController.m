//
//  HealthAppPermisssionViewController.m
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "HealthAppPermisssionViewController.h"

@interface HealthAppPermisssionViewController ()

@end

@implementation HealthAppPermisssionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton=YES;
    
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                   target:self
                                                                                   action:@selector(back)];
    [self.navigationItem setLeftBarButtonItem:backBarButton];
}

- (void)back {
    //[[self onboarding] popScene];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
