//
//  WeeklyReportViewPart2Controller.h
//  LendiProperty
//
//  Created by Vinay D on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParserClass.h"

@interface WeeklyReportViewPart2Controller : UIViewController<NSURLConnectionDelegate>
{
    IBOutlet UIScrollView *Scroll_view;
    
    IBOutlet UITextField *A_txt,*B_txt,*C_txt,*D_txt,*E_txt,*F_txt,*G_txt,*H_txt,*I_txt,*J_txt,*K_txt;
    
    UIBarButtonItem *btnNext;
    ParserClass *objParser;
      
}
@property(nonatomic,retain)IBOutlet UIScrollView *Scroll_view;

@property(nonatomic,retain)IBOutlet UITextField *A_txt,*B_txt,*C_txt,*D_txt,*E_txt,*F_txt,*G_txt,*H_txt,*I_txt,*J_txt,*K_txt;

- (id)initWithParserObj:(ParserClass *)_objParser;

@end
