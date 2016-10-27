//
//  rokuyo.h
//  rokuyo
//
//  Created by kyasu on 08/02/14.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rokuyo : NSObject {
}

@property (assign, nonatomic) int kyuMonth;	// inMonthに対応する旧暦の月
@property (assign, nonatomic) int kyuDay;	// inDayに対応する旧暦の日

- (id)init;
- (NSString *)sinrekiToRokuyoWithYear:(int)inYear month:(int)inMonth day:(int)inDay;

@end
