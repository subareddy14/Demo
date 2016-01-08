//
//  LandingCollectionViewCell.m
//  PageControlDemo
//
//  Created by admin on 04/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "LandingCollectionViewCell.h"
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>

@implementation LandingCollectionViewCell

NSString *const kAPCStudyLandingCollectionViewCellIdentifier = @"LandingCollectionViewCell";

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupAppearance];
}

- (void)setupAppearance
{
    //self.logoImageView.image = [UIImage imageNamed:@"logo_disease_large"];
    
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont fontWithName:@"Arial" size:36.f];
    [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    self.titleLabel.minimumScaleFactor = 0.8;
    
    self.subTitleLabel.textColor = [UIColor blackColor];
    self.subTitleLabel.font = [UIFont fontWithName:@"Arial" size:17.f];
    
    self.swipetopreview.textColor = [UIColor blackColor];
    self.swipetopreview.font = [UIFont fontWithName:@"Arial" size:15.f];
    
    [self.btnEmailCOnset setTitle:NSLocalizedString(@"Email Consent Document", @"Email Consent Document") forState:UIControlStateNormal];
    
    [self.btnReadConset setTitle:NSLocalizedString(@"Read Consent Document", @"Read Consent Document") forState:UIControlStateNormal];
    [self.btnReadConset setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}


- (IBAction)btnreadConsenttapped:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(studyLandingCollectionViewCellReadConsent:)]) {
        [self.delegate studyLandingCollectionViewCellReadConsent:self];
    }
}

- (IBAction)btnEmailConsentTapped:(id)sender {
    if ([self.delegate respondsToSelector:@selector(studyLandingCollectionViewCellEmailConsent:)]) {
        [self.delegate studyLandingCollectionViewCellEmailConsent:self];
    }
    
}
@end
