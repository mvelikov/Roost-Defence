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

- (void) bulletFire
{
    int step = 1;
    if (enemy.center.y < bullet.center.y) {
        step = -1;
    }
    bullet.center = CGPointMake(bullet.center.x, bullet.center.y + step);
}

- (void) towerAttack
{
    for (UIImageView* tower in builtDefenceTowers) {
        CGRect towerArea = CGRectMake(tower.center.x - 50, tower.center.y - 50, tower.center.x + 50, tower.center.y + 50);
        if (CGRectIntersectsRect(towerArea, enemy.frame)) {
            bullet.center = CGPointMake(tower.center.x, tower.center.y);
            bullet.hidden = NO;
            bulletFiring = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(bulletFire) userInfo:nil repeats:YES];
        }
    }
}
- (IBAction)buildADefenceTower:(id)sender
{
    towerTwo.hidden = NO;
    towerOne.hidden = NO;
    towerThree.hidden = NO;
    towerFour.hidden = NO;
//    bullet.center = CGPointMake(towerTwo.center.x, towerTwo.center.y);
//    bullet.hidden = NO;
    towerAttacking = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(towerAttack) userInfo:nil repeats:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    UIImageView *tower = [[UIImageView alloc] init];
    if ([touch view] == towerOne
        || [touch view] == towerTwo
        || [touch view] == towerThree
        || [touch view] == towerFour) {
        tower = (UIImageView*) [touch view];
        tower.image = [UIImage imageNamed:TOWER];
        [emptyDefenceTowers removeObject:tower];
        [builtDefenceTowers addObject:tower];
        
        for (UIImageView* image in emptyDefenceTowers) {
            image.hidden = YES;
        }
    }
    
}

- (void) startGame
{
    towerOne.image = [UIImage imageNamed:EMPTY_TOWER];
    towerTwo.image = [UIImage imageNamed:EMPTY_TOWER];
    towerThree.image = [UIImage imageNamed:EMPTY_TOWER];
    towerFour.image = [UIImage imageNamed:EMPTY_TOWER];
    
    emptyDefenceTowers = [[NSMutableArray alloc] init];
    builtDefenceTowers = [[NSMutableArray alloc] init];
    [emptyDefenceTowers addObject:towerOne];
    [emptyDefenceTowers addObject:towerTwo];
    [emptyDefenceTowers addObject:towerThree];
    [emptyDefenceTowers addObject:towerFour];

    [towerOne setUserInteractionEnabled:YES];
    [towerTwo setUserInteractionEnabled:YES];
    [towerThree setUserInteractionEnabled:YES];
    [towerFour setUserInteractionEnabled:YES];
    
    enemy.center = CGPointMake(ROUTE_START_X, ROUTE_START_Y);

    enemyMoving = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(enemyMovement) userInfo:nil repeats:YES];
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
        enemy.image = [UIImage imageNamed:ENEMY_UP];
    } else if (enemy.center.x >= ROUTE_LEFT_X
               && enemy.center.y == ROUTE_RIGHT_Y
               && enemy.center.x <= ROUTE_END_X) {
        enemy.center = CGPointMake(enemy.center.x + 1, ROUTE_END_Y);
        enemy.image = [UIImage imageNamed:ENEMY_RIGHT];
    } else if (enemy.center.x > ROUTE_END_X ) {
        enemy.center = CGPointMake(ROUTE_START_X, ROUTE_START_Y);
    }
}
- (void) towerAttacking
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
    [self startGame];
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
