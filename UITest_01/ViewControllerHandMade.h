//
//  ViewControllerHandMade.h
//  UITest_01
//
//  Created by user on 27.04.17.
//  Copyright © 2017 study. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerHandMade : UIViewController

#pragma mark - handMadeContoller user args
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (retain, nonatomic) UIFont *userFont;
@property (retain, nonatomic) NSString *userName;

#pragma mark - handMadeContoller view elements
@property (retain, nonatomic) UIButton *helloButton;
@property (retain, nonatomic) UILabel *mainLabel;
@property (retain, nonatomic) UILabel *helloUserLabel;
@property (retain, nonatomic) UILabel *nameLabel;
@property (retain, nonatomic) UITextField *nameTextField;
@end
