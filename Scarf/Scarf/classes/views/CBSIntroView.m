//
//  CBSIntroView.m
//  Scarf
//
//  Created by Jabari on 1/26/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSIntroView.h"

@implementation CBSIntroView

- (instancetype)initWithFrame:(CGRect)frame overlay:(UIView *)overlay panel:(UIView *)panel
{
    self = [super init];
    if (self) {
       // want it to have a weather view
       // a panel view of some sorts
       // maybe a background or something
        _overlay = overlay;
    }
    return self;
}

@end
