//
//  ViewController.m
//  IntroduceViewController
//
//  Created by Ilya on 18/05/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "ViewController.h"
#import "RandomColorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareUI];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Run viewWillAppear");
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"Run viewDidAppear");
}

- (void) prepareUI
{
    //Параметры кнопки для генерации элементов
    UIButton *buttonGenerate = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonGenerate addTarget:self action:@selector(generateReсtangle) forControlEvents:UIControlEventTouchUpInside];
    [buttonGenerate setTitle:@"Generate" forState:UIControlStateNormal];
    buttonGenerate.frame = CGRectMake(self.view.frame.size.width / 2 - (150/2), 120, 150, 60);
    buttonGenerate.titleLabel.font = [UIFont systemFontOfSize:20];
    
    //Параметры кнопки удаления всех элементов
    UIButton *buttonClear = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonClear addTarget:self action:@selector(clearAll) forControlEvents:UIControlEventTouchUpInside];
    [buttonClear setTitle:@"Clear" forState:UIControlStateNormal];
    buttonClear.frame = CGRectMake(self.view.frame.size.width / 2 - (150/2), self.view.frame.size.height - 120, 150, 60);
    [buttonClear setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    buttonClear.titleLabel.font = [UIFont systemFontOfSize:20];
    
    [self.view addSubview:buttonGenerate];
    [self.view addSubview:buttonClear];
    
}

- (void)generateReсtangle
{
    RandomColorView *randomView = [[RandomColorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    randomView.center = self.view.center;
    [self.view addSubview:randomView];
    NSLog(@"New object did generate");

}

- (void)clearAll
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[RandomColorView class]])
        {
            [view removeFromSuperview];
        }
    }
    NSLog(@"All object did remove");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinatesOfTouch = [self getTouchCoordinates:touches];
    NSLog(@"Start touches in main view: %f, %f", coordinatesOfTouch.x, coordinatesOfTouch.y);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinatesOfTouch = [self getTouchCoordinates:touches];
    NSLog(@"Moving touches in main view: %f, %f", coordinatesOfTouch.x, coordinatesOfTouch.y);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint coordinatesOfTouch = [self getTouchCoordinates:touches];
    NSLog(@"End touches in main view: x - %f, y - %f", coordinatesOfTouch.x, coordinatesOfTouch.y);
}


- (CGPoint)getTouchCoordinates:(NSSet<UITouch *> *)touches
{
    UITouch *currentTouch = touches.anyObject;
    return [currentTouch locationInView:self.view];
}

@end
