//
//  ViewControllerHandMade.m
//  UITest_01
//
//  Created by user on 27.04.17.
//  Copyright © 2017 study. All rights reserved.
//

#import "ViewControllerHandMade.h"

@interface ViewControllerHandMade ()

@end

@implementation ViewControllerHandMade

- (void)viewDidLoad {
    self.width = CGRectGetWidth(self.view.bounds);
    self.height = CGRectGetHeight(self.view.bounds);
    self.userFont = [UIFont fontWithName:@"Arial" size:25];
    [[self view] setBackgroundColor:[UIColor purpleColor]];
//    NSLog(@"%@", userFont);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark - creation of helloButton
    self.helloButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.width-20, 60)]autorelease];
    [self.helloButton setTitle:@"Say hello!" forState:UIControlStateNormal];
    [self.helloButton setBackgroundColor:[UIColor blackColor]];
    [self.helloButton setFont:self.userFont];
//    [helloButton sizeThatFits:CGSizeMake(200, 50)]; //how to set button size???
//    [self.helloButton sizeToFit];
    self.helloButton.center = CGPointMake(self.width/2, self.height/2 + 100);
//    helloButton.titleEdgeInsets = UIEdgeInsetsMake(50, 50, 50, 50);
    [self.helloButton addTarget:self
                    action:@selector(helloButtonTouched:)
          forControlEvents:UIControlEventTouchUpInside];
//    Add button to main scene
    [[self view] addSubview:self.helloButton];
    
#pragma mark - creation of mainLabel

    self.mainLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, 30)]autorelease];
    [self.mainLabel setText:@"Insert your name here"];
    [self.mainLabel setTextColor:[UIColor blackColor]];
    [self.mainLabel setFont:self.userFont];
    [self.mainLabel sizeToFit];
    [self.mainLabel setCenter:CGPointMake(self.width/2, 100)];
    [[self view] addSubview:self.mainLabel];
    NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef) _mainLabel));
    
    
    
#pragma mark - creation of helloUserLabel
    self.helloUserLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, 30)]autorelease];
    [self.helloUserLabel setText:@"Hello!"];
    [self.helloUserLabel setTextColor:[UIColor blackColor]];
    [self.helloUserLabel setFont:self.userFont];
    [self.helloUserLabel sizeToFit];
    [self.helloUserLabel setCenter:CGPointMake(self.width/2, self.height/2 + 150)];
    [[self view] addSubview:self.helloUserLabel];
    
#pragma mark - creation of nameLabel
    self.nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 150, self.width, 30)]autorelease];
    [self.nameLabel setText:@"Name:"];
    [self.nameLabel setTextColor:[UIColor blackColor]];
    [self.nameLabel setFont:self.userFont];
    [self.nameLabel sizeToFit];
    [[self view] addSubview:self.nameLabel];
    
#pragma mark - creation of nameTextField
    self.nameTextField = [[[UITextField alloc] initWithFrame:CGRectMake(100, 150, 150, 30)]autorelease];
    [self.nameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.nameTextField setBackgroundColor:[UIColor whiteColor]];
    [self.nameTextField setTextColor:[UIColor redColor]];
    [self.nameTextField setPlaceholder:@"first name"];
    [[self view] addSubview:self.nameTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)helloButtonTouched:(UIButton *)helloButton {
    NSLog(@"%@", @"helloButton pressed");
    self.userName = self.nameTextField.text;
    [self.helloUserLabel setText:[NSString stringWithFormat:@"Hello, %@", self.userName]];
    [self.helloUserLabel sizeToFit];
    [self.helloUserLabel setCenter:CGPointMake(self.width/2, self.height/2 + 150)];
    if ([[[self view] backgroundColor] isEqual:[UIColor greenColor]]) {
        [[self view] setBackgroundColor:[UIColor purpleColor]];
    } else {
        [[self view] setBackgroundColor:[UIColor greenColor]];
    }
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
    
    [_userFont release];
    [_userName release];
//    NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef) _mainLabel));
    [_mainLabel release];
    [_nameLabel release];
    [_nameTextField release];
    [_helloButton release];
    [_helloUserLabel release];
    [super dealloc];
}

@end
