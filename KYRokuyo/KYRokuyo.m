//
//  KYRokuyo.m
//  KYRokuyo
//
//  Created by kyasu on 08/02/14.
//
//  Copyright (c) 2008 Keietsu Yasuhara
//  License: MIT
//

#import "KYRokuyo.h"

@interface KYRokuyo() {
    int _minYear;
    int _maxYear;
}

@property (strong, nonatomic) NSArray *allArray;
@property (strong, nonatomic) NSArray *rokuyoArray;

@end

@implementation KYRokuyo

- (id)init
{
    self = [super init];
    if(self) {
        // plist読み込み
        NSString *fileStr = [[NSBundle bundleForClass:[self class]] pathForResource:@"kyureki" ofType:@"plist"];
        self.allArray = [[NSArray alloc] initWithContentsOfFile:fileStr];
        
        if (_allArray == nil) {
            return nil;
        }
        
        _minYear = ((NSString *)_allArray[0][@"#year"]).intValue;
        _maxYear = ((NSString *)_allArray[_allArray.count - 1][@"#year"]).intValue;
        self.rokuyoArray = @[@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅"];
    }
    return self;
}

// 年月日から旧暦を求め、六曜を返す
// http://www.ajnet.ne.jp/diary/
- (NSString *)sinrekiToRokuyoWithYear:(int)inYear month:(int)inMonth day:(int)inDay
{
    int kyuMonth1;	// inMonthの一日の旧暦の月				plist:MMddccmmdd
    int kyuDay1;	// inMonthの一日の旧暦の日				plist:mmDDccmmdd
    int changeDay;	// inMonthの中で旧暦が次の月に変わる日	plist:mmddCCmmdd
    int kyuMonth2;	// inMonthの中で旧暦の次の月			plist:mmddccMMdd
    int	kyuDay2;	// inMonthの中で旧暦の次の一日			plist:mmddccmmDD
    int changeDay2; // inMonthの中で旧暦が次の月に変わる日	plist:mmddccmmddCCmmdd
    int kyuMonth3;  // inMonthの中で旧暦が次の月に変わる日	plist:mmddccmmddccMMdd
    int kyuDay3;    // inMonthの中で旧暦が次の月に変わる日	plist:mmddccmmddccmmDD
    
    //対象年以外は、nilを返す
    if (inYear < _minYear || _maxYear < inYear) {
        return nil;
    }
    
    NSString *kyuData = _allArray[inYear - _minYear][[NSString stringWithFormat:@"%02d", inMonth]];
                                                       
    kyuMonth1 = [kyuData substringWithRange:NSMakeRange(0, 2)].intValue;
    kyuDay1   = [kyuData substringWithRange:NSMakeRange(2, 2)].intValue;
    changeDay = [kyuData substringWithRange:NSMakeRange(4, 2)].intValue;
    kyuMonth2 = [kyuData substringWithRange:NSMakeRange(6, 2)].intValue;
    kyuDay2   = [kyuData substringWithRange:NSMakeRange(8, 2)].intValue;

    // 1ヶ月内に2回旧暦が変わる
    if (kyuData.length == 16) {
        changeDay2 = [kyuData substringWithRange:NSMakeRange(10, 2)].intValue;
        kyuMonth3 = [kyuData substringWithRange:NSMakeRange(12, 2)].intValue;
        kyuDay3 = [kyuData substringWithRange:NSMakeRange(14, 2)].intValue;
    } else {
        changeDay2 = 32;
        kyuMonth3 = 0;
        kyuDay3 = 0;
    }
    
    if ( inDay < changeDay ) {
        // 月の初めから数える
        _kyuMonth = kyuMonth1;
        _kyuDay   = kyuDay1 + (inDay - 1);
    } else if (changeDay <= inDay && inDay < changeDay2) {
        // 月の途中から数える
        _kyuMonth = kyuMonth2;
        _kyuDay   = kyuDay2 + (inDay - changeDay);
    } else if (changeDay2 <= inDay) {
        // 月の途中から数える
        _kyuMonth = kyuMonth3;
        _kyuDay   = kyuDay3 + (inDay - changeDay2);
    }
    
    // 六曜を求める
    int roku = (_kyuMonth + _kyuDay) % 6;
    NSString *retStr = (NSString *)_rokuyoArray[roku];
    
    return retStr;
}

@end
