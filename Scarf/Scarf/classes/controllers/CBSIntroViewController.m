//
//  CBSIntroViewController.m
//  Scarf
//
//  Created by Jabari on 1/25/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSIntroViewController.h"
#import "CBSRainOverlayView.h"

#import <EAIntroView/EAIntroPage.h>
#import <EAIntroView/EAIntroView.h>
#import <VENSnowOverlayView/VENSnowOverlayView.h>

@interface CBSIntroViewController () <EAIntroDelegate>

@property (strong,nonatomic) VENSnowOverlayView *snowOverlayView;

@end

@implementation CBSIntroViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupIntroView];
}

- (void)setupIntroView
{
    int numPages = 6;
    NSMutableArray *pages = [NSMutableArray array];
    
    for (int i = 0; i < numPages; i++) {
        EAIntroPage *page = [EAIntroPage page];
        [pages addObject:page];
    }
    
    EAIntroView *introView = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:pages];
    introView.delegate = self;
    [self.view addSubview:introView];
    
    CBSRainOverlayView *rainOverlay = [[CBSRainOverlayView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:rainOverlay];
    
    _snowOverlayView = [[VENSnowOverlayView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_snowOverlayView];
    _snowOverlayView.alpha = 0;
    [_snowOverlayView beginSnowAnimation];
}

#pragma mark - 
#pragma mark - EAIntroDelegate
- (void)introDidFinish:(EAIntroView *)introView
{
    
}

- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
   if (pageIndex == 3) {
       [UIView animateWithDuration:1 animations:^{
           _snowOverlayView.alpha = 1;
       }];
    } else {
       [UIView animateWithDuration:1 animations:^{
           _snowOverlayView.alpha = 0;
       }];
    }
}

- (void)intro:(EAIntroView *)introView pageStartScrolling:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
}

- (void)intro:(EAIntroView *)introView pageEndScrolling:(EAIntroPage *)page withIndex:(NSInteger)pageIndex
{
    
}

@end
