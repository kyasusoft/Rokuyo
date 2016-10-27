//
//  ViewController.h
//  rokuyo
//
//  Created by kyasu on 2016/10/27.
//  Copyright © 2016年 kyasu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *year;
@property (weak, nonatomic) IBOutlet UITextField *month;
@property (weak, nonatomic) IBOutlet UITextField *day;
@property (weak, nonatomic) IBOutlet UILabel *kyuMonth;
@property (weak, nonatomic) IBOutlet UILabel *kyuDay;
@property (weak, nonatomic) IBOutlet UILabel *rokuyo;

- (IBAction)change:(id)sender;

@end

