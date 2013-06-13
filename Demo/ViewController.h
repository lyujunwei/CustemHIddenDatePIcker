//
//  ViewController.h
//  Demo
//
//  Created by zucknet on 13/6/9.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "testDatePicker.h"
#import "selectCity.h"

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>  {
    NSArray *data;
}

@property(nonatomic,strong)IBOutlet UIButton *btn1;
@property(nonatomic,strong)IBOutlet UIButton *btn2;
@property(nonatomic,strong)testDatePicker *testDate;
@property(nonatomic,strong)IBOutlet UILabel *lab;
@property(nonatomic,strong)IBOutlet UILabel *cityLab;
@property(nonatomic,strong)selectCity *city;

-(IBAction)datePicker:(id)sender;
-(IBAction)selectCity:(id)sender;

-(void)hiddenDatePicker;

@end
