//
//  LendiPropertyAppDelegate.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"
@interface LendiPropertyAppDelegate : UIResponder <UIApplicationDelegate>
{
    int lastRowID,maxid;
    
    NSString *strUserName;

    NSString *webURL,*notesdetails;
    
    NSString *strOriantation,*UserName,*CreaterDate,*orientatioChk,*strUserId,*strchckOrientation;
    
    UIImage *Camera_img,*temp_img;
    
    BOOL chekPhoto,chkorientation;
  
    int maxvalue,minvalue;

    
  //  NSInteger *;
    
}
@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) int lastRowID,maxid;

@property (nonatomic, retain) NSString *webURL;

@property (nonatomic, retain) NSString *strUserName,*notesdetails;

@property (nonatomic, retain) NSString *strOriantation,*UserName,*CreaterDate,*orientatioChk,*strUserId,*strchckOrientation;

@property (nonatomic,retain)  UIImage *Camera_img,*temp_img;

@property (nonatomic, assign) BOOL chekPhoto,chkorientation;

@property (nonatomic, assign) int maxvalue,minvalue;


//@property (nonatomic,assign)NSInteger *maxid;

@end
