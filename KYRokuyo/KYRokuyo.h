//
//  KYRokuyo.h
//  KYRokuyo
//
//  Created by kyasu on 08/02/14.
//
//  Copyright (c) 2008 Keietsu Yasuhara
//  License: MIT
//

#import <UIKit/UIKit.h>

@interface KYRokuyo : NSObject {
}

@property (assign, nonatomic) int kyuMonth;	// inMonthに対応する旧暦の月
@property (assign, nonatomic) int kyuDay;	// inDayに対応する旧暦の日

- (id)init;
- (NSString *)sinrekiToRokuyoWithYear:(int)inYear month:(int)inMonth day:(int)inDay;

@end
