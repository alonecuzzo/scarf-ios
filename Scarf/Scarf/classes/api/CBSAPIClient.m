//
//  CBSAPIClient.m
//  Scarf
//
//  Created by Jabari on 1/12/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSAPIClient.h"

@implementation CBSAPIClient

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

- (NSURLSessionDataTask *)searchForWeatherAtLocation:(CLLocation *)location completion:(void (^)(NSArray *results, NSError *error))completion
{
    NSURLSessionDataTask *task = [self GET:@"weather/"
                                    parameters:nil
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        
                                    }];
    
    return task;
}

@end
