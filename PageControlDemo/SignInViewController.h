//
//  SignInViewController.h
//  PageControlDemo
//
//  Created by admin on 04/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UITableViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnForgetPassword;

- (void) signIn;

- (IBAction)btnForgetTapped:(id)sender;

@end
