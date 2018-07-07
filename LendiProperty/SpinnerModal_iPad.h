//
//  SpinnerModal_iPad.h
//  SpyAroundMeUniversal
//
//  Created by Kiran Mane on 3/7/12.
//  Copyright (c) 2012 Vinay Devdikar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SpinnerModal_iPad : UIViewController {
    
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
