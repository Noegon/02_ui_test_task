//
//  ViewController2.h
//  UITest_01
//
//  Created by user on 21.04.17.
//  Copyright © 2017 study. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController

#pragma mark - 2nd controller user args
@property(nonatomic, retain) NSString* firstName;
@property(nonatomic, retain) NSString* lastName;

#pragma mark - 2nd controller view elements
@property (retain, nonatomic) IBOutlet UILabel *helloLable;
@property (retain, nonatomic) IBOutlet UILabel *fullnameLabel;

@end
