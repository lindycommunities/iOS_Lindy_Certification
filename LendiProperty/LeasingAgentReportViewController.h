//
//  LeasingAgentReportViewController.h
//  LendiProperty
//
//  Created by Vinay D on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
#import "SBJSON.h"
#import "SpinnerModal_iPad.h"


@interface LeasingAgentReportViewController : UIViewController <NSURLConnectionDelegate>
{
    IBOutlet UIScrollView *Leasing_Scroll;
    IBOutlet UIImageView *Img_View01,*Img_View02,*Img_View03,*Img_View04,*Img_View05,*Img_View06,*Img_View07,*Img_View08,*Img_View09,*Img_View10,*Img_View11,*Img_View12,*Img_View13,*Img_View14,*Img_View15,*Img_View16,*Img_View17,*Img_View18,*Img_View19,*Img_View20,*Img_View21,*Img_View22,*Img_View23,*Img_View24,*Img_View25,*Img_View26,*Img_View27,*Img_View28,*Img_View29,*Img_View30,*Img_View31,*Img_View32,*Img_View33,*Img_View34,*Img_View35,*Img_View36,*Img_View37,*Img_View38,*Img_View39;
    
    ParserClass *Obj_parser;
    
    NSMutableData *webData;
    
    int Reportid;
    
    SpinnerModal_iPad *spinnerView;
    
    NSString *UserName;
    
}
- (id)initWithReportID:(int)_Rid WithUserName:(NSString *)_Username;

-(void)setData;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property(nonatomic,retain)  IBOutlet UIScrollView *Leasing_Scroll;

@property(nonatomic,retain) IBOutlet UIImageView *Img_View01,*Img_View02,*Img_View03,*Img_View04,*Img_View05,*Img_View06,*Img_View07,*Img_View08,*Img_View09,*Img_View10,*Img_View11,*Img_View12,*Img_View13,*Img_View14,*Img_View15,*Img_View16,*Img_View17,*Img_View18,*Img_View19,*Img_View20,*Img_View21,*Img_View22,*Img_View23,*Img_View24,*Img_View25,*Img_View26,*Img_View27,*Img_View28,*Img_View29,*Img_View30,*Img_View31,*Img_View32,*Img_View33,*Img_View34,*Img_View35,*Img_View36,*Img_View37,*Img_View38,*Img_View39;

@end
