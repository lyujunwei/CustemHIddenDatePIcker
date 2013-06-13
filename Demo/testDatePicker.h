//
//  testDatePicker.h
//  Demo
//
//  Created by zucknet on 13/6/9.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testDatePicker : UIView

@property(nonatomic,strong)IBOutlet UIBarButtonItem *dateBtn;
@property(nonatomic,strong)IBOutlet UIDatePicker *datePicker;

-(IBAction)backBtn:(id)sender;

@end
