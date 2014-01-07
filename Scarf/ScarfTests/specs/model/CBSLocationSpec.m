#import "Kiwi.h"
#import "CBSLocation.h"

SPEC_BEGIN(CBSLocationSpec)

describe(@"When a location object", ^{
    
    context(@"is created", ^{
        it(@"it should not be nil.", ^{
            CBSLocation *location = [[CBSLocation alloc] init];
            [[location shouldNot] beNil];
        });
        
        context(@"with a dictionary", ^{
            it(@"it should properly assign its shouldWearScarf property.", ^{
                NSDictionary *json = @{@"should_wear_scarf" : [NSNumber numberWithBool:YES]};
                CBSLocation *location = [[CBSLocation alloc] initWithDictionary:json];
                [[theValue(location.shouldWearScarf) should] equal:theValue(YES)];
            });
            
            it(@"it should properly assign its averageWindSpeed property", ^{
                NSDictionary *json = @{@"average_wind_speed": @45};
                CBSLocation *location = [[CBSLocation alloc] initWithDictionary:json];
                [[location.averageWindSpeed should] equal:@45];
            });
            
        });
        
    });
    
});

SPEC_END