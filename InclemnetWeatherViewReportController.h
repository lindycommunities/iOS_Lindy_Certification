//
//  InclemnetWeatherViewReportController.h
//  LendiProperty
//
//  Created by Vinay D on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "SpinnerModal_iPad.h"
#import "SBJSON.h"
@interface InclemnetWeatherViewReportController : UIViewController<NSURLConnectionDelegate>
{
     ParserClass *classObj;
    
    IBOutlet UITextField *Date_txt,*STime_txt,*EndTime_txt,*PropertyM_txt,*Contractor_txt,*MaintainacesS_txt,*Phone_txt,*SignDate_txt,*Employe_txt,*intial_txt,*sign_txt,*ActionTaken_txt;
    
    int Reportid;
    
    SpinnerModal_iPad *spinnerView;
    
    NSString *UserName;
    
    NSMutableData *webData;
   
    
}

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void)setData;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username;

-(IBAction)ViewPhoto;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain) IBOutlet UITextField *Date_txt,*STime_txt,*EndTime_txt,*PropertyM_txt,*Contractor_txt,*MaintainacesS_txt,*Phone_txt,*Phone1_txt,*Phone2_txt,*SignDate_txt,*Employe_txt,*intial_txt,*sign_txt,*ActionTaken_txt;
@end
