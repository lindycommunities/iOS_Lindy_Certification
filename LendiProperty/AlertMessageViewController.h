//
//  AlertMessageViewController.h
//  LendiProperty
//
//  Created by Vinay D on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LendiPropertyAppDelegate.h"
#import "SpinnerModal_iPad.h"


@interface AlertMessageViewController : UIViewController<UITextFieldDelegate,NSURLConnectionDelegate>
{
    IBOutlet UIButton *Send_btn,*Cancle_btn;
    
   IBOutlet UITextView *Message_txt;
    
     
    
    NSMutableData *webData;
    
    NSString *str_date;
    
    LendiPropertyAppDelegate *app;
    
    SpinnerModal_iPad *spinnerView;
    
    
    
}

-(IBAction)SendAlert;

-(IBAction)CancleAlert;

-(void) stopSpinner;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain) IBOutlet UIButton *Send_btn,*Cancle_btn;

@property(nonatomic,retain) IBOutlet UITextView *Message_txt;

@end
