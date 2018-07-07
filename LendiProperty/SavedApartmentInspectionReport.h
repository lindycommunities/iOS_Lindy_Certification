//
//  SavedApartmentInspectionReport.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "SBJSON.h"
#import "SpinnerModal_iPad.h"
#import "InclementWeatherReportPhotoViewController.h"

@interface SavedApartmentInspectionReport : UIViewController <NSURLConnectionDelegate>{
    
    ParserClass *Obj_parser;
    
    NSMutableData *webData;
    
    NSMutableArray *DamageTypeSelectedArray,*DamageCostSelectedArray;
    
    NSString *Reportidstr;
    
    int Reportid;
    
    SpinnerModal_iPad *spinnerView;
    
    BOOL getthealldetails,getthedamagedetails;
    
    NSString *UserName;
    
}



- (id) initWithReportID:(int)_Rid WithUserName:(NSString *)_Username;

- (void) setData;

- (void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

- (void) stopSpinner;

- (IBAction) ViewPhoto;

- (void)SetTheDamageInsepaction;

@property (nonatomic, retain)IBOutlet UITableView *DamageDescriptionTable;

@property (nonatomic, retain)IBOutlet UILabel *lblBuilding,*roomtypelbl,*lblTotal;

@property (nonatomic, retain) IBOutlet UITextField *residentnametext,*unitnotext;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property (nonatomic,retain) IBOutlet UITextView *Desptext;


@end
