//
//  ViewControllerHandMade.m
//  UITest_01
//
//  Created by user on 27.04.17.
//  Copyright © 2017 study. All rights reserved.
//

#import "ViewControllerHandMade.h"

// better way is define fontName and size as constants and initialize readonly ivar in initWithCoder method
static NSString *const NGNFontName = @"Arial";
static const CGFloat NGNFontSize = 25.0;
//static UIFont *const testFont = [UIFont fontWithName:@"Arial" size:25.0]; //I cannot define object constant such way:
                                                                            //Initializer element isn't compile-time constant.
                                                                            //The conclusion is to use literal constants with
                                                                            //synergy with instance ivars

//if I want to define private properties, I should do it here,
//but ivars I could to define in implementation, as i understood
@interface ViewControllerHandMade ()

@end

@implementation ViewControllerHandMade {
    NSString *_userName; // that's normal to use ivar or property in that case: I need private
                         // instance variable, that could be changed from inside the class
    UIFont *_userFont;
}

// we need to redefine exactly initWithCoder: method if using storyboards to initialize users ivars!!!
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _userFont = [UIFont fontWithName:NGNFontName size:NGNFontSize];
    }
    return self;
}

- (void)setUserName:(NSString *)newName {
    [newName retain];
    [_userName release];
    _userName = newName;
}

- (NSString *)userName {
    return [[_userName retain]autorelease];
}

- (UIFont *)userFont {
    return _userFont;
}

// such construction (just getter) could be an alternative for macrodefinitions
- (CGFloat)screenWidth {
    return CGRectGetWidth(self.view.bounds);
}

- (CGFloat)screenHeight {
    return CGRectGetHeight(self.view.bounds);
}


- (void)viewDidLoad {
    
//    self.width = CGRectGetWidth(self.view.bounds);
//    self.height = CGRectGetHeight(self.view.bounds);
//    self.userFont = [UIFont fontWithName:@"Arial" size:25];
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    [super viewDidLoad];
    
#pragma mark - creation of helloButton
    self.helloButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, [self screenWidth]-20, 60)]autorelease];
    [self.helloButton setTitle:@"Say hello!" forState:UIControlStateNormal];
    [self.helloButton setBackgroundColor:[UIColor blackColor]];
    [self.helloButton setFont:self.userFont];
//    [helloButton sizeThatFits:CGSizeMake(200, 50)]; //how to set button size???
//    [self.helloButton sizeToFit];
    self.helloButton.center = CGPointMake([self screenWidth]/2, [self screenHeight]/2 + 100);
//    helloButton.titleEdgeInsets = UIEdgeInsetsMake(50, 50, 50, 50);
    [self.helloButton addTarget:self
                    action:@selector(helloButtonTouched:)
          forControlEvents:UIControlEventTouchUpInside];
//    Add button to main scene
    [self.view addSubview:self.helloButton];
    
#pragma mark - creation of mainLabel

    self.mainLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, [self screenWidth], 30)]autorelease];
    [self.mainLabel setText:@"Insert your name here"];
    [self.mainLabel setTextColor:[UIColor blackColor]];
    [self.mainLabel setFont:self.userFont];
    [self.mainLabel sizeToFit];
    [self.mainLabel setCenter:CGPointMake([self screenWidth]/2, 100)];
    [self.view addSubview:self.mainLabel];
    NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef) _mainLabel));
    
    
    
#pragma mark - creation of helloUserLabel
    self.helloUserLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, [self screenWidth], 30)]autorelease];
    [self.helloUserLabel setText:@"Hello!"];
    [self.helloUserLabel setTextColor:[UIColor blackColor]];
    [self.helloUserLabel setFont:self.userFont];
    [self.helloUserLabel sizeToFit];
    [self.helloUserLabel setCenter:CGPointMake([self screenWidth]/2, [self screenHeight]/2 + 150)];
    [self.view addSubview:self.helloUserLabel];
    
#pragma mark - creation of nameLabel
    self.nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 150, [self screenWidth], 30)]autorelease];
    [self.nameLabel setText:@"Name:"];
    [self.nameLabel setTextColor:[UIColor blackColor]];
    [self.nameLabel setFont:self.userFont];
    [self.nameLabel sizeToFit];
    [self.view addSubview:self.nameLabel];
    
#pragma mark - creation of nameTextField
    self.nameTextField = [[[UITextField alloc] initWithFrame:CGRectMake(100, 150, 150, 30)]autorelease];
    [self.nameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.nameTextField setBackgroundColor:[UIColor whiteColor]];
    [self.nameTextField setTextColor:[UIColor redColor]];
    [self.nameTextField setPlaceholder:@"first name"];
    [self.view addSubview:self.nameTextField];
}

- (void)helloButtonTouched:(UIButton *)helloButton {
    NSLog(@"%@", @"helloButton pressed");
    self.userName = self.nameTextField.text;
    [self.helloUserLabel setText:[NSString stringWithFormat:@"Hello, %@", self.userName]];
    [self.helloUserLabel sizeToFit];
    [self.helloUserLabel setCenter:CGPointMake([self screenWidth]/2, [self screenHeight]/2 + 150)];
    if ([[self.view backgroundColor] isEqual:[UIColor greenColor]]) {
        [self.view setBackgroundColor:[UIColor purpleColor]];
    } else {
        [self.view setBackgroundColor:[UIColor greenColor]];
    }
}

- (void)dealloc {
    
//    NSLog(@"%ld", CFGetRetainCount((__bridge CFTypeRef) _mainLabel));
    [_mainLabel release];
    [_nameLabel release];
    [_nameTextField release];
    [_helloButton release];
    [_helloUserLabel release];
    [super dealloc];
}

@end
