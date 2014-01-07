//
//  CBSLocation.h
//  Scarf
//
//  Created by Jabari on 1/6/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBSLocation : NSObject

@property (nonatomic, assign) BOOL shouldWearScarf;
@property (nonatomic, strong) NSNumber *averageWindSpeed;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
