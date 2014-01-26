//
//  CBSSnowOverlayView.m
//  Scarf
//
//  Created by Jabari on 1/26/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSSnowOverlayView.h"

#import <QuartzCore/QuartzCore.h>

@implementation CBSSnowOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupEmitter];
    }
    return self;
}

+ (Class)layerClass
{
    return [CAEmitterLayer class];
}

- (void)setupEmitter
{
    CAEmitterLayer *emitter = (CAEmitterLayer *)self.layer;
    emitter.emitterShape = kCAEmitterLayerLine;
    emitter.renderMode = kCAEmitterLayerOldestLast;
    emitter.emitterPosition = CGPointMake(self.frame.size.width / 2, -10);
    emitter.emitterSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    
    CAEmitterCell *flake = [CAEmitterCell emitterCell];
    flake.contents = (id)[[UIImage imageNamed:@"flake.png"] CGImage];
    flake.contentsRect = CGRectMake(0, 0, 1.0, 1.0);
    flake.birthRate = 113.0;
    flake.lifetime = 10.0;
    flake.velocity = 80;
    flake.velocityRange = 10;
    flake.yAcceleration = 53;
    
    flake.scale = 0.2;
    flake.scaleRange = 0.05;
    
    flake.alphaRange = 0.2;
    flake.alphaSpeed = -0.4;
    
    flake.emissionLongitude = -M_PI;
    
    emitter.emitterCells = @[flake];
}

@end
