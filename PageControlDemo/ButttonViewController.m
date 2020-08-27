//
//  ButttonViewController.m
//  PageControlDemo it is for testing
//
//  Created by admin on 06/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ButttonViewController.h"
#import "testViewController.h"

@interface ButttonViewController ()

@end

@implementation ButttonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_btnimg addTarget:self action:@selector(slideAction:) forControlEvents:UIControlEventTouchUpInside];
    [_btnSecond addTarget:self action:@selector(slideAction1:) forControlEvents:UIControlEventTouchUpInside];
   
    [self becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void) slideAction:(UIButton *)sender
{
    for (UIView* subView in self.view.subviews)
    {
        NSLog(@"object class : %@", [subView class]);
        
        if ([subView isMemberOfClass:[UIButton class]])
        {
            [subView setBackgroundColor:[UIColor greenColor]];
            [sender setBackgroundColor:[UIColor blackColor]];
        }
        NSLog(@"Button found!");
    }
    
    UIStoryboard *storyBorad=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    testViewController *testControler=[storyBorad instantiateViewControllerWithIdentifier:@"test"];
    [self.navigationController pushViewController:testControler animated:YES];
    
   // [_btnimg setBackgroundColor:[UIColor redColor]];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"alert" message:@"Aoppp in backGroune" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

-(void) slideAction1:(UIButton *)sender
{
  
    [self methodtoSolve:sender];
//    for (UIView* subView in self.view.subviews)
//    {
//        NSLog(@"object class : %@", [subView class]);
//        
//        if ([subView isMemberOfClass:[UIButton class]])
//        {
//            [subView setBackgroundColor:[UIColor greenColor]];
//            [sender setBackgroundColor:[UIColor blackColor]];
//        }
//        NSLog(@"Button found!");
//    }
    
    // [_btnimg setBackgroundColor:[UIColor redColor]];
}

-(void)methodtoSolve :(UIButton*)x
{
    for (UIView* subView in self.view.subviews)
    {
        NSLog(@"object class : %@", [subView class]);
        
        if ([subView isMemberOfClass:[UIButton class]])
        {
            [subView setBackgroundColor:[UIColor greenColor]];
            [x setBackgroundColor:[UIColor blackColor]];
        }
        NSLog(@"Button found!");
    }


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

@end
