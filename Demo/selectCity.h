//
//  selectCity.h
//  Demo
//
//  Created by zucknet on 13/6/10.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectCity : UIView<UIPickerViewDelegate,UIPickerViewDataSource>{

}
@property(nonatomic,strong)IBOutlet UIBarButtonItem *cityBtn;
@property(nonatomic,strong)IBOutlet  UIPickerView *cityPicker;
@property(nonatomic,strong)NSArray *data;
@property(nonatomic,strong)NSString *testCity;
@property(nonatomic,strong)NSString *testState;

-(IBAction)hiddenPIcker:(id)sender;

- (id)initWithFrame:(CGRect)frame;

@end
