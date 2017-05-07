//
//  ViewController.m
//  UITest_01
//
//  Created by user on 20.04.17.
//  Copyright © 2017 study. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//My button-press method
- (IBAction)sayHello:(id)sender {
    NSLog(@"%@ %@", [self.firstNameTextField text], [self.lastNameTextField text]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"firstToSecond"]) //проверяем, на какой вид идём
    {
        // если на firstToSecond, то обращаемся к нему
        // (seague - это стрелочка перехода между 2-мя видами)
        ViewController2 *secondController = [segue destinationViewController];
        // и задаём нужные свойства
        [secondController setFirstName: [self.firstNameTextField text]];
        [secondController setLastName: [self.lastNameTextField text]];
    }
}


- (void)dealloc {
    [_firstNameTextField release];
    [_lastNameTextField release];
    [super dealloc];
}
@end
