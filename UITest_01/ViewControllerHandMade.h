//
//  ViewControllerHandMade.h
//  UITest_01
//
//  Created by user on 27.04.17.
//  Copyright © 2017 study. All rights reserved.
//

#define SCREEN_WIDTH UIScreen.mainScreen.bounds.size.width // #define width = GRectGetWidth(self.view.bounds) - doesn't works, tells:
                                                           // "GRectGetWidth isn't C99 function"
#define SCREEN_HEIGHT UIScreen.mainScreen.bounds.size.height // the same situation
#define USER_FONT [UIFont fontWithName:@"Arial" size:25] // macro will work, but it is not effective because
                                                         // too many objects will be created in autorelease pool - one object
                                                         // for each time I call macro
// And also: there is bad way to define constants as macrocomands according to code conventions

#import <UIKit/UIKit.h>

@interface ViewControllerHandMade : UIViewController

#pragma mark - handMadeContoller view elements
@property (retain, nonatomic) UIButton *helloButton;
@property (retain, nonatomic) UILabel *mainLabel;
@property (retain, nonatomic) UILabel *helloUserLabel;
@property (retain, nonatomic) UILabel *nameLabel;
@property (retain, nonatomic) UITextField *nameTextField;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
@end
