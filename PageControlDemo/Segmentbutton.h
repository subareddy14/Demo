//
//  Segmentbutton.h
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SegmentbuttonDelegate <NSObject>

@required
- (void) segmentedButtonPressed:(UIButton*) button selectedIndex: (NSInteger) selectedIndex;
@end

@interface Segmentbutton : NSObject


@property (nonatomic, weak) id<SegmentbuttonDelegate> delegate;
@property (nonatomic) NSInteger selectedIndex;

- (instancetype)initWithButtons:(NSArray *)buttons normalColor: (UIColor*) normalColor highlightColor: (UIColor*) highlightColor;
@end
