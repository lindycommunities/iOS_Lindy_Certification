//
//  ReportSelectionViewController.h
//  LendiProperty
//
//  Created by Vinay D on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpinnerModal_iPad.h"
#import "SBJSON.h"
#import "LeasingAgentReportViewController.h"
#import "DailyActivityCheklistReportViewController.h"
#import "SavedIRViewController.h"
#import "InclemnetWeatherViewReportController.h"
#import "WeeklyManagerReportController.h"
#import "ParserClass.h"
#import "SavedPMViewController.h"
#import "SavedApartmentInspectionReport.h"



@interface ReportSelectionViewController : UIViewController<NSURLConnectionDelegate,UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *Selection_tab;
    
    IBOutlet UILabel *HeaderLab;
    
    SpinnerModal_iPad *spinnerView;
    
    
    NSMutableArray *parserarray;
   
    NSMutableData *webData;
    
    NSMutableArray *nameArr;
    
    NSMutableArray *Username ;
    
    NSMutableArray *arrResult;
    
    
    
    BOOL dat;
    
    int tag,val,maxval,minval;
    
    
    
    
    
}
@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain)IBOutlet UITableView *Selection_tab;

@property(nonatomic,retain)IBOutlet UILabel *HeaderLab;

- (id)initWithTag:(int)_tag;

-(IBAction)NextbtnClick;

-(IBAction)BackbtnClick;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void)GetRowesWithUserCount:(int)_count;

-(void)GetDataWithMinval:(int)_mval WithMaxval:(int)_maxval;

@end
