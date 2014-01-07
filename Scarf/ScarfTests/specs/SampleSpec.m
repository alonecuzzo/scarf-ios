#import "Kiwi.h"

SPEC_BEGIN(MathSpec)

//describe(@"Math", ^{
//    it(@"is pretty cool", ^{
//        NSUInteger a = 40;
//        NSUInteger b = 3;
//        [[theValue(a + b) should] equal:theValue(43)];
//    });
//});

describe(@"In my first kiwi test", ^{
    context(@"a sample string", ^{
        NSString  *greeting = @"hello world";
        it(@"should exist", ^{
            [[greeting shouldNot] beNil];
        });
        
        it(@"should be 'hello, world'", ^{
            [[greeting should] equal:@"hello world"];
        });
        
        pending_(@"it is not nil", ^{
            
        });
    });
});

SPEC_END
