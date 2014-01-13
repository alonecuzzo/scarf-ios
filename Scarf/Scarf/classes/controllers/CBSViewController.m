//
//  CBSViewController.m
//  Scarf
//
//  Created by Jabari on 1/5/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSViewController.h"
#import "CBSAPIClient.h"
#import <CoreLocation/CoreLocation.h>

@interface CBSViewController ()

@end

@implementation CBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:45.000 longitude:45.000];
    [[CBSAPIClient sharedInstance] searchForWeatherAtLocation:location completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
