//
//  InclusiveTableViewController.m
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "InclusiveTableViewController.h"
#import "Segmentbutton.h"
#import "EligibleViewController.h"
#import "InEligibleViewController.h"

@interface InclusiveTableViewController ()<SegmentbuttonDelegate>
{
    BOOL eligible;
}

@end

@implementation InclusiveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questions = @[
                       [[Segmentbutton alloc] initWithButtons:@[self.question1Option1, self.question1Option2] normalColor:[UIColor blackColor] highlightColor:[UIColor redColor]],
                       [[Segmentbutton alloc] initWithButtons:@[self.question2Option1, self.question2Option2] normalColor:[UIColor blackColor] highlightColor:[UIColor redColor]],
                       [[Segmentbutton alloc] initWithButtons:@[self.question3Option1, self.question3Option2] normalColor:[UIColor blackColor] highlightColor:[UIColor redColor]],
                       [[Segmentbutton alloc] initWithButtons:@[self.question4Option1, self.question4Option2] normalColor:[UIColor blackColor] highlightColor:[UIColor redColor]],
                       ];
    [self.questions enumerateObjectsUsingBlock:^(Segmentbutton * obj, NSUInteger __unused idx, BOOL * __unused stop) {
        obj.delegate = self;
    }];
    
    
      self.navigationItem.rightBarButtonItem.enabled = NO;
    
     [self.navigationController setNavigationBarHidden:NO animated:YES];
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated
{
    self.title = NSLocalizedString(@"Eligibility", @"");
    
    UIBarButtonItem *nextBarButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Next", @"") style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    nextBarButton.enabled = [self isContentValid];
    self.navigationItem.rightBarButtonItem = nextBarButton;
    
   }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)segmentedButtonPressed:(UIButton *) __unused button selectedIndex:(NSInteger) __unused selectedIndex
{
    self.navigationItem.rightBarButtonItem.enabled = [self isContentValid];
    
}


- (void)next
{
    eligible = [self isEligible];
    
    if (eligible) {
        
        UIStoryboard * storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        EligibleViewController *eligibleViewController=[storyBoard instantiateViewControllerWithIdentifier:@"Eligible"];
       [self.navigationController pushViewController:eligibleViewController animated:YES];
        
    }
    
    else
    {
        
        UIStoryboard * storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        InEligibleViewController *inEligibleViewController=[storyBoard instantiateViewControllerWithIdentifier:@"InEligible"];
        [self.navigationController pushViewController:inEligibleViewController animated:YES];

    
    }
    
}

- (BOOL) isEligible
{
    BOOL retValue = YES;
    
    Segmentbutton * question1 = self.questions[0];
    Segmentbutton * question2 = self.questions[1];
    Segmentbutton * question3 = self.questions[2];
    Segmentbutton * question4 = self.questions[3];
    
    if ((question1.selectedIndex == 1) ||
        (question2.selectedIndex == 1) ||
        (question3.selectedIndex == 1) ||
        (question4.selectedIndex == 1)) {
        retValue = NO;
    }
    return retValue;
}

- (BOOL)isContentValid
{
    __block BOOL retValue = YES;
    [self.questions enumerateObjectsUsingBlock:^(Segmentbutton* obj, NSUInteger __unused idx, BOOL *stop) {
        if (obj.selectedIndex == -1) {
            retValue = NO;
            *stop = YES;
        }
    }];
    return retValue;
}





@end
