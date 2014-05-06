//
//  GameViewController.h
//  Roost Defence
//
//  Created by mihata on 5/6/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
{
    IBOutlet UIImageView *enemy;
    IBOutlet UIImageView *towerOne;
    IBOutlet UIImageView *towerTwo;
    IBOutlet UIImageView *towerThree;
    IBOutlet UIImageView *towerFour;
//    IBOutlet UIButton *towerTwo;
    
    IBOutlet UILabel *score;
    IBOutlet UIImageView *bullet;
    
    IBOutlet UIButton *buildTower;
    
    NSTimer *enemyMoving;
    NSTimer *towerAttacking;
    NSTimer *bulletFiring;
    
    NSMutableArray *emptyDefenceTowers;
    NSMutableArray *builtDefenceTowers;
}

- (void) startGame;
- (void) endGame;
- (void) enemyMovement;
- (void) towerAttack;
- (void) bulletFire;
- (IBAction)buildADefenceTower:(id)sender;
//- (IBAction)defenceTowerBuilt:(id)sender;

@end
