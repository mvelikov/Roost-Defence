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
    
    IBOutlet UILabel *score;
    
    NSTimer *gameEngine;
}

- (void) startGame;
- (void) endGame;
- (void) enemyMovement;
- (void) towerAttack;
@end
