//
//  testDatePicker.m
//  Demo
//
//  Created by zucknet on 13/6/9.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import "testDatePicker.h"
#import "ViewController.h"

@implementation testDatePicker
@synthesize datePicker,dateBtn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(IBAction)backBtn:(id)sender{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushSGMenu"object:nil];
}

@end
