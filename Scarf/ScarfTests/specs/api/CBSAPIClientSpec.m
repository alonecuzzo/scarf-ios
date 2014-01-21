#import "Kiwi.h"
#import "CBSAPIClient.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubsResponse.h>

#pragma mark - 
#pragma helper functions

@interface CBSAPIClientSpecHelperMethods : NSObject 

+ (void)setupStubRequestPassingTestWithStatusCode:(int)statusCode;
+ (CLLocation *)aLocation;

@end

@implementation CBSAPIClientSpecHelperMethods : NSObject 

+ (void)setupStubRequestPassingTestWithStatusCode:(int)statusCode
{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithFileAtPath:@"weather.json" statusCode:statusCode headers:nil] responseTime:1.0];
    }];
}

+ (CLLocation *)aLocation
{
   return [[CLLocation alloc] initWithLatitude:45.384 longitude:45.384];
}

@end


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
            task = [client searchForWeatherAtLocation:[CBSAPIClientSpecHelperMethods aLocation] completion:nil];
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
            [[[task.originalRequest.URL absoluteString] should] equal:@"http://localhost:4730/weather/?lat=45.384&lon=45.384"];
        });
        
        pending_(@"should not accept an invalid latitude", ^{
            
        });
        
       pending_(@"should not accept an invalid longitude", ^{
    
       });
        
        context(@"and data is returned", ^{
          
            it(@"should throw the proper error if a 404 is returned", ^{
                __block NSError *myError = nil;
                
                [CBSAPIClientSpecHelperMethods setupStubRequestPassingTestWithStatusCode:404];
               
                [client searchForWeatherAtLocation:[CBSAPIClientSpecHelperMethods aLocation] completion:^(NSDictionary *results, NSError *error) {
                    if (error) {
                        myError = error;
                    }
                }];
                
                [[expectFutureValue(theValue(myError.code)) shouldEventuallyBeforeTimingOutAfter(2.0)] equal:theValue(404)];
            });
            
            pending_(@"should not throw any error if 200 response", ^{
                __block NSError *myError = nil;
                
                [CBSAPIClientSpecHelperMethods setupStubRequestPassingTestWithStatusCode:200];
                
                [client searchForWeatherAtLocation:[CBSAPIClientSpecHelperMethods aLocation] completion:^(NSDictionary *results, NSError *error) {
                    if (error) {
                        myError = error;
                    }
                }];
                
                [[expectFutureValue(theValue(myError)) shouldEventuallyBeforeTimingOutAfter(2.0)] beNil];
                
            });
            
            pending_(@"should throw malformed json error if bad data passed", ^{
                
            });
            
        });
    });
});

SPEC_END
