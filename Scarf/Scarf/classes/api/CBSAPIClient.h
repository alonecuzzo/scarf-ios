//
//  CBSAPIClient.h
//  Scarf
//
//  Created by Jabari on 1/12/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <CoreLocation/CoreLocation.h>

@interface CBSAPIClient : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (NSURLSessionDataTask *)searchForWeatherAtLocation:(CLLocation *)location completion:(void (^)(NSArray *results, NSError *error))completion;

@end
