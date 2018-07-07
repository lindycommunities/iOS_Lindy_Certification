//
//  SavedPMViewController.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "LendiPropertyAppDelegate.h"
#import "SpinnerModal_iPad.h"
@interface SavedPMViewController : UIViewController<NSURLConnectionDelegate>
{
    IBOutlet UIScrollView *scrView;
    
    IBOutlet UIImageView *imgView0,*imgView1,*imgView2,*imgView3,*imgView4,*imgView5,*imgView6,*imgView7,*imgView8,*imgView9,*imgView10,*imgView11,*imgView12,*imgView13,*imgView14,*imgView15,*imgView16,*imgView17,*imgView18,*imgView19,*imgView20,*imgView21,*imgView22;
    
    IBOutlet UILabel *Username_lab,*Date_lab;
    
    bool chkBox1,chkBox2,chkBox3,chkBox4,chkBox5,chkBox6,chkBox7,chkBox8,chkBox9,chkBox10,chkBox11,chkBox12,chkBox13,chkBox14,chkBox15,chkBox16,chkBox17,chkBox18,chkBox19,chkBox20,chkBox21,chkBox22,chkBox23;

    ParserClass *classObj;
    
    LendiPropertyAppDelegate *app;
    
    NSMutableData *webData;
    
    int Reportid;
    
    SpinnerModal_iPad *spinnerView;
       
    NSString *UserName;
}
@property (nonatomic, retain) IBOutlet UIScrollView *scrView;

@property (nonatomic, retain) IBOutlet UIImageView *imgView0,*imgView1,*imgView2,*imgView3,*imgView4,*imgView5,*imgView6,*imgView7,*imgView8,*imgView9,*imgView10,*imgView11,*imgView12,*imgView13,*imgView14,*imgView15,*imgView16,*imgView17,*imgView18,*imgView19,*imgView20,*imgView21,*imgView22;

@property (nonatomic, retain)  IBOutlet UILabel *Username_lab,*Date_lab;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username;

@end
