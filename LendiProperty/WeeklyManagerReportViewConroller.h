//
//  WeeklyManagerReportViewConroller.h
//  LendiProperty
//
//  Created by Vinay D on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//188
#import <UIKit/UIKit.h>
#import "WeeklyReportViewPart2.h"
#import "ParserClass.h"
#import "LendiPropertyAppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "WeeklyReportViewPart2.h"

@interface WeeklyManagerReportViewConroller : UIViewController<NSURLConnectionDelegate>
{
    IBOutlet UIView *Date_view;
    
    IBOutlet UIPickerView *Propertypicker;
    
    IBOutlet UIView *pickerview;
    
    IBOutlet UIDatePicker *Date_picker;
    
    IBOutlet UIButton *Done_btn,*FromDate_btn,*ToDate_btn,*DateFirst_btn,*DateSecond_btn,
    
    *DateThird_btn,*DateFourth_btn;
    
    IBOutlet UITextField *FromDate_txt,*ToDate_txt,*Property_txt,*Manager_txt;
    
    IBOutlet UIScrollView *Scroll_view;
    
    IBOutlet UILabel *DateFirst_lab,*DateSecond_lab,*DateThird_lab,*DateFourth_lab,*Note_lab;
    
    IBOutlet UIButton *btn1,*btn2,*btn3,*btn4,*btn5,*btn6,*btn7,*btn8,*btn9,*btn10,*btn11,*btn12,*btn13,*btn14,*btn15,*btn16,*btn17,*btn18,*btn19,*btn20,*btn21,*btn22,*btn23,*btn24,*btn25,*btn26,*btn27,*btn28,*btn29,*btn30,*btn31,*btn32,*btn33,*btn34,*btn35,*btn36,*btn37,*btn38,*btn39,*btn40,*btn41,*btn42,*btn43,*btn44,*btn45,*btn46,*btn47,*btn48,*btn49,*btn50,*btn51,*btn52,*btn53,*btn54,*btn55,*btn56,*btn57,*btn58,*btn59,*btn60,*btn61,*btn62,*btn63,*btn64,*btn65,*btn66,*btn67,*btn68,*btn69,*btn70,*btn71,*btn72,*btn73,*btn74,*btn75,*btn76,*btn77,*btn78,*btn79,*btn80,*btn81,*btn82,*btn83,*btn84,*btn85,*btn86,*btn87,*btn88,*btn89,*btn90,*btn91,*btn92,*btn93,*btn94,*btn95,*btn96,*btn97,*btn98,*btn99,*btn100;
    
    IBOutlet UIButton *btn101,*btn102,*btn103,*btn104,*btn105,*btn106,*btn107,*btn108,*btn109,*btn110,*btn111,*btn112,*btn113,*btn114,*btn115,*btn116,*btn117,*btn118,*btn119,*btn120,*btn121,*btn122,*btn123,*btn124,*btn125,*btn126,*btn127,*btn128,*btn129,*btn130,*btn131,*btn132,*btn133,*btn134,*btn135,*btn136,*btn137,*btn138,*btn139,*btn140,*btn141,*btn142,*btn143,*btn144,*btn145,*btn146,*btn147,*btn148,*btn149,*btn150,*btn151,*btn152,*btn153,*btn154,*btn155,*btn156,*btn157,*btn158,*btn159,*btn160,*btn161,*btn162,*btn163,*btn164,*btn165,*btn166,*btn167,*btn168,*btn169,*btn170,*btn171,*btn172,*btn173,*btn174,*btn175,*btn176,*btn177,*btn178,*btn179,*btn180,*btn181,*btn182,*btn183,*btn184,*btn185,*btn186,*btn187,*btn188,*btn189,*btn190,*btn191,*btn192;
    
     UIBarButtonItem *btnNext, *barButton;
    
    NSString *Chekdate;
    
    ParserClass *objParser; 
       
    NSMutableData *webData;
    
    NSMutableArray *PikerArray,*propertyid;
    
    BOOL propertycheck,isPropertyChanged;
   

   
    
    WeeklyReportViewPart2 *week;
    
    bool chkLabel;
    
    bool chkBox1,chkBox2,chkBox3,chkBox4,chkBox5,chkBox6,chkBox7,chkBox8,chkBox9,chkBox10,chkBox11,chkBox12,chkBox13,chkBox14,chkBox15,chkBox16,chkBox17,chkBox18,chkBox19,chkBox20,chkBox21,chkBox22,chkBox23,chkBox24,chkBox25,chkBox26,chkBox27,chkBox28,chkBox29,chkBox30,chkBox31,chkBox32,chkBox33,chkBox34,chkBox35,chkBox36,chkBox37,chkBox38,chkBox39,chkBox40,chkBox41,chkBox42,chkBox43,chkBox44,chkBox45,chkBox46,chkBox47,chkBox48,chkBox49,chkBox50,chkBox51,chkBox52,chkBox53,chkBox54,chkBox55,chkBox56,chkBox57,chkBox58,chkBox59,chkBox60,chkBox61,chkBox62,chkBox63,chkBox64,chkBox65,chkBox66,chkBox67,chkBox68,chkBox69,chkBox70,chkBox71,chkBox72,chkBox73,chkBox74,chkBox75,chkBox76,chkBox77,chkBox78,chkBox79,chkBox80,chkBox81,chkBox82,chkBox83,chkBox84,chkBox85,chkBox86,chkBox87,chkBox88,chkBox89,chkBox90,chkBox91,chkBox92,chkBox93,chkBox94,chkBox95,chkBox96,chkBox97,chkBox98,chkBox99,chkBox100;
    
   
    bool chkBox101,chkBox102,chkBox103,chkBox104,chkBox105,chkBox106,chkBox107,chkBox108,chkBox109,chkBox110,chkBox111,chkBox112,chkBox113,chkBox114,chkBox115,chkBox116,chkBox117,chkBox118,chkBox119,chkBox120,chkBox121,chkBox122,chkBox123,chkBox124,chkBox125,chkBox126,chkBox127,chkBox128,chkBox129,chkBox130,chkBox131,chkBox132,chkBox133,chkBox134,chkBox135,chkBox136,chkBox137,chkBox138,chkBox139,chkBox140,chkBox141,chkBox142,chkBox143,chkBox144,chkBox145,chkBox146,chkBox147,chkBox148,chkBox149,chkBox150,chkBox151,chkBox152,chkBox153,chkBox154,chkBox155,chkBox156,chkBox157,chkBox158,chkBox159,chkBox160,chkBox161,chkBox162,chkBox163,chkBox164,chkBox165,chkBox166,chkBox167,chkBox168,chkBox169,chkBox170,chkBox171,chkBox172,chkBox173,chkBox174,chkBox175,chkBox176,chkBox177,chkBox178,chkBox179,chkBox180,chkBox181,chkBox182,chkBox183,chkBox184,chkBox185,chkBox186,chkBox187,chkBox188,chkBox189,chkBox190,chkBox191,chkBox192;
    
}

- (IBAction)FromDate;

- (IBAction)ToDate;

- (IBAction)DonebtnClick;

- (IBAction)DateCollection:(id)sender;

- (IBAction)PropertyDoneclcik;

- (void)disabeleview;

- (void)enableview;

- (void)LoadUserProperty;

- (void) stopSpinner;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property (nonatomic, retain) IBOutlet UIPickerView *Propertypicker;

@property (nonatomic, retain) IBOutlet UIView *pickerview;

@property (nonatomic, retain) IBOutlet UIView *Date_view;

@property (nonatomic, retain) IBOutlet UIDatePicker *Date_picker;

@property (nonatomic, retain) IBOutlet UIButton *Done_btn,*FromDate_btn,*ToDate_btn,

*DateFirst_btn,*DateSecond_btn,*DateThird_btn,*DateFourth_btn;

@property (nonatomic, retain) IBOutlet UITextField *FromDate_txt,*ToDate_txt,*Property_txt,

*Manager_txt;

@property (nonatomic, retain) IBOutlet UIScrollView *Scroll_view;

@property (nonatomic, retain) IBOutlet UILabel *DateFirst_lab,*DateSecond_lab,*DateThird_lab,*DateFourth_lab,*Note_lab;


@property (nonatomic, retain) IBOutlet UIButton *btn1,*btn2,*btn3,*btn4,*btn5,*btn6,*btn7,*btn8,*btn9,*btn10,*btn11,*btn12,*btn13,*btn14,*btn15,*btn16,*btn17,*btn18,*btn19,*btn20,*btn21,*btn22,*btn23,*btn24,*btn25,*btn26,*btn27,*btn28,*btn29,*btn30,*btn31,*btn32,*btn33,*btn34,*btn35,*btn36,*btn37,*btn38,*btn39,*btn40,*btn41,*btn42,*btn43,*btn44,*btn45,*btn46,*btn47,*btn48,*btn49,*btn50,*btn51,*btn52,*btn53,*btn54,*btn55,*btn56,*btn57,*btn58,*btn59,*btn60,*btn61,*btn62,*btn63,*btn64,*btn65,*btn66,*btn67,*btn68,*btn69,*btn70,*btn71,*btn72,*btn73,*btn74,*btn75,*btn76,*btn77,*btn78,*btn79,*btn80,*btn81,*btn82,*btn83,*btn84,*btn85,*btn86,*btn87,*btn88,*btn89,*btn90,*btn91,*btn92,*btn93,*btn94,*btn95,*btn96,*btn97,*btn98,*btn99,*btn100;

@property (nonatomic, retain) IBOutlet UIButton *btn101,*btn102,*btn103,*btn104,*btn105,*btn106,*btn107,*btn108,*btn109,*btn110,*btn111,*btn112,*btn113,*btn114,*btn115,*btn116,*btn117,*btn118,*btn119,*btn120,*btn121,*btn122,*btn123,*btn124,*btn125,*btn126,*btn127,*btn128,*btn129,*btn130,*btn131,*btn132,*btn133,*btn134,*btn135,*btn136,*btn137,*btn138,*btn139,*btn140,*btn141,*btn142,*btn143,*btn144,*btn145,*btn146,*btn147,*btn148,*btn149,*btn150,*btn151,*btn152,*btn153,*btn154,*btn155,*btn156,*btn157,*btn158,*btn159,*btn160,*btn161,*btn162,*btn163,*btn164,*btn165,*btn166,*btn167,*btn168,*btn169,*btn170,*btn171,*btn172,*btn173,*btn174,*btn175,*btn176,*btn177,*btn178,*btn179,*btn180,*btn181,*btn182,*btn183,*btn184,*btn185,*btn186,*btn187,*btn188,*btn189,*btn190,*btn191,*btn192;



-(IBAction)BtnClick:(id)sender;



@end
