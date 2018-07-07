//
//  SavedIRViewController.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "InclementWeatherReportPhotoViewController.h"
#import "SpinnerModal_iPad.h"
#import "SBJSON.h"

@interface SavedIRViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate,NSURLConnectionDelegate>
{
    ParserClass *classObj;
    
    IBOutlet UITextField *txtResidentName,*txtAPT,*txtPhone,*txtPreparedBy,*txtWitness,*txtAddress,*txtPhone1,*txtPhone2,*txtPhone3,*txtPhone4,*txtPhone5;
    
    IBOutlet UITextView *txtViewDesc;
    
    IBOutlet UIScrollView *scrView;
    
    IBOutlet UILabel *Propertylabel;
    
    int Reportid;
    
    SpinnerModal_iPad *spinnerView;
    
    NSString *UserName;
     
    LendiPropertyAppDelegate *app;
    
    NSMutableData *webData;

}
@property (nonatomic, retain) IBOutlet UITextField *txtResidentName,*txtAPT,*txtPhone,*txtPreparedBy,*txtWitness,*txtAddress,*txtPhone1,*txtPhone2,*txtPhone3,*txtPhone4,*txtPhone5;

@property (nonatomic, retain) IBOutlet UITextView *txtViewDesc;

@property (nonatomic, retain) IBOutlet UIScrollView *scrView;

@property (nonatomic, retain) IBOutlet UILabel *Propertylabel;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

-(void) setFrame;

-(IBAction)ViewImages;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void)setData;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username;


@end
