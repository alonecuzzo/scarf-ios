//
//  NSNumber+Validator.m
//  Scarf
//
//  Created by Jabari on 1/26/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "NSNumber+Validator.h"

@implementation NSNumber (Validator)

- (BOOL)isValidLatitude
{
    return ([self floatValue] >= -90 && [self floatValue] <= 90);
}

- (BOOL)isValidLongitude
{
    return ([self floatValue] >= -180 && [self floatValue] <= 180);
}

@end
