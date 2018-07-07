//
//  WeeklyReportViewPart2.h
//  LendiProperty
//
//  Created by Vinay D on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "SpinnerModal_iPad.h"
#import "LendiPropertyAppDelegate.h"
#import "LindyPropertyReportingViewController.h"


@interface WeeklyReportViewPart2 : UIViewController <NSURLConnectionDelegate>

{
    IBOutlet UIScrollView *Scroll_view;
    
    IBOutlet UITextField *A_txt,*B_txt,*C_txt,*D_txt,*E_txt,*F_txt,*G_txt,*H_txt,*I_txt,*J_txt,*K_txt;
    
    UIBarButtonItem *btnNext;
    
    ParserClass *classObj;
    
    NSMutableData *webData,*messagedata;
    
    BOOL messagechek;
    
    SpinnerModal_iPad *spinnerView;
   
 
}

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain)IBOutlet UIScrollView *Scroll_view;

@property(nonatomic,retain)IBOutlet UITextField *A_txt,*B_txt,*C_txt,*D_txt,*E_txt,*F_txt,*G_txt,*H_txt,*I_txt,*J_txt,*K_txt;

- (id)initWithParserObj:(ParserClass *)_objParser;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void)postmessage;

-(void)DataInsertaion;


@end
