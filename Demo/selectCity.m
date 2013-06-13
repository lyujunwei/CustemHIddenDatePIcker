//
//  selectCity.m
//  Demo
//
//  Created by zucknet on 13/6/10.
//  Copyright (c) 2013年 zucknet. All rights reserved.
//

#import "selectCity.h"
#import "Model.h"

@implementation selectCity
@synthesize cityBtn,cityPicker;
@synthesize data;

-(IBAction)hiddenPIcker:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pickerView"object:nil];
}

- (void)drawRect:(CGRect)rect
{
    NSBundle *bundle = [NSBundle mainBundle];
    //    NSString *path = [[bundle resourcePath] stringByAppendingPathComponent:@"city.plist"];
    NSString *path = [bundle pathForResource:@"city" ofType:@"plist"];
    data = [[NSArray alloc] initWithContentsOfFile:path];
}

#pragma mark - UIPickerView delegate
//返回有列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

//返回每一列中的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        NSBundle *bundle = [NSBundle mainBundle];
        //    NSString *path = [[bundle resourcePath] stringByAppendingPathComponent:@"city.plist"];
        NSString *path = [bundle pathForResource:@"city" ofType:@"plist"];
        data = [[NSArray alloc] initWithContentsOfFile:path];
        return data.count;
    }
    
    //返回第一列选择的行的索引
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    //取得省级字典
    NSDictionary *items = [data objectAtIndex:selectedRow];
    //取得该省下所有的市
    NSArray *cities = [items objectForKey:@"cities"];
    return cities.count;
}

//返回没个item中的title
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    if (component == 0) {
        NSDictionary *dic = [data objectAtIndex:row];
        NSString *state = [dic objectForKey:@"state"];
        return state;
    }
    
    //返回第一列选择的行的索引
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    //取得省级字典
    NSDictionary *items = [data objectAtIndex:selectedRow];
    //取得该省下所有的市
    NSArray *cities = [items objectForKey:@"cities"];
    NSString *cityName = [cities objectAtIndex:row];
    return cityName;
}

//设置列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 100;
    }
    return 220;
}


//选择行的事件
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    if (component == 0) {
        //刷新指定列中的行
        [pickerView reloadComponent:1];
        //选择指定的item
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    self.testCity =  [[[data objectAtIndex:[pickerView selectedRowInComponent:0]] objectForKey:@"cities"] objectAtIndex:[pickerView selectedRowInComponent:1]];
    
    self.testState = [[data objectAtIndex:[pickerView selectedRowInComponent:0]] objectForKey:@"state"];
    
    
    
}

@end
