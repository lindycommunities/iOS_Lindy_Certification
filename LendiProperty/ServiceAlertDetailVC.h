//
//  ServiceAlertDetailVC.h
//  LendiProperty
//
//  Created by ss pl on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpinnerModal_iPad.h"
#import "Spinner_iPad_Landscape.h"
#import "LendiPropertyAppDelegate.h"
@interface ServiceAlertDetailVC : UIViewController <UITableViewDataSource,UITabBarDelegate,NSXMLParserDelegate>
{
    IBOutlet UITableView *tblalertsdetails;
    
    NSMutableData *webData;
    
    NSMutableString *Obj_string,*LoginState,*messagestr;
    
    NSMutableArray *idArray,*useridArray,*messageArray,*DateArray;
    
    SpinnerModal_iPad *spinnerView;

    Spinner_iPad_Landscape *spinnerlandscape;
    
    BOOL landscapebool; 

    LendiPropertyAppDelegate *objApp;
}
@property (nonatomic, retain) IBOutlet UITableView *tblalertsdetails;

@property(nonatomic,retain)NSMutableString *Obj_string,*LoginState,*messagestr;

@property(nonatomic,retain) NSMutableArray *idArray,*useridArray,*messageArray,*DateArray;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property (nonatomic, retain)     Spinner_iPad_Landscape *spinnerlandscape;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinnerforlandscape;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;
@end
