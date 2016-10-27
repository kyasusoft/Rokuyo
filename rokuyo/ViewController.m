//
//  ViewController.m
//  rokuyo
//
//  Created by kyasu on 2016/10/27.
//  Copyright © 2016年 kyasu. All rights reserved.
//

#import "ViewController.h"
#import "rokuyo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)change:(id)sender {
    
    int year  = self.year.text.intValue;
    int month = self.month.text.intValue;
    int day   = self.day.text.intValue;
    
    rokuyo *r = [[rokuyo alloc] init];
    
    NSString *rokuyo = [r sinrekiToRokuyoWithYear:year
                                            month:month
                                              day:day];
    int kyuMonth = r.kyuMonth;
    int kyuDay   = r.kyuDay;
    
    self.kyuMonth.text = [NSString stringWithFormat:@"%d", kyuMonth];
    self.kyuDay.text   = [NSString stringWithFormat:@"%d", kyuDay];
    self.rokuyo.text   = rokuyo;
    
}

@end
