//
//  CBSIntroView.h
//  Scarf
//
//  Created by Jabari on 1/26/14.
//  Copyright (c) 2014 coffee.beans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBSIntroView : UIView

@property (nonatomic, strong) UIView *overlay;

- (instancetype)initWithFrame:(CGRect)frame overlay:(UIView *)overlay panel:(UIView *)panel;

@end
