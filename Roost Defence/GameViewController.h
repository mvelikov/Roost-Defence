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
    
    NSMutableArray *emptyDefenceTowers;
}

- (void) startGame;
- (void) endGame;
- (void) enemyMovement;
- (void) towerAttack;
- (IBAction)buildADefenceTower:(id)sender;
- (IBAction)defenceTowerBuilt:(id)sender;

@end
