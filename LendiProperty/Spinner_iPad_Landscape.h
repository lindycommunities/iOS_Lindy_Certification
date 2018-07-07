//
//  Spinner_iPad_Landscape.h
//  LendiProperty
//
//  Created by ss pl on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Spinner_iPad_Landscape : UIViewController
{
    
    UIActivityIndicatorView *spinner;
    UIProgressView *progbar;
    NSString *currentType;
    NSString *currentDisplay;
    UILabel *theLabel;
    UIView *blackBox;
    
}

@property (retain,nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (retain,nonatomic) IBOutlet UIProgressView *progbar;
@property (retain,nonatomic) IBOutlet UILabel *theLabel;
@property (retain,nonatomic) IBOutlet UIView *blackBox;
@property (retain,nonatomic) NSString *currentType;
@property (retain,nonatomic) NSString *currentDisplay;

- (id)initWithType:(NSString*)type andDisplay:(NSString*)display;

@end
