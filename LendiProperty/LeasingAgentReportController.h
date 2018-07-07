//
//  LeasingAgentReportController.h
//  LendiProperty
//
//  Created by Vinay D on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "SpinnerModal_iPad.h"
#import "LendiPropertyAppDelegate.h"
#import "SBJSON.h"

@interface LeasingAgentReportController : UIViewController<NSURLConnectionDelegate>
{
    IBOutlet UIScrollView *Leasing_Scroll;
    
    IBOutlet UIImageView *Img_View01,*Img_View02,*Img_View03,*Img_View04,*Img_View05,*Img_View06,*Img_View07,*Img_View08,*Img_View09,*Img_View10,*Img_View11,*Img_View12,*Img_View13,*Img_View14,*Img_View15,*Img_View16,*Img_View17,*Img_View18,*Img_View19,*Img_View20,*Img_View21,*Img_View22,*Img_View23,*Img_View24,*Img_View25,*Img_View26,*Img_View27,*Img_View28,*Img_View29,*Img_View30,*Img_View31,*Img_View32,*Img_View33,*Img_View34,*Img_View35,*Img_View36,*Img_View37,*Img_View38,*Img_View39;
    
    IBOutlet UIPickerView *Propertypicker;
    
    IBOutlet UIView *pickerview;
  
     bool chkBox1,chkBox2,chkBox3,chkBox4,chkBox5,chkBox6,chkBox7,chkBox8,chkBox9,chkBox10,chkBox11,chkBox12,chkBox13,chkBox14,chkBox15,chkBox16,chkBox17,chkBox18,chkBox19,chkBox20,chkBox21,chkBox22,chkBox23,chkBox24,chkBox25,chkBox26,chkBox27,chkBox28,chkBox29,chkBox30,chkBox31,chkBox32,chkBox33,chkBox34,chkBox35,chkBox36,chkBox37,chkBox38,chkBox39;
    
    UIBarButtonItem *Save_btn, *barButton;
    
    ParserClass *Obj_parser;
    
    NSMutableData *messagedata,*webData;
    
    NSMutableArray *PikerArray,*propertyid;
    
    SpinnerModal_iPad *spinnerView;
    
    BOOL messagechek,propertycheck,isPropertyChanged;
    
    
}

- (IBAction)chkbtnclick:(id)sender;

- (IBAction)PropertyDoneclcik;

- (void)disabeleview;

- (void)enableview;

- (void)LoadUserProperty;

- (void)postmessage;

- (void) stopSpinner;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

@property (nonatomic, retain) IBOutlet UIPickerView *Propertypicker;

@property (nonatomic, retain) IBOutlet UIView *pickerview;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain)  IBOutlet UIScrollView *Leasing_Scroll;

@property(nonatomic,retain) IBOutlet UIImageView *Img_View01,*Img_View02,*Img_View03,*Img_View04,*Img_View05,*Img_View06,*Img_View07,*Img_View08,*Img_View09,*Img_View10,*Img_View11,*Img_View12,*Img_View13,*Img_View14,*Img_View15,*Img_View16,*Img_View17,*Img_View18,*Img_View19,*Img_View20,*Img_View21,*Img_View22,*Img_View23,*Img_View24,*Img_View25,*Img_View26,*Img_View27,*Img_View28,*Img_View29,*Img_View30,*Img_View31,*Img_View32,*Img_View33,*Img_View34,*Img_View35,*Img_View36,*Img_View37,*Img_View38,*Img_View39;

@end
