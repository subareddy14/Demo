//
//  StartConsent.m
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "StartConsent.h"

@implementation StartConsent

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    
    if(self = [self init]) {
                
        _summary = [jsonDictionary objectForKey:@"summary"];
        
        _htmlContent = [jsonDictionary objectForKey:@"htmlContent"];
        
        _content = [jsonDictionary objectForKey:@"content"];
        
       
        
    }
    
    return self;
    
    
}

@end
