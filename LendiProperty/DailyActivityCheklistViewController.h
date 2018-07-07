//
//  DailyActivityCheklistViewController.h
//  LendiProperty
//
//  Created by Vinay D on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "SpinnerModal_iPad.h"
#import "SBJSON.h"
@interface DailyActivityCheklistViewController : UIViewController <NSURLConnectionDelegate>
{ 
    IBOutlet UIScrollView *Leasing_Scroll;
    
    IBOutlet UIImageView *Img_View01,*Img_View02,*Img_View03,*Img_View04,*Img_View05,*Img_View06,*Img_View07,*Img_View08,*Img_View09,*Img_View10,*Img_View11,*Img_View12,*Img_View13,*Img_View14,*Img_View15,*Img_View16,*Img_View17,*Img_View18,*Img_View19,*Img_View20,*Img_View21,*Img_View22,*Img_View23,*Img_View24,*Img_View25;
    
    
    bool chkBox1,chkBox2,chkBox3,chkBox4,chkBox5,chkBox6,chkBox7,chkBox8,chkBox9,chkBox10,chkBox11,chkBox12,chkBox13,chkBox14,chkBox15,chkBox16,chkBox17,chkBox18,chkBox19,chkBox20,chkBox21,chkBox22,chkBox23,chkBox24,chkBox25,chkBox26,chkBox27,chkBox28,chkBox29,chkBox30,chkBox31,chkBox32,chkBox33,chkBox34,chkBox35,chkBox36,chkBox37,chkBox38,chkBox39,messagechek,propertycheck,isPropertyChanged;
    
    UIBarButtonItem *Save_btn, *barButton;
    
    IBOutlet UILabel *checklistLabel,*Maintain_lab;
    
    IBOutlet UILabel *lab_01,*lab_02,*lab_03,*lab_04,*lab_05,*lab_06,*lab_07,*lab_08,*lab_09,*lab_10,*lab_11,*lab_12,*lab_13,*lab_14,*lab_15,*lab_16,*lab_17,*lab_18,*lab_19,*lab_20,*lab_21,*lab_22,*lab_23,*lab_24,*lab_25;
    
    IBOutlet UIPickerView *Propertypicker;
    
    IBOutlet UIView *pickerview;
         
    NSMutableData *messagedata,*webData;
    
    NSMutableArray *PikerArray,*propertyid;
    
    ParserClass *Obj_parse;
    
    SpinnerModal_iPad *spinnerView;
    
   
    
   
    
}
- (IBAction)chkbtnclick:(id)sender;

- (IBAction)PropertyDoneclcik;

- (void)postmessage;

- (void)disabeleview;

- (void)enableview;

- (void)LoadUserProperty;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

- (void) stopSpinner;

@property(nonatomic,retain) IBOutlet UIScrollView *Leasing_Scroll;

@property(nonatomic,retain) IBOutlet UILabel *checklistLabel,*Maintain_lab;

@property(nonatomic,retain) IBOutlet UILabel *lab_01,*lab_02,*lab_03,*lab_04,*lab_05,*lab_06,*lab_07,*lab_08,*lab_09,*lab_10,*lab_11,*lab_12,*lab_13,*lab_14,*lab_15,*lab_16,*lab_17,*lab_18,*lab_19,*lab_20,*lab_21,*lab_22,*lab_23,*lab_24,*lab_25;

@property(nonatomic,retain) IBOutlet UIImageView *Img_View01,*Img_View02,*Img_View03,*Img_View04,*Img_View05,*Img_View06,*Img_View07,*Img_View08,*Img_View09,*Img_View10,*Img_View11,*Img_View12,*Img_View13,*Img_View14,*Img_View15,*Img_View16,*Img_View17,*Img_View18,*Img_View19,*Img_View20,*Img_View21,*Img_View22,*Img_View23,*Img_View24,*Img_View25;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property (nonatomic, retain) IBOutlet UIPickerView *Propertypicker;

@property (nonatomic, retain) IBOutlet UIView *pickerview;

@end
