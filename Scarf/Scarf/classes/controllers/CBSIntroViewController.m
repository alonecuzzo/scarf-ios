//
//  CBSIntroViewController.m
//  Scarf
//
//  Created by Jabari on 1/25/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSIntroViewController.h"
#import "CBSSnowOverlayView.h"
#import "CBSRainOverlayView.h"

#import <EAIntroView/EAIntroPage.h>
#import <EAIntroView/EAIntroView.h>

@interface CBSIntroViewController () <EAIntroDelegate>

@end

@implementation CBSIntroViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupIntroView];
}

- (void)setupIntroView
{
    int numPages = 2;
    NSMutableArray *pages = [NSMutableArray array];
    CBSRainOverlayView *rainOverlay = [[CBSRainOverlayView alloc] initWithFrame:self.view.bounds];
    CBSSnowOverlayView *snowOverlay = [[CBSSnowOverlayView alloc] initWithFrame:self.view.bounds];
    
    for (int i = 0; i < numPages; i++) {
        EAIntroPage *page = [EAIntroPage page];
        if (i % 2 == 0) {
            page.customView = rainOverlay;
        } else {
            page.customView = snowOverlay;
        }
//        page.customView.alpha = 0;
        [pages addObject:page];
    }
    
    EAIntroView *introView = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:pages];
    introView.delegate = self;
    [introView showInView:self.view animateDuration:0.3];
}

#pragma mark - 
#pragma mark - EAIntroDelegate
- (void)introDidFinish:(EAIntroView *)introView
{
    
}

- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
    
}

- (void)intro:(EAIntroView *)introView pageStartScrolling:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
}

- (void)intro:(EAIntroView *)introView pageEndScrolling:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
    
}

@end
