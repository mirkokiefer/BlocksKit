//
//  NSTimerBlocksKitTest.m
//  BlocksKit Unit Tests
//
//  Created by Kai Wu on 7/5/11.
//  Copyright (c) 2011-2012 Pandamonia LLC. All rights reserved.
//

#import "NSTimerBlocksKitTest.h"

@implementation NSTimerBlocksKitTest {
	NSInteger _total;	
}

- (void)setUp {
	_total = 0;
}

- (void)testScheduledTimer {
	BKTimerBlock timerBlock = ^(NSTimeInterval time) {
		_total++;
		NSLog(@"total is %lu", (unsigned long)_total);
	};
	[self prepare];
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 block:timerBlock repeats:NO];
	XCTAssertNotNil(timer,@"timer is nil");
	[self waitForTimeout:0.5];
	XCTAssertEquals(_total, (NSInteger)1, @"total is %d", _total);
}

- (void)testRepeatedlyScheduledTimer {
	BKTimerBlock timerBlock = ^(NSTimeInterval time) {
		_total++;
		NSLog(@"total is %lu", (unsigned long)_total);
	};
	[self prepare];
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 block:timerBlock repeats:YES];
	XCTAssertNotNil(timer,@"timer is nil");
	[self waitForTimeout:0.5];
	[timer invalidate];
	XCTAssertTrue(_total > 3, @"total is %d", _total);
}

- (void)testUnscheduledTimer {
	BKTimerBlock timerBlock = ^(NSTimeInterval time) {
		_total++;
		NSLog(@"total is %lu", (unsigned long)_total);
	};
	[self prepare];
	NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 block:timerBlock repeats:NO];
	XCTAssertNotNil(timer,@"timer is nil");
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	[self waitForTimeout:0.5];
	XCTAssertEquals(_total, (NSInteger)1, @"total is %d", _total);
}

- (void)testRepeatableUnscheduledTimer {
	BKTimerBlock timerBlock = ^(NSTimeInterval time) {
		_total += 1;
		NSLog(@"total is %lu", (unsigned long)_total);
	};
	[self prepare];
	NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 block:timerBlock repeats:YES];
	XCTAssertNotNil(timer,@"timer is nil");
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	[self waitForTimeout:0.5];
	[timer invalidate];
	XCTAssertTrue(_total > 3, @"total is %d", _total);
}

@end
