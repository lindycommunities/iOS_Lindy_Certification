//
//  InclementWeatherReportPhotoViewController.h
//  LendiProperty
//
//  Created by Vinay D on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "ImageScrrenViewController.h"
#import "SBJSON.h"
#import "SpinnerModal_iPad.h"


@interface InclementWeatherReportPhotoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate>
{
    
    IBOutlet UITableView *PhotoView_tab;
      
    ParserClass *classObj;
   
    NSMutableArray *ImageDisplay,*TempImage_array,*ImageName_array;
    
    NSString *dataPath,*ReportType;
    
    int Reportid;
    
    NSMutableData *webData;
    
    SpinnerModal_iPad *spinnerView;
    
}
- (id)initWithParserObj:(ParserClass *)_objParser WithReportId:(int)R_id WithRporttype:(NSString *)_Rtype;

-(void) stopSpinner;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;


@property(nonatomic,retain)IBOutlet UITableView *PhotoView_tab;

@end
