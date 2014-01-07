//
//  CBSLocation.m
//  Scarf
//
//  Created by Jabari on 1/6/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSLocation.h"

@implementation CBSLocation

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _shouldWearScarf = [[dictionary objectForKey:@"should_wear_scarf"] boolValue];
    _averageWindSpeed = [dictionary objectForKey:@"average_wind_speed"];
    
    return self;
}

@end
