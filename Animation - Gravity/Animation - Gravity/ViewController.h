//
//  ViewController.h
//  Animation - Gravity
//
//  Created by Aditya Narayan on 12/8/14.
//  Copyright (c) 2014 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property(nonatomic, strong) UIImage *rainDropImage;
@property (nonatomic, strong) UIImageView *rainDropView;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) NSMutableArray *rainDrops;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (retain, nonatomic) IBOutlet UIImageView *rainCloudsView;



@end

