//
//  InclusiveTableViewController.h
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InclusiveTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *question1Label;
@property (weak, nonatomic) IBOutlet UIButton *question1Option1;
@property (weak, nonatomic) IBOutlet UIButton *question1Option2;

@property (weak, nonatomic) IBOutlet UILabel *question2Label;
@property (weak, nonatomic) IBOutlet UIButton *question2Option1;
@property (weak, nonatomic) IBOutlet UIButton *question2Option2;

@property (weak, nonatomic) IBOutlet UILabel *question3Label;
@property (weak, nonatomic) IBOutlet UIButton *question3Option1;
@property (weak, nonatomic) IBOutlet UIButton *question3Option2;

@property (weak, nonatomic) IBOutlet UILabel *question4Label;
@property (weak, nonatomic) IBOutlet UIButton *question4Option1;
@property (weak, nonatomic) IBOutlet UIButton *question4Option2;
@property (nonatomic, strong) NSArray * questions;
@end
