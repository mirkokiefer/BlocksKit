//
//  NSTimerBlocksKitTest.h
//  BlocksKit Unit Tests
//

#import <XCTest/XCTest.h>
#import <BlocksKit/NSTimer+BlocksKit.h>
#import "BKAsyncTestCase.h"

@interface NSTimerBlocksKitTest : BKAsyncTestCase

- (void)testScheduledTimer;
- (void)testRepeatedlyScheduledTimer;
- (void)testUnscheduledTimer;
- (void)testRepeatableUnscheduledTimer;

@end
