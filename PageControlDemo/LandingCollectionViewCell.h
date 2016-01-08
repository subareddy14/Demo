//
//  LandingCollectionViewCell.h
//  PageControlDemo
//
//  Created by admin on 04/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LandingCollectionViewCellDelegate;

@interface LandingCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *swipetopreview;
@property (weak, nonatomic) IBOutlet UIButton *btnReadConset;

@property (weak, nonatomic) IBOutlet UIButton *btnEmailCOnset;
- (IBAction)btnreadConsenttapped:(id)sender;
- (IBAction)btnEmailConsentTapped:(id)sender;

@property(nonatomic,retain) id<LandingCollectionViewCellDelegate>delegate;





@end


@protocol LandingCollectionViewCellDelegate <NSObject>

- (void)studyLandingCollectionViewCellReadConsent:(LandingCollectionViewCell *)cell;

- (void)studyLandingCollectionViewCellEmailConsent:(LandingCollectionViewCell *)cell;

@end
