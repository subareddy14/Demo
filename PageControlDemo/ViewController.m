//
//  ViewController.m
//  PageControlDemo
//
//  Created by admin on 04/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ViewController.h"
#import "SignInViewController.h"
#import "LandingCollectionViewCell.h"
#import "InclusiveTableViewController.h"
#import <ResearchKit/ResearchKit.h>


@interface ViewController ()<ORKTaskViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView reloadData];

   }

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    
    



}

- (NSInteger) numberOfSectionsInCollectionView: (UICollectionView *) __unused collectionView
{
    return 1;
}

-(NSInteger) collectionView: (UICollectionView *) __unused collectionView
     numberOfItemsInSection: (NSInteger) __unused section
{
    return 3;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
NSString * LandingCollectionViewCellIdentifier = @"LandingCollectionViewCell";
    UICollectionViewCell *cell;
    //APCTableViewStudyDetailsItem *studyDetails = [self itemForIndexPath:indexPath];
    
    LandingCollectionViewCell *landingCell = (LandingCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:LandingCollectionViewCellIdentifier forIndexPath:indexPath];
    landingCell.delegate = self;
    
    if (indexPath.item == 0) {
        
        landingCell.titleLabel.text = @"Welcome to PHAware";
        landingCell.subTitleLabel.text = @"Parkinson's Disease Study";
        landingCell.btnReadConset.hidden = NO;
      
        
        if ([MFMailComposeViewController canSendMail]) {
            [landingCell.btnEmailCOnset setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [landingCell.btnEmailCOnset setUserInteractionEnabled:YES];
        } else {
            [landingCell.btnEmailCOnset setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [landingCell.btnEmailCOnset setUserInteractionEnabled:NO];
        }
        
        
        cell = landingCell;
        
    }
    
    else{
        cell = landingCell;
    }

    return cell;

}


- (void) scrollViewDidEndDecelerating: (UIScrollView *) __unused scrollView
{
    CGFloat pageWidth = self.collectionView.frame.size.width;
    self.pageControl.currentPage = (self.collectionView.contentOffset.x + pageWidth / 2) / pageWidth;
}

- (CGSize) collectionView: (UICollectionView *) __unused collectionView
                   layout: (UICollectionViewLayout*) __unused collectionViewLayout
   sizeForItemAtIndexPath: (NSIndexPath *) __unused indexPath
{
    return self.collectionView.bounds.size;
}


#pragma mark - TaskViewController Delegate methods

- (void)taskViewController:(ORKTaskViewController *)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(nullable NSError *)__unused error
{
     ORKTaskResult *taskResult = [taskViewController result];
    if (reason == ORKTaskViewControllerFinishReasonCompleted)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [taskViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInTapped:(id)sender {
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignInViewController * signInController=[storyBoard instantiateViewControllerWithIdentifier:@"SignIn"];
    [self.navigationController pushViewController:signInController animated:YES];
    
}



- (IBAction)btnJoinTapped:(id)sender {
    
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InclusiveTableViewController * inclusiveTableViewController=[storyBoard instantiateViewControllerWithIdentifier:@"Inclusive"];
    [self.navigationController pushViewController:inclusiveTableViewController animated:YES];
    

}
@end
