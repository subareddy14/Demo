//
//  ViewController.h
//  PageControlDemo
//
//  Created by admin on 04/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LandingCollectionViewCell.h"
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate,MFMailComposeViewControllerDelegate,LandingCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *GradientView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIButton *JoinButton;
- (IBAction)signInTapped:(id)sender;
- (IBAction)btnJoinTapped:(id)sender;
@end

