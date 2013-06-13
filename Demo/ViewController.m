//
//  ViewController.m
//  Demo
//
//  Created by zucknet on 13/6/9.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import "ViewController.h"
#import "testDatePicker.h"
#import "selectCity.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize testDate,city;
@synthesize lab;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    [self _initDatePicker];

    [self _initSelectCity];
    
    self.cityLab.text = @"";
    
    self.lab.text = @"";
    
}

#pragma mark - about DatePicker

-(void)_initDatePicker{
    testDate = [[[NSBundle mainBundle]loadNibNamed:@"testDatePicker" owner:self options:nil]lastObject];
    testDate.frame = CGRectMake(0, 586, 320, 260);
    testDate.datePicker.tag = 100;
    testDate.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*365*10];
    testDate.datePicker.maximumDate = [NSDate date];
    testDate.datePicker.date = [NSDate dateWithTimeIntervalSinceNow:-60*60*24];
    testDate.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:testDate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hiddenDatePicker)
                                                 name:@"pushSGMenu"
                                               object:nil];
}

-(IBAction)datePicker:(id)sender{

    [UIView beginAnimations:nil context:@"datePicker"];
    [UIView setAnimationDuration:0.34];
    
    if (IS_IPHONE_5) {
        testDate.frame = CGRectMake(0, 586-263-20-20+2+3, 320, 260);
    } else {
        testDate.frame = CGRectMake(0, 586-263-20-20+2+3-88, 320, 260);
    }
    [UIView commitAnimations];
    
}

-(void)hiddenDatePicker {
    [UIView beginAnimations:nil context:@"datePicker"];
    [UIView setAnimationDuration:0.34];
    if (IS_IPHONE_5) {
        testDate.frame = CGRectMake(0, 586, 320, 260);
    } else {
        testDate.frame = CGRectMake(0, 586-88, 320, 260);
    }
    [UIView commitAnimations];
    
    UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:100];
    NSDate *date = datePicker.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    self.lab.text = dateString;
    
}

#pragma mark - about selectCity

-(void)_initSelectCity{
   city  = [[[NSBundle mainBundle]loadNibNamed:@"selectCity" owner:self options:nil]lastObject];
    city.frame = CGRectMake(0, 568, 320, 260);
    city.tag = 101;
    [self.view addSubview:city];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hiddenPickerView)
                                                 name:@"pickerView"
                                               object:nil];
}



-(IBAction)selectCity:(id)sender{

    [UIView beginAnimations:nil context:@"cityPicker"];
    [UIView setAnimationDuration:0.34];
    
    if (IS_IPHONE_5) {
        city.frame = CGRectMake(0, 586-263-20-20+2+3, 320, 260);
    } else {
        city.frame = CGRectMake(0, 586-263-20-20+2+3-88, 320, 260);
    }
    [UIView commitAnimations];

}

-(void)hiddenPickerView{
        
    [UIView beginAnimations:nil context:@"cityPicker"];
    [UIView setAnimationDuration:0.34];
    if (IS_IPHONE_5) {
        city.frame = CGRectMake(0, 586, 320, 260);
    } else {
        city.frame = CGRectMake(0, 586-88, 320, 260);
    }
    [UIView commitAnimations];
    
    self.cityLab.text = [NSString stringWithFormat:@"%@,%@",city.testState,city.testCity];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
