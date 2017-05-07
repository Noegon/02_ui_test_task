//
//  ViewController2.m
//  UITest_01
//
//  Created by user on 21.04.17.
//  Copyright © 2017 study. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fullnameLabel.text = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_firstName release];
    [_lastName release];
    [_helloLable release];
    [_fullnameLabel release];
    [super dealloc];
}
@end
