//
//  ViewController.m
//  Animation - Gravity
//
//  Created by Aditya Narayan on 12/8/14.
//  Copyright (c) 2014 John Bogil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.gravityBehavior = [[UIGravityBehavior alloc]init];
    
    [self makeItRain];
}

-(void)makeItRain{
    NSLog(@"move");
    
    UIImage *rainDropImage = [UIImage imageNamed:@"raindrop.png"];
    
        for (int i = 0; i < 100; i++) {
            
            CGFloat x = (CGFloat) random()/(CGFloat) RAND_MAX * self.view.bounds.size.width;
            CGFloat y = (CGFloat) random()/(CGFloat) RAND_MAX * self.view.bounds.size.height;

            
            self.rainDropView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y+150, 25, 25)];
            [self.rainDropView setImage:rainDropImage];
            [self.view addSubview:self.rainDropView];
            
            
            [self.gravityBehavior addItem:self.rainDropView];
            [self.animator addBehavior:self.gravityBehavior];
            
            
            UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.rainDropView]];
            collisionBehavior.translatesReferenceBoundsIntoBoundary = NO;
            collisionBehavior.collisionDelegate = self;
            [collisionBehavior addBoundaryWithIdentifier:@"lowerBoundary" fromPoint:CGPointMake(0, 750) toPoint:CGPointMake(375, 750)];
            [self.animator addBehavior:collisionBehavior];
            
        }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier {

    item.center = CGPointMake(item.center.x,50);
    [self.animator updateItemUsingCurrentState:item];
    
}



- (void)dealloc {
    [_rainCloudsView release];
    [super dealloc];
}
@end
