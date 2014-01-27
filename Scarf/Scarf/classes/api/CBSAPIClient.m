//
//  CBSAPIClient.m
//  Scarf
//
//  Created by Jabari on 1/12/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSAPIClient.h"
#import "NSNumber+Validator.h"

#import <AFURLConnectionOperation.h>

@implementation CBSAPIClient

NSString *const CBSAPIClientErrorDomain = @"CBSAPIClientErrorDomain";

+ (instancetype)sharedInstance
{
    static CBSAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://localhost:4730/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sharedClient = [[CBSAPIClient alloc] initWithBaseURL:baseURL sessionConfiguration:config];
    });
    return _sharedClient;
}

- (NSURLSessionDataTask *)searchForWeatherAtLocation:(CLLocation *)location completion:(void (^)(NSDictionary *results, NSError *error))completion
{
    NSNumber *lat = [NSNumber numberWithFloat:location.coordinate.latitude];
    NSNumber *lon = [NSNumber numberWithFloat:location.coordinate.longitude];
    if (!([lat isValidLatitude] && [lon isValidLongitude])) {
        return nil;
    }
    
    NSURLSessionDataTask *task = [self GET:@"weather/"
                                parameters:@{@"lat": [NSNumber numberWithFloat:location.coordinate.latitude],
                                             @"lon": [NSNumber numberWithFloat:location.coordinate.longitude]}
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                        if (response.statusCode == 200) {
                                            if (completion) {
                                               NSError *error = nil;
                                                
                                                if (![responseObject isKindOfClass:[NSDictionary class]]) {
                                                    error = [self errorWithCode:CBSAPIClientErrorTypeMalformedJSON userInfo:nil];
                                                }
                                                
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    completion(responseObject, error);
                                                });
                                            }
                                        } else {
                                            if (completion) {
                                               dispatch_async(dispatch_get_main_queue(), ^{
                                                   completion(nil, nil);
                                               });
                                            }
                                        }
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        NSHTTPURLResponse *response = (NSHTTPURLResponse *)error.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
                                        if (completion) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                completion(nil, [self errorWithCode:response.statusCode userInfo:@{@"originalError": error}]);
                                            });
                                        }
                                    }];
    
    return task;
}

- (NSError *)errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo
{
    return [NSError errorWithDomain:CBSAPIClientErrorDomain code:code userInfo:userInfo];
}

@end
