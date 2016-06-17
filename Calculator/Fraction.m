//
//  Fraction.m
//  ObjC
//
//  Created by MF839-018 on 2016. 6. 13..
//  Copyright © 2016년 MF839-018. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

-(void)print
{
    NSLog(@"%i/%i", numerator, denominator);
}

-(double) convertToNum
{
    
    if ( denominator != 0 )
        return (double) numerator / denominator;
    else
        return NAN;
}

-(void) setTo: (int)n over: (int)d
{
    numerator = n;
    denominator = d;
}

-(void) reduce
{
    
    int u = numerator;
    int v = denominator;
    int temp;
    
    if (u == 0)
        return;
    else if ( u < 0 )
        u = -u;

    while ( v != 0 )
    {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u;
    
}

-(NSString *)convertToString
{
    if (numerator == denominator)
        if (numerator == 0)
            return @"0";
        else
            return @"1";
    else if (denominator == 1)
        return [NSString stringWithFormat: @"%i", numerator];
    else
        return [NSString stringWithFormat: @"%i/%i", numerator, denominator];
    
}

-(Fraction *)add:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = (self.numerator * f.denominator) + (self.denominator * f.numerator);
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}

-(Fraction *)sub:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = (self.numerator * f.denominator) - (self.denominator * f.numerator);
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}
-(Fraction *)mul:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = self.numerator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}
-(Fraction *)div:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numerator = self.numerator * f.denominator;
    result.denominator = self.denominator * f.numerator;

    [result reduce];
    
    return result;
}

@end


