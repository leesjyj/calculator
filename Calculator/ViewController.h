//
//  ViewController.h
//  Calculator
//
//  Created by MF839-018 on 2016. 6. 15..
//  Copyright © 2016년 MF839-018. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
#import "Fraction.h"
#import "infoViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myBtn;

- (void)processDigit:(int)digit;
- (void)processOp:(char)theOp;
- (void)storeFracPart;

- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

- (IBAction)clickEquals:(id)sender;
- (IBAction)clickOver:(id)sender;
- (IBAction)cilckClear:(id)sender;

- (IBAction)clickDigit:(id)sender;

- (IBAction)openInfoView:(id)sender;

- (IBAction)opneNewView:(id)sender;

@end

