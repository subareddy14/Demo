//
//  EligibleViewController.m
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "EligibleViewController.h"
#import "StartConsent.h"
#import <ResearchKit/ResearchKit.h>
#import "HealthAppPermisssionViewController.h"
#define kConsentSectionFileNameKey    @"ConsentSectionFileNameKey";
@interface EligibleViewController ()<ORKTaskViewControllerDelegate>
@property (strong, nonatomic) ORKTaskViewController *consentVC;
@property(strong,nonatomic) NSMutableArray * consentData;


@end

@implementation EligibleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    _consentData=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



-(void)showConsent{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Consent"  ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *array = [jsonDictionary objectForKey:@"office"];
    for(NSDictionary *dict in array) {
        
        StartConsent *consent = [[StartConsent alloc] initWithJSONDictionary:dict];
        [self.consentData addObject:consent];
    }
}

- (IBAction)startConsentTapped:(id)sender {
    
  
    [self showConsent];
    [self setupConsent];

}



-(void)setupConsent{
    
    
    ORKConsentSharingStep *sharingStep =
        [[ORKConsentSharingStep alloc] initWithIdentifier:@"consent_sharing"
                             investigatorShortDescription:@"MyInstitution"
                              investigatorLongDescription:@"MyInstitution and its partners"
                            localizedLearnMoreHTMLContent:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."];
        
    
    
    ORKConsentDocument *consentDocument = [self createConsentDocument];
    
    ORKVisualConsentStep *consentStep = [[ORKVisualConsentStep alloc] initWithIdentifier:@"VisualConsent" document:consentDocument];
    
    ORKConsentReviewStep *reviewConsentStep = [[ORKConsentReviewStep alloc] initWithIdentifier:@"ConsentReviewStep" signature:[[consentDocument signatures] firstObject] inDocument:consentDocument];
    
    reviewConsentStep.text = @"Please enter the name of the person consenting to this study.";
    
    
    
    NSArray *consentStepList = @[consentStep, reviewConsentStep];
    
    ORKOrderedTask *orderedTask = [[ORKOrderedTask alloc] initWithIdentifier:@"ConsentTaskId" steps:consentStepList];
    
    ORKTaskViewController *taskviewController = [[ORKTaskViewController alloc] initWithTask:orderedTask taskRunUUID:[NSUUID UUID]];
    
    taskviewController.delegate = self;
    
    [self presentViewController:taskviewController animated:true completion:nil];
    
}



-(ORKConsentDocument*)createConsentDocument {
    
    ORKConsentDocument *consentDocument = [[ORKConsentDocument alloc] init];
    
    consentDocument.title = @"PHAware Consent";
    
    consentDocument.signaturePageTitle = @"Consent";
    
    consentDocument.signaturePageContent = @"I agree to participate in this research Study.";
    
    
    
    ORKConsentSignature *consentSignature = [ORKConsentSignature signatureForPersonWithTitle:@"Consent User" dateFormatString:nil identifier:@"ConsentUserSignature"];
    
    [consentDocument addSignature:consentSignature];
    
    
    
    NSArray *consentScenes = @[[NSNumber numberWithInt:ORKConsentSectionTypeOverview],[NSNumber numberWithInt:ORKConsentSectionTypeDataGathering],[NSNumber numberWithInt:ORKConsentSectionTypePrivacy],[NSNumber numberWithInt:ORKConsentSectionTypeDataUse],[NSNumber numberWithInt:ORKConsentSectionTypeTimeCommitment], [NSNumber numberWithInt:ORKConsentSectionTypeStudySurvey],[NSNumber numberWithInt:ORKConsentSectionTypeStudyTasks],[NSNumber numberWithInt:ORKConsentSectionTypeWithdrawing]];
    
   
    
    
    NSMutableArray *consentSectionArray = [NSMutableArray array];
    
    
    
    for (NSNumber *sceneNo in consentScenes) {
        
        
        
        StartConsent *consent=[self.consentData objectAtIndex:sceneNo.integerValue];
        
        ORKConsentSection *consentSection = [[ORKConsentSection alloc] initWithType:sceneNo.integerValue];
        
        consentSection.summary = consent.summary;
        
        
        
        if (sceneNo.integerValue == ORKConsentSectionTypeOverview) {
            
            
            
            consentSection.htmlContent =consent.htmlContent;
            
        }
        
        else {
            
            consentSection.content =consent.content;
            
        }
        
        [consentSectionArray addObject:consentSection];
        
    }
    
    consentDocument.sections = consentSectionArray;
    
    return consentDocument;
    
}


-(void)taskViewController:(ORKTaskViewController *)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(NSError *)error {
    
    switch (reason) {
            
        case ORKTaskViewControllerFinishReasonCompleted:
            
            [self taskViewControllerDidComplete:taskViewController];
            
            [taskViewController dismissViewControllerAnimated:true completion:nil];
            
            
            
            //healthKitStatus=YES;
            
            break;
            
        case ORKTaskViewControllerFinishReasonDiscarded:
            
            [taskViewController dismissViewControllerAnimated:true completion:nil];
            
            break;
            
        case ORKTaskViewControllerFinishReasonFailed:
            
            [taskViewController dismissViewControllerAnimated:true completion:nil];
            
            break;
            
        default:
            
            break;
            
    }
    
    
    
//    if (reason == ORKTaskViewControllerFinishReasonCompleted) {
//        ORKConsentSignatureResult *consentResult =  nil;
//        
//       
//            NSString *signatureResultStepIdentifier = @"reviewStep";
//            
//            for (ORKStepResult* result in taskViewController.result.results) {
//                NSLog(@"Id: %@", result.identifier);
//                if ([result.identifier isEqualToString:signatureResultStepIdentifier]) {
//                    consentResult = (ORKConsentSignatureResult*)[[result results] firstObject];
//                    break;
//                }
//            }
//        
//
//    
//}
}

- (void)taskViewControllerDidComplete:(ORKTaskViewController *)taskViewController {
    
    
    
    // obtain signature
    
    NSArray *steps = [(ORKOrderedTask *)taskViewController.task steps];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"self isKindOfClass: %@", [ORKConsentReviewStep class]];
    
    ORKStep *reviewStep = [[steps filteredArrayUsingPredicate:predicate] firstObject];
    
    ORKConsentSignatureResult *signatureResult = (ORKConsentSignatureResult *)[[[taskViewController result] stepResultForStepIdentifier:reviewStep.identifier] firstResult];
    
    
    
    NSData *data=UIImagePNGRepresentation(signatureResult.signature.signatureImage);
    
    NSArray  *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *docir = [documents objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *folderPath  = [docir stringByAppendingPathComponent:@"Consent"];
    
    if(![fileManager fileExistsAtPath:folderPath]){
        
        [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    
    NSString *outputPath = [folderPath stringByAppendingPathComponent:@"signature.png"];
    
    [data writeToFile:outputPath atomically:YES];
    
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HealthAppPermisssionViewController *permissionViewController=[storyBoard instantiateViewControllerWithIdentifier:@"PermissionHelath"];
    
    [self.navigationController pushViewController:permissionViewController animated:YES];
    
    
    
    //_signaturefname=signatureResult.signature.givenName;
    
   // _signaturelname=signatureResult.signature.familyName;
    
   // [self sendConsentSignature];
    
    //[self showActivityIndicator];
    
}



@end
