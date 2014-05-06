//
//  GameViewController.m
//  Roost Defence
//
//  Created by mihata on 5/6/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void) startGame
{
    towerOne.image = [UIImage imageNamed:EMPTY_TOWER];
    towerTwo.image = [UIImage imageNamed:EMPTY_TOWER];
    
    enemy.center = CGPointMake(ROUTE_START_X, ROUTE_START_Y);
    
    gameEngine = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(enemyMovement) userInfo:nil repeats:YES];
}
- (void) endGame
{
    
}
- (void) enemyMovement
{
    if (enemy.center.x < ROUTE_LEFT_X && enemy.center.y == ROUTE_START_Y) {
        enemy.center = CGPointMake(enemy.center.x + 1, ROUTE_START_Y);
    } else if (enemy.center.x == ROUTE_LEFT_X && enemy.center.y > ROUTE_RIGHT_Y) {
        enemy.center = CGPointMake(ROUTE_LEFT_X, enemy.center.y - 1);
    } else if (enemy.center.x >= ROUTE_LEFT_X && enemy.center.y == ROUTE_RIGHT_Y) {
        enemy.center = CGPointMake(enemy.center.x + 1, ROUTE_END_Y);
    }
}
- (void) towerAttack
{
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
