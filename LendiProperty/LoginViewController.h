//
//  LoginViewController.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpinnerModal_iPad.h"
#import "Spinner_iPad_Landscape.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate,NSURLConnectionDelegate>
{
    IBOutlet UITextField *txtUserName,*txtPassword;
    
    SpinnerModal_iPad *spinnerView;
    
    Spinner_iPad_Landscape *spinnerlandscape;
    
    NSMutableData *webData;
    
    IBOutlet UIImageView *imgView;
    
    IBOutlet UIScrollView *scrView;
    
    IBOutlet UIButton *btnLogin,*btnCancel;
    
    BOOL keyboardVisible,Landscapebool,spinnerisruning;
    
    NSUserDefaults *defaults_user;
    
    NSUserDefaults *defaults_pass;
    NSString *_flag;
    
}
@property (nonatomic, retain) IBOutlet UITextField *txtUserName,*txtPassword;

@property (nonatomic, retain) SpinnerModal_iPad *spinnerView;

@property (nonatomic, retain) Spinner_iPad_Landscape *spinnerlandscape;


@property (nonatomic, retain) IBOutlet UIImageView *imgView;

@property (nonatomic, retain) IBOutlet UIScrollView *scrView;

@property (nonatomic, retain) IBOutlet UIButton *btnLogin,*btnCancel;
-(IBAction)login:(id)sender;

-(IBAction)cancel:(id)sender;

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinner;

-(void) rotatingPotrait;

-(void) rotatingLandscape;

-(void) startSpinnerforlandscape:(NSString*)type andDisplay:(NSString*)display;

-(void) stopSpinnerforlandscape;

-(void)RememeberMe;
@end
