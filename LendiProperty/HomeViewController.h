//
//  HomeViewController.h
//  LendiProperty
//
//  Created by Vinay D on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LendiPropertyAppDelegate.h"
#import "NetworkConnection.h"
@interface HomeViewController : UIViewController
{
    IBOutlet UIButton *EmpLogin_btn,*Aboutus_btn,*Contactus_btn,*ApplyToday_btn,*LindyPass_btn,*SeniopLiv_btn,*CorpoHous_btn,*Studnthosin_btn;
    IBOutlet UIImageView *BackGroundImage;
    LendiPropertyAppDelegate *App_obj;
    NetworkConnection *Connection;
   
}
-(IBAction)EmpLoginbtn_click;
-(IBAction)WebviewClcik:(id)sender;
@property(nonatomic,retain) IBOutlet UIImageView *BackGroundImage;
@property(nonatomic,retain) IBOutlet UIButton *EmpLogin_btn,*Aboutus_btn,*Contactus_btn,*ApplyToday_btn,*LindyPass_btn,*SeniopLiv_btn,*CorpoHous_btn,*Studnthosin_btn;
@end
