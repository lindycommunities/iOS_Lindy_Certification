//
//  WeeklyManagerReportController.h
//  LendiProperty
//
//  Created by Vinay D on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import <QuartzCore/QuartzCore.h>
#import "SpinnerModal_iPad.h"
#import "SBJSON.h"


@interface WeeklyManagerReportController : UIViewController
{
    IBOutlet UITextField *FromDate_txt,*ToDate_txt,*Property_txt,*Manager_txt;
    
    IBOutlet UIScrollView *Scroll_view;

    IBOutlet UIButton *btn1,*btn2,*btn3,*btn4,*btn5,*btn6,*btn7,*btn8,*btn9,*btn10,*btn11,*btn12,*btn13,*btn14,*btn15,*btn16,*btn17,*btn18,*btn19,*btn20,*btn21,*btn22,*btn23,*btn24,*btn25,*btn26,*btn27,*btn28,*btn29,*btn30,*btn31,*btn32,*btn33,*btn34,*btn35,*btn36,*btn37,*btn38,*btn39,*btn40,*btn41,*btn42,*btn43,*btn44,*btn45,*btn46,*btn47,*btn48,*btn49,*btn50,*btn51,*btn52,*btn53,*btn54,*btn55,*btn56,*btn57,*btn58,*btn59,*btn60,*btn61,*btn62,*btn63,*btn64,*btn65,*btn66,*btn67,*btn68,*btn69,*btn70,*btn71,*btn72,*btn73,*btn74,*btn75,*btn76,*btn77,*btn78,*btn79,*btn80,*btn81,*btn82,*btn83,*btn84,*btn85,*btn86,*btn87,*btn88,*btn89,*btn90,*btn91,*btn92,*btn93,*btn94,*btn95,*btn96,*btn97,*btn98,*btn99,*btn100;

    IBOutlet UIButton *btn101,*btn102,*btn103,*btn104,*btn105,*btn106,*btn107,*btn108,*btn109,*btn110,*btn111,*btn112,*btn113,*btn114,*btn115,*btn116,*btn117,*btn118,*btn119,*btn120,*btn121,*btn122,*btn123,*btn124,*btn125,*btn126,*btn127,*btn128,*btn129,*btn130,*btn131,*btn132,*btn133,*btn134,*btn135,*btn136,*btn137,*btn138,*btn139,*btn140,*btn141,*btn142,*btn143,*btn144,*btn145,*btn146,*btn147,*btn148,*btn149,*btn150,*btn151,*btn152,*btn153,*btn154,*btn155,*btn156,*btn157,*btn158,*btn159,*btn160,*btn161,*btn162,*btn163,*btn164,*btn165,*btn166,*btn167,*btn168,*btn169,*btn170,*btn171,*btn172,*btn173,*btn174,*btn175,*btn176,*btn177,*btn178,*btn179,*btn180,*btn181,*btn182,*btn183,*btn184,*btn185,*btn186,*btn187,*btn188,*btn189,*btn190,*btn191,*btn192;
    
   
    
    UIBarButtonItem *btnNext;
    
    IBOutlet UILabel *DateFirst_lab,*DateSecond_lab,*DateThird_lab,*DateFourth_lab;
    
    ParserClass *objParser;
    
    int Reportid;
    
    SpinnerModal_iPad *spinnerView;
    
    NSString *UserName;
    
    NSMutableData *webData;

}
- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username;

-(void)setData;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain)IBOutlet UITextField *FromDate_txt,*ToDate_txt,*Property_txt,

*Manager_txt;

@property(nonatomic,retain)IBOutlet UIScrollView *Scroll_view;

@property(nonatomic,retain)IBOutlet UILabel *DateFirst_lab,*DateSecond_lab,*DateThird_lab,*DateFourth_lab;

@property(nonatomic,retain) IBOutlet UIButton *btn1,*btn2,*btn3,*btn4,*btn5,*btn6,*btn7,*btn8,*btn9,*btn10,*btn11,*btn12,*btn13,*btn14,*btn15,*btn16,*btn17,*btn18,*btn19,*btn20,*btn21,*btn22,*btn23,*btn24,*btn25,*btn26,*btn27,*btn28,*btn29,*btn30,*btn31,*btn32,*btn33,*btn34,*btn35,*btn36,*btn37,*btn38,*btn39,*btn40,*btn41,*btn42,*btn43,*btn44,*btn45,*btn46,*btn47,*btn48,*btn49,*btn50,*btn51,*btn52,*btn53,*btn54,*btn55,*btn56,*btn57,*btn58,*btn59,*btn60,*btn61,*btn62,*btn63,*btn64,*btn65,*btn66,*btn67,*btn68,*btn69,*btn70,*btn71,*btn72,*btn73,*btn74,*btn75,*btn76,*btn77,*btn78,*btn79,*btn80,*btn81,*btn82,*btn83,*btn84,*btn85,*btn86,*btn87,*btn88,*btn89,*btn90,*btn91,*btn92,*btn93,*btn94,*btn95,*btn96,*btn97,*btn98,*btn99,*btn100;

@property(nonatomic,retain)IBOutlet UIButton *btn101,*btn102,*btn103,*btn104,*btn105,*btn106,*btn107,*btn108,*btn109,*btn110,*btn111,*btn112,*btn113,*btn114,*btn115,*btn116,*btn117,*btn118,*btn119,*btn120,*btn121,*btn122,*btn123,*btn124,*btn125,*btn126,*btn127,*btn128,*btn129,*btn130,*btn131,*btn132,*btn133,*btn134,*btn135,*btn136,*btn137,*btn138,*btn139,*btn140,*btn141,*btn142,*btn143,*btn144,*btn145,*btn146,*btn147,*btn148,*btn149,*btn150,*btn151,*btn152,*btn153,*btn154,*btn155,*btn156,*btn157,*btn158,*btn159,*btn160,*btn161,*btn162,*btn163,*btn164,*btn165,*btn166,*btn167,*btn168,*btn169,*btn170,*btn171,*btn172,*btn173,*btn174,*btn175,*btn176,*btn177,*btn178,*btn179,*btn180,*btn181,*btn182,*btn183,*btn184,*btn185,*btn186,*btn187,*btn188,*btn189,*btn190,*btn191,*btn192;
@end
