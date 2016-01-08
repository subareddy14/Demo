//
//  Segmentbutton.m
//  PageControlDemo
//
//  Created by admin on 05/01/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "Segmentbutton.h"

@interface Segmentbutton ()

@property (nonatomic, strong) NSArray * buttons; //Of UIButtons
@property (nonatomic, strong) UIColor * normalColor;
@property (nonatomic, strong) UIColor * highlightColor;

@end

@implementation Segmentbutton
- (instancetype)initWithButtons:(NSArray *)buttons normalColor: (UIColor*) normalColor highlightColor: (UIColor*) highlightColor
{
    self = [super init];
    if (self) {
        _buttons = buttons;
        [buttons enumerateObjectsUsingBlock: ^(UIButton* button,
                                               NSUInteger __unused idx,
                                               BOOL * __unused stop) {
            button.tintColor = normalColor;
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
        }];
        _normalColor = normalColor;
        _highlightColor = highlightColor;
        _selectedIndex = -1;
    }
    return self;
}

- (void) buttonPressed: (UIButton*) button
{
    [self.buttons enumerateObjectsUsingBlock: ^(UIButton* localButton,
                                                NSUInteger idx,
                                                BOOL * __unused stop) {
        if ([localButton isEqual:button]) {
            self.selectedIndex = idx;
            localButton.tintColor = self.highlightColor;
        }
        else
        {
            localButton.tintColor = self.normalColor;
        }
    }];
    
    if ([self.delegate respondsToSelector:@selector(segmentedButtonPressed:selectedIndex:)]) {
        [self.delegate segmentedButtonPressed:button selectedIndex:self.selectedIndex];
    }
    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    
    for (NSUInteger i=0; i<self.buttons.count; i++) {
        UIButton *button = self.buttons[i];
        if (i == (NSUInteger)selectedIndex) {
            button.tintColor = self.highlightColor;
        } else {
            button.tintColor = self.normalColor;
        }
    }
    
}


@end
