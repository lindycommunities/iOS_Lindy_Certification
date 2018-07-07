//
//  WebviewDisplayController.h
//  LendiProperty
//
//  Created by Vinay D on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpinnerModal_iPad.h"
#import "Spinner_iPad_Landscape.h"

@interface WebviewDisplayController : UIViewController
{
    int btag;
    NSString *urlAddress,*urlAddress_URL;
    
    NSURL *url;
    NSURLRequest *requestObj;
    IBOutlet UIWebView *webview;
    SpinnerModal_iPad *spinnerView;
    Spinner_iPad_Landscape *spinnerlandscape;
    
   
}
@property(nonatomic,retain)IBOutlet UIWebView *webview;
@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;
@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;
@property (nonatomic, retain) NSString *urlAddress_URL;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinner;
-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;
-(void) stopSpinnerforlandscape;
-(void)LinkSelection;
- (id)initWithButtonTag:(int)_tag WithTitle:(NSString *)_str;
- (id)initWithURL:(NSString *)_url;

@end
