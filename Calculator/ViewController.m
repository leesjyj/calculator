//
//  ViewController.m
//  Calculator
//
//  Created by MF839-018 on 2016. 6. 15..
//  Copyright © 2016년 MF839-018. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "Fraction.h"
#import "infoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
    
    display.text = @"";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlus:(id)sender
{
    [self processOp:'+'];
}

- (IBAction)clickMinus:(id)sender
{
    [self processOp:'-'];
}

- (IBAction)clickMultiply:(id)sender
{
    [self processOp:'*'];
}

- (IBAction)clickDivide:(id)sender
{
    [self processOp:'/'];
}

- (IBAction)clickEquals:(id)sender {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@"  =  "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

- (IBAction)clickOver:(id)sender {
    
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}

- (IBAction)cilckClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text = displayString;
    
//    btnPlus.enabled = YES;
}

- (IBAction)clickDigit:(UIButton *)sender {
    int digit = (int)sender.tag;
    [self processDigit:digit];
    
//    [self processDigit:(int)sender.tag];
}

- (IBAction)openInfoView:(id)sender {
    
    infoViewController *infoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"infoview"];

    infoViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:infoViewController animated:YES completion:nil];

}

- (IBAction)opneNewView:(id)sender {
    
    [self performSegueWithIdentifier:@"purpleview" sender:self];
}

- (void)processDigit:(int)digit{

    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat: @"%i", digit ]];
    display.text = displayString;
}

- (void)processOp:(char)theOp{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp)
    {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
}

- (void)storeFracPart{
    
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}



@end
