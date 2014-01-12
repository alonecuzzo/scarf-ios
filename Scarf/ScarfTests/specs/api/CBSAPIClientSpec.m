#import "Kiwi.h"
#import "CBSAPIClient.h"
#import <CoreLocation/CoreLocation.h>

SPEC_BEGIN(CBSAPIClientSpec)

describe(@"A CBSAPIClient ", ^{
    
   __block CBSAPIClient *client;
   
    beforeEach(^{
        client = [CBSAPIClient sharedInstance];
    });
    
    afterEach(^{
        client = nil;
    });
    
    context(@"when created", ^{
        
        it(@"should not be nil", ^{
            [[client shouldNot] beNil];
        });
        
        it(@"should have the correct base url", ^{
            [[client.baseURL should] equal:[NSURL URLWithString:@"http://localhost:4730/"]];
        });
    });
    
    
    context(@"when location data is searched for", ^{
        
        __block NSURLSessionDataTask *task;
        
        beforeEach(^{
            CLLocation *location = [[CLLocation alloc] initWithLatitude:45.0000 longitude:45.0000];
            task = [client searchForWeatherAtLocation:location completion:nil];
        });
        
        afterEach(^{
            task = nil;
        });
        
        it(@"should return an nsurlsessiondatatask", ^{
            [[task shouldNot] beNil];
        });
        
        it(@"should make a GET request", ^{
            [[task.originalRequest.HTTPMethod should] equal:@"GET"];
        });
        
        it(@"should have the proper url", ^{
            [[[task.originalRequest.URL absoluteString] should] equal:@"http://localhost:4730/weather/"];
        });
        
    });
    
});

SPEC_END
