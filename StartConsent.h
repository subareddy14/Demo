//
//  StartConsent.h
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StartConsent : NSObject


@property (nonatomic, strong) NSString *summary;

@property (nonatomic, strong) NSString *htmlContent;

@property (nonatomic, strong) NSString *content;

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;





@end
