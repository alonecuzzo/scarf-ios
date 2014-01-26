//
//  CBSRainOverlayView.m
//  Scarf
//
//  Created by Jabari on 1/25/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import "CBSRainOverlayView.h"

#import <QuartzCore/QuartzCore.h>

@implementation CBSRainOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
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
    
    CAEmitterCell *drop = [CAEmitterCell emitterCell];
    drop.contents = (id)[[UIImage imageNamed:@"drop.png"] CGImage];
    drop.contentsRect = CGRectMake(0, 0, 1.0, 1.0);
    drop.birthRate = 113.0;
    drop.lifetime = 5.0;
    drop.velocity = 240;
    drop.velocityRange = 10;
    drop.yAcceleration = 100;
    
    drop.scale = 1.0;
    drop.scaleRange = 0.5;
    drop.scaleSpeed = 0.2;
    
    drop.alphaRange = 0.2;
    drop.alphaSpeed = -0.7;
    
    drop.emissionLongitude = -M_PI;
    
    emitter.emitterCells = @[drop];
}

@end
