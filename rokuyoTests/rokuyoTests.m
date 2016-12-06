//
//  rokuyoTests.m
//  rokuyoTests
//
//  Created by tototti on 2016/12/06.
//  Copyright © 2016年 tototti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KYRokuyo.h"

@interface rokuyoTests : XCTestCase

@end

@implementation rokuyoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/// 2000_07 = 月に二回旧暦が変わる
- (void)test2000_07 {

    NSArray* rokuyoArray = @[@"仏滅",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"先勝"];
    
    KYRokuyo* rokuyo = [[KYRokuyo alloc] init];
    for (int i = 0; i < 31; i++) {
        XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2000 month:7 day:i+1], rokuyoArray[i]);
    }
}

/// 2005_12 月に二回旧暦が変わる
- (void)test2005_12 {
    NSArray* rokuyoArray = @[@"先負",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"赤口"];

    KYRokuyo* rokuyo = [[KYRokuyo alloc] init];
    for (int i = 0; i < 31; i++) {
        XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2005 month:12 day:i+1], rokuyoArray[i]);
    }
}

/// 2016_12 ノーマルな月のテスト
- (void)test2016_12 {
    NSArray* rokuyoArray = @[@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"大安",@"赤口",@"先勝",@"友引",@"先負",@"仏滅",@"赤口",@"先勝",@"友引"];
    
    KYRokuyo* rokuyo = [[KYRokuyo alloc] init];
    for (int i = 0; i < 31; i++) {
        XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2016 month:12 day:i+1], rokuyoArray[i]);
    }
}

/// 範囲外のテスト(下限)
- (void)test1999_12 {
    KYRokuyo* rokuyo = [[KYRokuyo alloc] init];
    XCTAssertNil([rokuyo sinrekiToRokuyoWithYear:1999 month:12 day:31]);
}


/// 範囲外のテスト
- (void)test2033_01 {
    KYRokuyo* rokuyo = [[KYRokuyo alloc] init];
    XCTAssertNil([rokuyo sinrekiToRokuyoWithYear:2033 month:1 day:1]);
}

@end
