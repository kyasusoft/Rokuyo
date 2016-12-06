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

- (void)test2000_07 {

    KYRokuyo* rokuyo = [[KYRokuyo alloc] init];
    // 2000-7-2に 旧暦の月が替わる
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2000 month:7 day:1], @"仏滅");
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2000 month:7 day:2], @"赤口");
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2000 month:7 day:3], @"先勝");

    // 2000-7-31に 旧暦の月が替わる
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2000 month:7 day:30], @"仏滅");
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2000 month:7 day:31], @"先勝");
}

- (void)test2005_12 {
    KYRokuyo* rokuyo = [[KYRokuyo alloc] init];

    // 2005-12-2に 旧暦の月が替わる
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2005 month:12 day:1], @"先負");
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2005 month:12 day:2], @"大安");
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2005 month:12 day:3], @"赤口");
    
    // 2000-12-31に 旧暦の月が替わる
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2005 month:12 day:30], @"先負");
    XCTAssertEqualObjects([rokuyo sinrekiToRokuyoWithYear:2005 month:12 day:31], @"赤口");
    
}

@end
