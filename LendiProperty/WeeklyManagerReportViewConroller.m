//
//  WeeklyManagerReportViewConroller.m
//  LendiProperty
//
//  Created by Vinay D on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WeeklyManagerReportViewConroller.h"



@implementation WeeklyManagerReportViewConroller
 
@synthesize Date_view;

@synthesize Date_picker;

@synthesize Done_btn,FromDate_btn,ToDate_btn,DateFirst_btn,DateSecond_btn,DateThird_btn,

DateFourth_btn;

@synthesize FromDate_txt,ToDate_txt,Property_txt,Manager_txt;

@synthesize Scroll_view;

@synthesize DateFirst_lab,DateSecond_lab,DateThird_lab,DateFourth_lab,Note_lab;

@synthesize btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9,btn10,btn11,btn12,btn13,btn14,btn15,btn16,btn17,btn18,btn19,btn20,btn21,btn22,btn23,btn24,btn25,btn26,btn27,btn28,btn29,btn30,btn31,btn32,btn33,btn34,btn35,btn36,btn37,btn38,btn39,btn40,btn41,btn42,btn43,btn44,btn45,btn46,btn47,btn48,btn49,btn50,btn51,btn52,btn53,btn54,btn55,btn56,btn57,btn58,btn59,btn60,btn61,btn62,btn63,btn64,btn65,btn66,btn67,btn68,btn69,btn70,btn71,btn72,btn73,btn74,btn75,btn76,btn77,btn78,btn79,btn80,btn81,btn82,btn83,btn84,btn85,btn86,btn87,btn88,btn89,btn90,btn91,btn92,btn93,btn94,btn95,btn96,btn97,btn98,btn99,btn100;


@synthesize btn101,btn102,btn103,btn104,btn105,btn106,btn107,btn108,btn109,btn110,btn111,btn112,btn113,btn114,btn115,btn116,btn117,btn118,btn119,btn120,btn121,btn122,btn123,btn124,btn125,btn126,btn127,btn128,btn129,btn130,btn131,btn132,btn133,btn134,btn135,btn136,btn137,btn138,btn139,btn140,btn141,btn142,btn143,btn144,btn145,btn146,btn147,btn148,btn149,btn150,btn151,btn152,btn153,btn154,btn155,btn156,btn157,btn158,btn159,btn160,btn161,btn162,btn163,btn164,btn165,btn166,btn167,btn168,btn169,btn170,btn171,btn172,btn173,btn174,btn175,btn176,btn177,btn178,btn179,btn180,btn181,btn182,btn183,btn184,btn185,btn186,btn187,btn188,btn189,btn190,btn191,btn192;

@synthesize spinnerView;

@synthesize Propertypicker;

@synthesize pickerview;



- (id)init
{
    self = [super init];
    if (self) {
        
        objParser=[[ParserClass alloc]init];
        self.title=@"Weekly Manager Checklist";
         
        // Custom initialization
    }
    return self;
}

#pragma mark - App Methods

-(IBAction)DateCollection:(id)sender
{
    UIButton *temp_btn=(id)sender;
    
    switch (temp_btn.tag)
    {
        case 1:
            
            if(chkLabel==YES)
            {
                DateFirst_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateSecond_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateThird_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateFourth_lab.layer.borderColor = [UIColor blackColor].CGColor;
                Note_lab.textColor=[UIColor blackColor];
                chkLabel=NO;
            }
            ToDate_btn.enabled=NO;
            FromDate_btn.enabled=NO;
            DateFirst_btn.enabled=NO;
            DateSecond_btn.enabled=NO;
            DateThird_btn.enabled=NO;
            DateFourth_btn.enabled=NO;
            Chekdate=@"First";
             break;
        case 2:
            
            if(chkLabel==YES)
            {
                Note_lab.textColor=[UIColor blackColor];
                DateFirst_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateSecond_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateThird_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateFourth_lab.layer.borderColor = [UIColor blackColor].CGColor;
                 chkLabel=NO;
            }

            ToDate_btn.enabled=NO;
            FromDate_btn.enabled=NO;
            DateFirst_btn.enabled=NO;
            DateSecond_btn.enabled=NO;
            DateThird_btn.enabled=NO;
            DateFourth_btn.enabled=NO;
            Chekdate=@"Second";
            break;
        case 3:
            
            if(chkLabel==YES)
            {
                 Note_lab.textColor=[UIColor blackColor];
                DateFirst_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateSecond_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateThird_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateFourth_lab.layer.borderColor = [UIColor blackColor].CGColor;
               
                chkLabel=NO;
            }

            ToDate_btn.enabled=NO;
            FromDate_btn.enabled=NO;
            DateFirst_btn.enabled=NO;
            DateSecond_btn.enabled=NO;
            DateThird_btn.enabled=NO;
            DateFourth_btn.enabled=NO;
            Chekdate=@"Third";
            break;
        case 4:
            if(chkLabel==YES)
            {
                Note_lab.textColor=[UIColor blackColor];
                DateFirst_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateSecond_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateThird_lab.layer.borderColor = [UIColor blackColor].CGColor;
                DateFourth_lab.layer.borderColor = [UIColor blackColor].CGColor;
                chkLabel=NO;
            }

            ToDate_btn.enabled=NO;
            FromDate_btn.enabled=NO;
            DateFirst_btn.enabled=NO;
            DateSecond_btn.enabled=NO;
            DateThird_btn.enabled=NO;
            DateFourth_btn.enabled=NO;
            Chekdate=@"Fourth";
            break;
        default:
            break;
            
                        
    }
    
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = Date_view.center;
                         point.y = point.y - 600;
                         Date_view.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                     }];    
    
    [self.view bringSubviewToFront:Date_view];

}


-(void)FromDate
{
    ToDate_btn.enabled=NO;
    FromDate_btn.enabled=NO;
    DateFirst_btn.enabled=NO;
    DateSecond_btn.enabled=NO;
    DateThird_btn.enabled=NO;
    DateFourth_btn.enabled=NO;
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = Date_view.center;
                         point.y = point.y - 600;
                         Date_view.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                     }];    
    
    
    [self.view bringSubviewToFront:Date_view];
    Chekdate=@"FromDate";
    

    
}
-(void)ToDate
{
    ToDate_btn.enabled=NO;
    FromDate_btn.enabled=NO;
    DateFirst_btn.enabled=NO;
    DateSecond_btn.enabled=NO;
    DateThird_btn.enabled=NO;
    DateFourth_btn.enabled=NO;
    Chekdate=@"ToDate";
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = Date_view.center;
                         point.y = point.y - 600;
                         Date_view.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                     }];    
    
    
    [self.view bringSubviewToFront:Date_view];
}

-(void)DonebtnClick
{
    
   
    
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = Date_view.center;
                         point.y = point.y + 600;
                         Date_view.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                     }];    
    
    
    [self.view bringSubviewToFront:Date_view];
   
   
   
    
    if ([Chekdate isEqualToString:@"FromDate"])
    {
        ToDate_btn.enabled=YES;
        FromDate_btn.enabled=YES;
        DateFirst_btn.enabled=YES;
        DateSecond_btn.enabled=YES;
        DateThird_btn.enabled=YES;
        DateFourth_btn.enabled=YES;
        NSDate *date=Date_picker.date;
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd-yyyy"];
        NSString *str=[formatter stringFromDate:date];
        FromDate_txt.text=str;
          [formatter release];
        Chekdate=@"";
        
        
    }
    else if([Chekdate isEqualToString:@"ToDate"])
    {
        ToDate_btn.enabled=YES;
        FromDate_btn.enabled=YES;
        DateFirst_btn.enabled=YES;
        DateSecond_btn.enabled=YES;
        DateThird_btn.enabled=YES;
        DateFourth_btn.enabled=YES;
        NSDate *date=Date_picker.date;
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd-yyyy"];
        NSString *str=[formatter stringFromDate:date];
        ToDate_txt.text=str;
         Chekdate=@"";
    }
    else if([Chekdate isEqualToString:@"First"])
    {
        ToDate_btn.enabled=YES;
        FromDate_btn.enabled=YES;
        DateFirst_btn.enabled=YES;
        DateSecond_btn.enabled=YES;
        DateThird_btn.enabled=YES;
        DateFourth_btn.enabled=YES;
        NSDate *date=Date_picker.date;
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd"];
        NSString *str=[formatter stringFromDate:date];
        DateFirst_lab.text=str;
        [formatter release];

    }
    else if([Chekdate isEqualToString:@"Second"])
    {
        ToDate_btn.enabled=YES;
        FromDate_btn.enabled=YES;
        DateFirst_btn.enabled=YES;
        DateSecond_btn.enabled=YES;
        DateThird_btn.enabled=YES;
        DateFourth_btn.enabled=YES;
        NSDate *date=Date_picker.date;
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd"];
        NSString *str=[formatter stringFromDate:date];
        DateSecond_lab.text=str;
          [formatter release];

    }
    else if([Chekdate isEqualToString:@"Third"])
    {
        ToDate_btn.enabled=YES;
        FromDate_btn.enabled=YES;
        DateFirst_btn.enabled=YES;
        DateSecond_btn.enabled=YES;
        DateThird_btn.enabled=YES;
        DateFourth_btn.enabled=YES;
        NSDate *date=Date_picker.date;
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd"];
        NSString *str=[formatter stringFromDate:date];
        DateThird_lab.text=str;
          [formatter release];
        
    }
    else if([Chekdate isEqualToString:@"Fourth"])
    {
        ToDate_btn.enabled=YES;
        FromDate_btn.enabled=YES;
        DateFirst_btn.enabled=YES;
        DateSecond_btn.enabled=YES;
        DateThird_btn.enabled=YES;
        DateFourth_btn.enabled=YES;
        NSDate *date=Date_picker.date;
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"MM-dd"];
        NSString *str=[formatter stringFromDate:date];
        DateFourth_lab.text=str;
          [formatter release];
    }
    
}
//
-(void)BtnClick:(id)sender
{
    
    UIButton *tempbtn=(id)sender;
    
       
    
    switch (tempbtn.tag)
    {
        case 1:
            if (chkBox1 == NO)
            {
                [btn1 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox1=YES;
                objParser.column1=1;
            }
            else
            {
                [btn1 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox1=NO;
                objParser.column1=0;
            }
            break;
        case 2:
            if (chkBox2 == NO)
            {
                [btn2 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox2 = YES;       
                objParser.column2=1;
                
            }
            else
            {
                [btn2 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox2 = NO;
                objParser.column2=0;
            }
            break;
        case 3:
            if (chkBox3 == NO)
            {
                [btn3 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox3 = YES;
                
                objParser.column3=1;
            }
            else
            {
                [btn3 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox3 = NO;
                objParser.column3=0;

            }
            break;
        case 4:
            if (chkBox4 == NO)
            {
                [btn4 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox4 =YES;
                objParser.column4=1;
                
            }
            else
            {
                [btn4 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox4 = NO;
                objParser.column4=0;
            }
            break;
        case 5:
            if (chkBox5 == NO)
            {
                [btn5 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox5 =YES;
                objParser.column5=1;
                
            }
            else
            {
                [btn5 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox5 = NO;
                objParser.column5=0;
            }
            
            break;
        case 6:
            if (chkBox6 == NO)
            {
                [btn6 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox6=YES;
                objParser.column6=1;

            }
            else
            {
                [btn6 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox6=NO;
                objParser.column6=0;
                
            }
            break;
        case 7:
            if (chkBox7 == NO)
            {
                [btn7 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox7=YES;
                objParser.column7=1;
            }
            else
            {
                [btn7 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox7=NO;
                objParser.column7=0;
            }
            break;
        case 8:
            if (chkBox8 == NO)
            {
                [btn8 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox8=YES;
                objParser.column8=1;
                
            }
            else
            {
                [btn8 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox8=NO;
                objParser.column8=0;
            }
            break;
        case 9:
            if (chkBox9 == NO)
            {
                [btn9 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox9=YES;
                objParser.column9=1;
            }
            else
            {
                [btn9 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox9=NO;
                objParser.column9=0;
            }
            break;
        case 10:
            if (chkBox10 == NO)
            {
                [btn10 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox10=YES;
                objParser.column10=1;
                
            }
            else
            {
                [btn10 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox10=NO;
                objParser.column10=0;
            }
            break;
        case 11:
            if (chkBox11 == NO)
            {
                [btn11 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox11=YES;
                objParser.column11=1;
            }
            else
            {
                [btn11 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox11=NO;
                objParser.column11=0;

                
            }
            break;
        case 12:
            if (chkBox12 == NO)
            {
                [btn12 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox12=YES;
                objParser.column12=1;
            }
            else
            {
                [btn12 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox12=NO;
                objParser.column12=0;

            }
            break;
        case 13:
            if (chkBox13 == NO)
            {
                [btn13 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox13=YES;
                objParser.column13=1;
            }
            else
            {
                [btn13 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox13=NO;
                objParser.column13=0;
                
            }
            break;
        case 14:
            if (chkBox14 == NO)
            {
                [btn14 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox14=YES;
                objParser.column14=1;
            }
            else
            {
                [btn14 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox14=NO;
                objParser.column14=0;
            }
            break;
        case 15:
            if (chkBox15 == NO)
            {
                [btn15 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox15=YES;
                objParser.column15=1;
            }
            else
            {
                [btn15 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox15=NO;
                objParser.column15=0;
            }
            break;
        case 16:
            if (chkBox16 == NO)
            {
                [btn16 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox16=YES;
                objParser.column16=1;
            }
            else
            {
            [btn16 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox16=NO;
                objParser.column16=0;
            }
        break;
        case 17:
            if (chkBox17 == NO)
            {
                [btn17 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                
                chkBox17=YES;
                objParser.column17=1;
            }
            else
            {
                [btn17 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox17=NO;
                objParser.column17=0;
                
            }
            break;
        case 18:
            if (chkBox18 == NO)
            {
                [btn18 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox18=YES;
                objParser.column18=1;
            }
            else
            {
                [btn18 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox18=NO;
                objParser.column18=0;
            }
            break;
        case 19:
            if (chkBox19 == NO)
            {
                
                [btn19 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox19=YES;
                objParser.column19=1;
            }
            
            else
            {
                [btn19 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox19=NO;
                objParser.column19=0;
               
            }
            break;
        case 20:
            if (chkBox20 == NO)
            {
                [btn20 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox20=YES;
                objParser.column20=1;
            }
            else
            {
                [btn20 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox20=NO;
                objParser.column20=0;
            }
            break;
        case 21:
            if (chkBox21 == NO)
            {
                [btn21 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox21=YES;
                objParser.column21=1;
            }
            else
            {
                [btn21 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox21=NO;
                objParser.column21=0;
            }
            break;
        case 22:
            if (chkBox22 == NO)
            {
                [btn22 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox22=YES;
                objParser.column22=1;
            }
            else
            {
                [btn22 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox22=NO;
                objParser.column22=0;
            }
            break;
        case 23:
            if (chkBox23 == NO)
            {
                [btn23 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox23=YES;
                objParser.column23=1;
            }
            else
            {
                [btn23 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox23=NO;
                objParser.column23=0;
            }
            break;
        case 24:
            if (chkBox24 == NO)
            {
                [btn24 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox24=YES;
                objParser.column24=1;
            }
            else
            {
                [btn24 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox24=NO;
                objParser.column24=0;
            }
            break;
        case 25:
            if (chkBox25 == NO)
            {
                [btn25 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox25=YES;
                objParser.column25=1;
            }
            
            else
            {
                 [btn25 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox25=NO;
                objParser.column25=0;
            }
            break;
        case 26:
            if (chkBox26 == NO)
            {
                
                chkBox26=YES;
                [btn26 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                objParser.column26=1;
                
            }
            else
            {
                [btn26 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox26=NO;
                objParser.column26=0;
            }
            break;
        case 27:
            if (chkBox27 == NO)
            {
                [btn27 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox27=YES;
                objParser.column27=1;
            }
            else
            {
                [btn27 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox27=NO;
                objParser.column27=0;
            }
            break;
        case 28:
            if (chkBox28 == NO)
            {
                [btn28 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox28=YES;
                objParser.column28=1;
            }
            else
            {
                [btn28 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox28=NO;
                objParser.column28=0;
            }
            
            break;

            
             break;
        case 29:
            if (chkBox29 == NO)
            {
                [btn29 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox29=YES;
                objParser.column29=1;
            }
            
            else
            {
                [btn29 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox29=NO;
                objParser.column29=0;
            }
            break;
        case 30:
            if (chkBox30 == NO)
            {
                [btn30 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox30=YES;
                objParser.column30=1;
            }
            else
            {
                [btn30 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox30=NO;
                objParser.column30=0;
            }
            break;
        case 31:
            if (chkBox31 == NO)
            {
                [btn31 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox31=YES;
                objParser.column31=1;
            }
            else
            {
                [btn31 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox31=NO;
                objParser.column31=0;
            }
            break;
        case 32:
            if (chkBox32 == NO)
            {
                chkBox32=YES;
                [btn32 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                objParser.column32=1;
            }
            else
            {
                [btn32 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox32=NO;
                objParser.column32=0;
            }
            break;
        case 33:
            if (chkBox33 == NO)
            {
                 [btn33 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox33=YES;
                objParser.column33=1;
            }
            else
            {
                 [btn33 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox33=NO;
                objParser.column33=0;
            }
            break;
        case 34:
            if (chkBox34 == NO)
            {
                 [btn34 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox34=YES;
                objParser.column34=1;
            }
            
            else
            {
                 [btn34 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox34=NO;
                objParser.column34=0;
            }
            break;
        case 35:
            if (chkBox35 == NO)
            {
                 [btn35 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox35=YES;
                objParser.column35=1;
            }
            else
            {
                 [btn35 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox35=NO;
                objParser.column35=0;
            }
            break;
        case 36:
            if (chkBox36 == NO)
            {
                 [btn36 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox36=YES;
                objParser.column36=1;
            }
            else
            {
                 [btn36 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox36=NO;
                objParser.column36=0;
            }
            
            break;
        case 37:
            if (chkBox37 == NO)
            {
                 [btn37 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox37=YES;
                objParser.column37=1;
            }
            else
            {
                 [btn37 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox37=NO;
                objParser.column37=0;
            }
            break;
        case 38:
            if (chkBox38 == NO)
            {
                 [btn38 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox38=YES;
                objParser.column38=1;
            }
            else
            {
                 [btn38 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox38=NO;
                objParser.column38=0;
            }
            break;
        case 39:
            if (chkBox39== NO)
            {
                 [btn39 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox39=YES;
                objParser.column39=1;
            }
            else
            {
                 [btn39 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox39=NO;
                objParser.column39=0;
            }
            break;
        case 40:
            if (chkBox40 == NO)
            {
                 [btn40 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox40=YES;
                objParser.column40=1;
            }
            else
            {
                [btn40 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox40=NO;
                objParser.column41=0;
            }
            break;
        case 41:
            if (chkBox41 == NO)
            {
                [btn41 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox41=YES;
                objParser.column41=1;
            }
            else
            {
                [btn41 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox41=NO;
                objParser.column41=0;
            }
            break;
        case 42:
            if (chkBox42 == NO)
            {
                [btn42 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox42=YES;
                objParser.column42=1;
            }
            else
            {
                [btn42 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox42=NO;
                objParser.column42=0;
            }
            break;
        case 43:
            if (chkBox43 == NO)
            {
                [btn43 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox43=YES;
                objParser.column43=1;
            }
            else
            {
                [btn43 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox43=NO;
                objParser.column43=0;
            }
            break;
        case 44:
            if (chkBox44 == NO)
            {
                [btn44 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox44=YES;
                objParser.column44=1;
            }
            else
            {
                [btn44 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox44=NO;
                objParser.column44=0;
            }
            break;
        case 45:
            if (chkBox45 == NO)
            {
                [btn45 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox45=YES;
                objParser.column45=1;
            }
            else
            {
                [btn45 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox45=NO;
                objParser.column45=0;
            }
            break;
        case 46:
            if (chkBox46 == NO)
            {
                [btn46 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox46=YES;
                objParser.column46=1;
            }
            else
            {
                [btn46 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox46=NO;
                objParser.column46=0;
            }
            break;
        case 47:
            if (chkBox47 == NO)
            {
                [btn47 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox47=YES;
                objParser.column47=1;
            }
            else
            {
                [btn47 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox47=NO;
                objParser.column47=0;
            }
            break;
        case 48:
            if (chkBox48 == NO)
            {
                [btn48 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox48=YES;
                objParser.column48=1;
            }
            else
            {
                [btn48 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox48=NO;
                objParser.column48=0;
            }
            break;
        case 49:
            if (chkBox49 == NO)
            {
                [btn49 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox49=YES;
                objParser.column48=1;
            }
            else
            {
                [btn49 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox49=NO;
                objParser.column48=0;
            }
            break;
        case 50:
            if (chkBox50 == NO)
            {
                [btn50 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox50=YES;
                objParser.column50=1;
            }
            else
            {
                [btn50 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox50=NO;
                objParser.column50=0;
            }
            break;
        case 51:
            if (chkBox51 == NO)
            {
                [btn51 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox51=YES;
                objParser.column51=1;
            }
            else
            {
                [btn51 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox51=NO;
                objParser.column52=0;
            }
            break;
        case 52:
            if (chkBox52 == NO)
            {
                [btn52 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox52=YES;
                objParser.column51=1;
            }
            else
            {
                [btn52 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox52=NO;
                objParser.column52=0;
            }
            
            break;
        case 53:
            if (chkBox53 == NO)
            {
                [btn53 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox53=YES;
                objParser.column53=1;
            }
            
            else
            {
                [btn53 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox53=NO;
                objParser.column53=0;
            }
            break;
        case 54:
            if (chkBox54 == NO)
            {
                [btn54 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox54=YES;
                objParser.column54=1;
            }
            else
            {
                [btn54 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox55=NO;
                objParser.column54=0;
            }
            break;
        case 55:
            if (chkBox55 == NO)
            {
                [btn55 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox55=YES;
                objParser.column55=1;
            }
            else
            {
                [btn55 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox55=NO;
                objParser.column55=0;
            }
            break;
        case 56:
            if (chkBox56 == NO)
            {
                [btn56 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox56=YES;
                objParser.column56=1;
            }
            else
            {
                [btn56 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox56=NO;
                objParser.column56=0;
            }
            break;
        case 57:
            if (chkBox57 == NO)
            {
                [btn57 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox57=YES;
                objParser.column57=1;
            }
            else
            {
                [btn57 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox57=NO;
                objParser.column57=0;
            }
            break;
        case 58:
            if (chkBox58 == NO)
            {
                [btn58 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox58=YES;
                objParser.column58=1;
            }
            else
            {
                [btn58 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox58=NO;
                 objParser.column58=0;
            }
            break;
        case 59:
            if (chkBox59 == NO)
            {
                [btn59 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox59=YES;
                objParser.column59=1;
            }
            
            else
            {
                [btn59 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox59=NO;
                objParser.column59=0;
            }
            break;
        case 60:
            if (chkBox60 == NO)
            {
                [btn60 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox60=YES;
                objParser.column60=1;
            }
            else
            {
                [btn60 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox60=NO;
                objParser.column60=0;
            }
            break;
        case 61:
            if (chkBox61 == NO)
            {
                [btn61 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox61=YES;
                objParser.column61=1;
            }
            else
            {
                 [btn61 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox61=NO;
                objParser.column61=0;
            }
            break;
        case 62:
            if (chkBox62 == NO)
            {
                [btn62 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox62=YES;
                objParser.column62=1;
            }
            else
            {
                [btn62 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox62=NO;
                objParser.column62=0;
            }
            break;
        case 63:
            if (chkBox63 == NO)
            {
                [btn63 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox63=YES;
                objParser.column63=1;
            }
            else
            {
                [btn63 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox63=NO;
                objParser.column63=0;
            }
            break;
        case 64:
            if (chkBox64 == NO)
            {
                [btn64 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox64=YES;
                objParser.column64=1;
            }
            else
            {
                [btn64 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox64=NO;
                objParser.column64=0;
            }
            break;
        case 65:
            if (chkBox65 == NO)
            {
                [btn65 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox65=YES;
                objParser.column65=1;
            }
            else
            {
                [btn65 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox65=NO;
                objParser.column65=0;
            }
            break;
        case 66:
            if (chkBox66 == NO)
            {
                [btn66 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox66=YES;
                objParser.column66=1;
            }
            else
            {
                [btn66 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox67=NO;
                objParser.column66=0;
            }
            break;
        case 67:
            if (chkBox67 == NO)
            {
                [btn67 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox67=YES;
                objParser.column67=1;
            }
            else
            {
                [btn67 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox67=NO;
                objParser.column67=0;
            }
            break;
        case 68:
            if (chkBox68 == NO)
            {
                [btn68 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox68=YES;
                objParser.column68=1;
            }
            else
            {
                [btn68 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox68=NO;
                objParser.column68=0;
            }
            break;
        case 69:
            if (chkBox69 == NO)
            {
                [btn69 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox69=YES;
                objParser.column69=1;
            }
            else
            {
                [btn69 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox69=NO;
                objParser.column69=0;
            }
            break;
        case 70:
            if (chkBox70 == NO)
            {
                [btn70 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox70=YES;
                objParser.column70=1;
            }
            else
            {
                [btn70 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox71=NO;
                objParser.column70=0;
            }
            break;
        case 71:
            if (chkBox71 == NO)
            {
                [btn71 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox71=YES;
                objParser.column71=1;
            }
            
            else
            {
                [btn71 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox71=NO;
                objParser.column71=0;
            }
            break;
        case 72:
            if (chkBox72 == NO)
            {
                [btn72 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox72=YES;
                objParser.column72=1;
            }
            else
            {
                [btn72 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox72=NO;
                objParser.column72=0;
            }
            break;
        case 73:
            if (chkBox73 == NO)
            {
                [btn73 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox73=YES;
                 objParser.column73=1;
            }
            else
            {
                [btn73 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox73=NO;
                objParser.column73=0;
            }
            
            break;
        case 74:
            if (chkBox74 == NO)
            {
                [btn74 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox74=YES;
                objParser.column74=1;
            }
            else
            {
                [btn74 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox74=NO;
                objParser.column74=0;
            }
            break;
        case 75:
            if (chkBox75 == NO)
            {
                [btn75 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox75=YES;
                objParser.column75=1;
            }
            else
            {
                [btn75 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox75=NO;
                objParser.column75=0;
            }
            break;
        case 76:
            if (chkBox76 == NO)
            {
                [btn76 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox76=YES;
                objParser.column76=1;
            }
            else
            {
                [btn76 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox76=NO;
                objParser.column76=0;
            }
            break;
        case 77:
            if (chkBox77 == NO)
            {
                [btn77 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox77=YES;
                objParser.column77=1;
                
            }
            else
            {
                [btn77 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox77=NO;
                objParser.column77=0;
            }
            break;
        case 78:
            if (chkBox78 == NO)
            {
                [btn78 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox78=YES;
                objParser.column78=1;
            }
            else
            {
                [btn78 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox78=NO;
                objParser.column78=0;
            }
            break;
        case 79:
            if (chkBox79 == NO)
            {
                [btn79 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox79=YES;
                objParser.column79=1;
            }
            else
            {
                [btn79 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox79=NO;
                objParser.column79=0;
            }
            break;
        case 80:
            if (chkBox80 == NO)
            {
                [btn80 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox80=YES;
                objParser.column80=1;
            }
            else
            {
                [btn80 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox80=NO;
                objParser.column80=0;
            }
            break;
        case 81:
            if (chkBox81 == NO)
            {
                [btn81 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox81=YES;
                objParser.column81=1;
            }
            else
            {
                [btn81 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox81=NO;
                objParser.column81=0;
            }
            
            break;
        case 82:
            if (chkBox82 == NO)
            {
                [btn82 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox82=YES;
                objParser.column82=1;
            }
            else
            {
                [btn82 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox82=NO;
                objParser.column82=0;
            }
            break;
        case 83:
            if (chkBox83 == NO)
            {
                [btn83 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox83=YES;
                objParser.column83=1;
            }
            else
            {
                [btn83 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox83=NO;
                objParser.column83=0;
            }
            break;
        case 84:
            if (chkBox84 == NO)
            {
                [btn84 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox84=YES;
                objParser.column84=1;
            }
            else
            {
                [btn84 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox84=NO;
                objParser.column84=0;
            }
            break;
        case 85:
            if (chkBox85 == NO)
            {
                [btn85 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox85=YES;
                objParser.column85=1;
            }
            else
            {
                [btn85 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox85=NO;
                objParser.column85=0;
            }
            break;
        case 86:
            if (chkBox86 == NO)
            {
                [btn86 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox86=YES;
                objParser.column86=1;
            }
            else
            {
                [btn86 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox86=NO;
                objParser.column86=0;
            }
            break;
        case 87:
            if (chkBox87 == NO)
            {
                [btn87 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox87=YES;
                objParser.column87=1;
            }
            else
            {
                [btn87 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox87=NO;
                objParser.column87=0;
            }
            break;
        case 88:
            if (chkBox88 == NO)
            {
                [btn88 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox88=YES;
                objParser.column88=1;
            }
            else
            {
                [btn88 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox88=NO;
                objParser.column88=0;
            }
            break;
        case 89:
            if (chkBox89 == NO)
            {
                [btn89 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox89=YES;
                objParser.column89=1;
            }
            else
            {
                [btn89 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox89=NO;
                objParser.column89=0;
                
            }
            break;
        case 90:
            if (chkBox90 == NO)
            {
                [btn90 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox90=YES;
                objParser.column90=1;
            }
            else
            {
                [btn90 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox90=NO;
                objParser.column90=0;
            }
            break;
        case 91:
            if (chkBox91 == NO)
            {
                [btn91 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox91=YES;
                objParser.column91=1;
            }
            else
            {
                [btn91 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox91=NO;
                objParser.column91=0;
            }
            break;
        case 92:
            if (chkBox92 == NO)
            {
                [btn92 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox92=YES;
                objParser.column92=1;
            }
            else
            {
                [btn92 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox92=NO;
                objParser.column92=0;
            }
            
            break;
        case 93:
            if (chkBox93 == NO)
            {
                [btn93 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox93=YES;
                objParser.column93=1;
            }
            else
            {
                [btn93 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox93=NO;
                objParser.column93=0;
            }
            break;
        case 94:
            if (chkBox94 == NO)
            {
                [btn94 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox94=YES;
                objParser.column94=1;
            }
            else
            {
                [btn94 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox94=NO;
                objParser.column94=0;
            }
            break;
        case 95:
            if (chkBox95 == NO)
            {
                [btn95 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox95=YES;
                objParser.column95=1;
            }
            else
            {
                [btn95 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox95=NO;
                objParser.column95=0;
            }
            
            break;
        case 96:
            if (chkBox96 == NO)
            {
                [btn96 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox96=YES;
                objParser.column96=1;
            }
            else
            {
                [btn96 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox96=NO;
                objParser.column96=0;
            }
            break;
        case 97:
            if (chkBox97 == NO)
            {
                [btn97 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox97=YES;
                objParser.column97=1;
            }
            else
            {
                [btn97 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox97=NO;
                objParser.column97=0;
            }
            break;
        case 98:
            if (chkBox98 == NO)
            {
                [btn98 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox98=YES;
                objParser.column98=1;
            }
            else
            {
                [btn98 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox98=NO;
                objParser.column98=0;
            }
            break;
        case 99:
            if (chkBox99 == NO)
            {
                [btn99 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox99=YES;
                objParser.column99=1;
            }
            
            else
            {
                [btn99 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox99=NO;
                objParser.column99=0;
            }
            break;
        case 100:
            if (chkBox100 == NO)
            {
                [btn100 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox100=YES;
                 objParser.column100=1;
            }
            else
            {
                [btn100 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox100=NO;
                objParser.column100=0;
            }
            break;
        case 101:
            if (chkBox101 == NO)
            {
                 [btn101 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox101=YES;
                objParser.column101=1;
            }
            else
            {
                 [btn101 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                    chkBox101=NO;
                objParser.column101=0;
            }
            break;
        case 102:
            if (chkBox102 == NO)
            {
                [btn102 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox102=YES;
                objParser.column102=1;
            }
            else
            {
                [btn102 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox102=NO;
                objParser.column102=0;
            }
            break;
        case 103:
            if (chkBox103 == NO)
            {
                [btn103 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox103=YES;
                objParser.column103=1;
            }
            else
            {
                [btn103 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox103=NO;
                objParser.column103=0;
            }
            break;
        case 104:
            if (chkBox104 == NO)
            {
                [btn104 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox104=YES;
                objParser.column104=1;
            }
            else
            {
                [btn104 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox104=NO;
                objParser.column104=0;
            }
            
            break;
        case 105:
            if (chkBox105 == NO)
            {
                [btn105 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox105=YES;
                objParser.column105=1;
            }
            else
            {
                [btn105 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox105=NO;
                objParser.column105=0;
            }
            break;
        case 106:
            if (chkBox106 == NO)
            {
                [btn106 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox106=YES;
                objParser.column106=1;
            }
            else
            {
                [btn106 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox106=NO;
                objParser.column106=0;
            }
            break;
        case 107:
            if (chkBox107 == NO)
            {
                [btn107 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox107=YES;
                objParser.column107=1;
            }
            else
            {
                [btn107 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox107=NO;
                objParser.column107=0;
            }
            break;
        case 108:
            if (chkBox108 == NO)
            {
                [btn108 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox108=YES;
                objParser.column108=1;
            }
            else
            {
                [btn108 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox108=NO;
                objParser.column108=0;
            }
            break;
        case 109:
            if (chkBox109 == NO)
            {
                [btn109 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox109=YES;
                objParser.column109=1;
            }
            
            else
            {
                [btn109 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox109=NO;
                objParser.column109=0;
            }
            break;
        case 110:
            if (chkBox110 == NO)
            {
                [btn110 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox110=YES;
                objParser.column110=1;
            }
            else
            {
                [btn110 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox110=NO;
                objParser.column110=0;
            }
            break;
        case 111:
            if (chkBox111 == NO)
            {
                [btn111 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox111=YES;
                objParser.column111=1;
            }
            else
            {
                [btn111 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox111=NO;
                objParser.column111=0;
            }
            break;
        case 112:
            if (chkBox112 == NO)
            {
                [btn112 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox112=YES;
                objParser.column112=1;
            }
            else
            {
                [btn112 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox112=NO;
                objParser.column112=0;
            }
            break;
        case 113:
            if (chkBox113 == NO)
            {
                [btn113 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox113=YES;
                objParser.column113=1;
            }
            else
            {
                [btn113 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox113=NO;
                objParser.column113=0;
                
            }
            break;
        case 114:
            if (chkBox114 == NO)
            {
                [btn114 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox114=YES;
                objParser.column114=1;
            }
            else
            {
                [btn114 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox114=NO;
                objParser.column114=0;
            }
            break;
        case 115:
            if (chkBox115 == NO)
            {
                [btn115 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox115=YES;
                objParser.column115=1;
            }
            else
            {
                [btn115 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox115=NO;
                objParser.column115=0;
            }
            break;
        case 116:
            if (chkBox116 == NO)
            {
                [btn116 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox116=YES;
                objParser.column116=1;
            }
            else
            {
                [btn116 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox116=NO;
                objParser.column116=0;
            }
            break;
        case 117:
            if (chkBox117 == NO)
            {
                [btn117 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox117=YES;
                objParser.column117=1;
            }
            else
            {
                [btn117 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox117=NO;
                objParser.column117=0;
            }
            break;
        case 118:
            if (chkBox118 == NO)
            {
                [btn118 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox118=YES;
                objParser.column118=1;
            }
            else
            {
                [btn118 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox118=NO;
                objParser.column118=0;
            }
            break;
        case 119:
            if (chkBox119 == NO)
            {
                [btn119 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox119=YES;
                objParser.column119=1;
            }
            else
            {
                [btn119 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox119=NO;
                objParser.column119=0;
            }
            break;
        case 120:
            if (chkBox120 == NO)
            {
                [btn120 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox120=YES;
                objParser.column120=1;
            }
            else
            {
                [btn120 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox120=NO;
                objParser.column120=0;
            }
            break;
        case 121:
            if (chkBox121 == NO)
            {
                [btn121 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox121=YES;
                objParser.column121=1;
            }
            else
            {
                [btn121 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox121=NO;
                objParser.column121=0;
            }
            break;
        case 122:
            if (chkBox122 == NO)
            {
                [btn122 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox122=YES;
                objParser.column122=1;
            }
            else
            {
                [btn122 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox122=YES;
                objParser.column122=0;
            }
            break;
        case 123:
            if (chkBox123 == NO)
            {
                [btn123 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox123=YES;
                objParser.column123=1;
            }
            else
            {
                [btn123 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox123=NO;
                objParser.column123=0;
            }
           break;
        case 124:
            if (chkBox124 == NO)
            {
                [btn124 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox124=YES;
                objParser.column124=1;
            }
            else
            {
                [btn124 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox124=NO;
                objParser.column124=0;
                
            }
            break;
        case 125:
            if (chkBox125 == NO)
            {
                [btn125 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox125=YES;
                objParser.column125=1;
            }
            else
            {
                [btn125 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox125=NO;
                objParser.column125=0;
            }
            break;
        case 126:
            if (chkBox126 == NO)
            {
                [btn126 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox126=YES;
                objParser.column126=1;
            }
            else
            {
                [btn126 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox126=NO;
                objParser.column126=0;
            }
            break;
        case 127:
            if (chkBox127 == NO)
            {
                [btn127 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox127=YES;
                objParser.column127=1;
            }
            else
            {
                [btn127 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox127=NO;
                objParser.column127=0;
            }
            break;
            
        case 128:
            if (chkBox128 == NO)
            {
                [btn128 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox128=YES;
                objParser.column128=1;
            }
            else
            {
                [btn128 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox128=NO;
                objParser.column128=0;
            }
            break;
                
        case 129:
            if (chkBox129 == NO)
            {
                [btn129 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox129=YES;
                objParser.column129=1;
            }
            else
            {
                [btn129 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox129=NO;
                objParser.column129=0;

            }
            break;
        case 130:
            if (chkBox130 == NO)
            {
                [btn130 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox130=YES;
                objParser.column130=1;

            }
            else
            {
                [btn130 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox130=NO;
                objParser.column130=0;
            }
            break;
        case 131:
            if (chkBox131 == NO)
            {
                [btn131 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox131=YES;
                objParser.column131=1;
            }
            else
            {
                [btn131 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox131=NO;
                objParser.column131=0;
            }
            break;
        case 132:
            if (chkBox132 == NO)
            {
                [btn132 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox132=YES;
                objParser.column132=1;
                
            }
            else
            {
                [btn132 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox132=NO;
                objParser.column132=0;
                
            }
            break;
        case 133:
            if (chkBox133 == NO)
            {
                [btn133 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox133=YES;
                objParser.column133=1;
                
            }
            else
            {
                [btn133 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox133=NO;
                objParser.column133=0;
                
            }
            break;
        case 134:
            if (chkBox134 == NO)
            {
                [btn134 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox134=YES;
                objParser.column134=1;
            }
            else
            {
                [btn134 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox134=NO;
                objParser.column134=0;
            }
            break;
        case 135:
            if (chkBox135 == NO)
            {
                [btn135 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox135=YES;
                objParser.column135=1;
            }
            else
            {
                [btn135 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox135=NO;
                objParser.column135=0;
            }
            break;
        case 136:
            if (chkBox136 == NO)
            {
                [btn136 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox136=YES;
                objParser.column136=1;
            }
            else
            {
                [btn136 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox136=NO;
                objParser.column136=0;
            }
            break;
        case 137:
            if (chkBox137 == NO)
            {
                [btn137 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox137=YES;
                objParser.column137=1;
            }
            else
            {
                [btn137 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox137=NO;
                objParser.column137=0;
            }
            break;
        case 138:
            if (chkBox138 == NO)
            {
                [btn138 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox138=YES;
                objParser.column138=1;
            }
            else
            {
                [btn138 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox138=NO;
                objParser.column138=0;
            }
            break;
        case 139:
            if (chkBox139 == NO)
            {
                [btn139 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox139=YES;
                objParser.column139=1;
            }
            else
            {
                [btn139 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox139=YES;
                objParser.column139=0;
            }
            break;
        case 140:
            if (chkBox140 == NO)
            {
                [btn140 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox140=YES;
                objParser.column140=1;
            }
            else
            {
                [btn140 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox140=NO;
                objParser.column140=0;
            }
            break;
        case 141:
            if (chkBox141 == NO)
            {
                [btn141 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox141=YES;
                objParser.column141=1;
            }
            else
            {
                [btn141 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox141=NO;
                objParser.column141=0;
                
            }
            break;
        case 142:
            if (chkBox142 == NO)
            {
                [btn142 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox142=YES;
                objParser.column142=1;
            }
            else
            {
                [btn142 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox142=NO;
                objParser.column142=0;
            }
            break;
        case 143:
            if (chkBox143 == NO)
            {
                [btn143 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox143=YES;
                objParser.column143=1;
            }
            else
            {
                [btn143 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox143=NO;
                objParser.column143=0;
                
            }
            break;
        case 144:
            if (chkBox144 == NO)
            {
                [btn144 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox144=YES;
                objParser.column144=1;
                
            }
            else
            {
                [btn144 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox144=NO;
                objParser.column144=0;
            }
            break;
        case 145:
            if (chkBox145 == NO)
            {
                [btn145 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox145=YES;
                objParser.column145=1;
            }
            else
            {
                [btn145 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox145=NO;
                objParser.column145=0;
            }
            break;
        case 146:
            if (chkBox146 == NO)
            {
                [btn146 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox146=YES;
                objParser.column146=1;
            }
            else
            {
                [btn146 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox146=NO;
                objParser.column146=0;
            }
            break;
        case 147:
            if (chkBox147 == NO)
            {
                [btn147 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox147=YES;
                objParser.column147=1;
                
            }
            else
            {
                [btn147 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox147=NO;
                objParser.column147=0;
                
            }
            break;
        case 148:
            if (chkBox148 == NO)
            {
                [btn148 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox148=YES;
                objParser.column148=1;
            }
            else
            {
                [btn148 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox148=NO;
                objParser.column148=0;
            }
            break;
        case 149:
            if (chkBox149 == NO)
            {
                [btn149 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox149=YES;
                objParser.column149=1;
            }
            else
            {
                [btn149 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox149=NO;
                objParser.column149=0;
            }
            break;
        case 150:
            if (chkBox150== NO)
            {
                [btn150 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox150=YES;
                objParser.column150=1;
            }
            else
            {
                [btn150 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox150=NO;
                objParser.column150=0;
            }
            break;
        case 151:
            if (chkBox151 == NO)
            {
                 [btn151 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox151=YES;
                objParser.column151=1;
            }
            else
            {
                 [btn151 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox151=NO;
                objParser.column151=0;
            }
            break;
        case 152:
            if (chkBox152 == NO)
            {
                 [btn152 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox152=YES;
                objParser.column152=1;
                
            }
            else
            {
                 [btn152 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox152=NO;
                objParser.column152=0;
                
            }
            break;
        case 153:
            if (chkBox153 == NO)
            {
                 [btn153 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox153=YES;
                objParser.column153=1;
                
            }
            else
            {
                 [btn153 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox153=NO;
                objParser.column153=0;
            }
            break;
        case 154:
            if (chkBox154 == NO)
            {
                 [btn154 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox154=YES;
                objParser.column154=1;
                
            }
            else
            {
                 [btn154 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox154=NO;
                objParser.column154=0;
                
            }
            break;
        case 155:
            if (chkBox155 == NO)
            {
                 [btn155 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox155=YES;
                objParser.column155=1;
                
            }
            else
            {
                 [btn155 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox155=NO;
                objParser.column155=0;
                
            }
            break;
        case 156:
            if (chkBox156 == NO)
            {
                 [btn156 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox156=YES;
                objParser.column156=1;
                
            }
            else
            {
                 [btn156 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox156=NO;
                objParser.column156=0;
                
            }
            break;
        case 157:
            if (chkBox157 == NO)
            {
                 [btn157 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox157=YES;
                objParser.column157=1;
            }
            else
            {
                 [btn157 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox157=NO;
                objParser.column157=0;
            }
            break;
        case 158:
            if (chkBox158 == NO)
            {
                 [btn158 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox158=YES;
                objParser.column158=1;
                
            }
            else
            {
                 [btn158 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox158=NO;
                objParser.column158=0;
                
            }
            break;
        case 159:
            if (chkBox159 == NO)
            {
                 [btn159 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox159=YES;
                objParser.column159=1;
            }
            else
            {
                 [btn159 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox159=NO;
                objParser.column159=0;
            }
            break;
        case 160:
            if (chkBox160 == NO)
            {
                 [btn160 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox160=YES;
                objParser.column160=1;
                
            }
            else
            {
                 [btn160 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox160=NO;
                objParser.column160=0;
            }
            break;
        case 161:
            if (chkBox161 == NO)
            {
                 [btn161 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                  chkBox161=YES;
                objParser.column161=1;
            }
            else
            {
                 [btn161 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                 chkBox161=NO;
                objParser.column161=0;
            }
            break;
        case 162:
            if (chkBox162 == NO)
            {
                 [btn162 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox162=YES;
                objParser.column162=1;
            }
            else
            {
                 [btn162 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox162=NO;
                objParser.column162=0;
            }
            break;
        case 163:
            if (chkBox163 == NO)
            {
                 [btn163 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox163=YES;
                objParser.column163=1;
            }
            else
            {
                 [btn163 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox163=NO;
                objParser.column163=0;
            }
            break;
        case 164:
            if (chkBox164 == NO)
            {
                 [btn164 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox164=YES;
                objParser.column164=1;
            }
            else
            {
                 [btn164 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox164=NO;
                objParser.column164=0;
            }
            break;
        case 165:
            if (chkBox165 == NO)
            {
                 [btn165 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox165=YES;
                objParser.column165=1;
            }
            else
            { 
                [btn165 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox165=NO;
                objParser.column165=0;
                
            }
            break;
        case 166:
            if (chkBox166 == NO)
            {
                 [btn166 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox166=YES;
                objParser.column166=1;
            }
            else
            {
                 [btn166 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox166=NO;
                objParser.column166=0;
                
            }
            break;
        case 167:
            if (chkBox167 == NO)
            {
                 [btn167 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox167=YES;
                objParser.column167=1;
                
            }
            else
            {
                 [btn167 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox167=NO;
                objParser.column167=0;
            }
            break;
        case 168:
            if (chkBox168 == NO)
            {
                 [btn168 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                 chkBox168=YES;
                objParser.column168=1;
            }
            else
            {
                 [btn168 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox168=NO;
                objParser.column168=0;
            }
            break;
        case 169:
            if (chkBox169== NO)
            {
                 [btn169 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox169=YES;
                objParser.column169=1;
            }
            else
            {
                 [btn169 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox169=NO;
                objParser.column169=0;
            }
            break;
        case 170:
            if (chkBox170 == NO)
            {
                 [btn170 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox170=YES;
                objParser.column170=1;
            }
            else
            {
                 [btn170 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox170=NO;
                objParser.column170=0;
            }
            break;
        case 171:
            if (chkBox171 == NO)
            {
                 [btn171 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox171=YES;
                 objParser.column171=1;
                
            }
            else
            {
                 [btn171 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox171=NO;
                 objParser.column171=0;
                
            }
            break;
        case 172:
            if (chkBox172 == NO)
            {
                 [btn172 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox172=YES;
                 objParser.column172=1;
                
            }
            else
            {
                 [btn172 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox172=NO;
                 objParser.column172=0;
            }
            break;
        case 173:
            if (chkBox173 == NO)
            {
                 [btn173 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox173=YES;
                 objParser.column173=1;
            }
            else
            {
                 [btn173 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox173=NO;
                 objParser.column173=0;
                
            }
            break;
        case 174:
            if (chkBox174 == NO)
            {
                 [btn174 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox174=YES;
                 objParser.column174=1;
                
            }
            else
            {
                 [btn174 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox174=NO;
                 objParser.column174=0;
                
            }
            break;
        case 175:
            if (chkBox175 == NO)
            {
                 [btn175 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox175=YES;
                 objParser.column175=1;
            }
            else
            {
                 [btn175 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox175=NO;
                 objParser.column175=0;
            }
            break;
        case 176:
            if (chkBox176 == NO)
            {
                 [btn176 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox176=YES;
                 objParser.column176=1;
                
            }
            else
            {
                 [btn176 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox176=NO;
                 objParser.column176=0;
                
            }
            break;
        case 177:
            if (chkBox177 == NO)
            {
                 [btn177 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox177=YES;
                 objParser.column177=1;
            }
            else
            {
                 [btn177 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                 chkBox177=NO;
                 objParser.column177=0;
            }
            break;
        case 178:
            if (chkBox178 == NO)
            {
                 [btn178 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox178=YES;
                 objParser.column178=1;
            }
            else
            {
                 [btn178 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox178=NO;
                 objParser.column178=0;
            }
            break;
        case 179:
            if (chkBox179 == NO)
            {
                 [btn179 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox179=YES;
                 objParser.column179=1;
            }
            else
            {
                 [btn179 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox179=NO;
                 objParser.column179=0;
            }
            break;
        case 180:
            if (chkBox180 == NO)
            {
                 [btn180 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox180=YES;
                 objParser.column180=1;
            }
            else
            {
                 [btn180 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox180=NO;
                objParser.column180=0;
            }
            break;
        case 181:
            if (chkBox181== NO)
            {
                 [btn181 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox181=YES;
                objParser.column181=1;
            }
            else
            {
                 [btn181 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox181=NO;
                objParser.column181=0;
            }
            break;
        case 182:
            if (chkBox182 == NO)
            {
                 [btn182 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox182=YES;
                objParser.column182=1;
            }
            else
            {
                 [btn182 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox182=NO;
                objParser.column182=0;
            }
            break;
        case 183:
            if (chkBox183 == NO)
            {
                 [btn183 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox183=YES;
                objParser.column183=1;
            }
            else
            {
                 [btn183 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox183=NO;
                objParser.column183=0;
            }
            break;
        case 184:
            if (chkBox184 == NO)
            {
                 [btn184 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox184=YES;
                objParser.column184=1;
            }
            else
            {
                 [btn184 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox184=NO;
                objParser.column184=0;
            }
            break;
        case 185:
            if (chkBox185 == NO)
            {
                 [btn185 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox185=YES;
                objParser.column185=1;
            }
            else
            {
                 [btn185 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox185=NO;
                objParser.column185=0;
            }
            break;
        case 186:
            if (chkBox186 == NO)
            {
                 [btn186 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox186=YES;
                objParser.column186=1;
            }
            else
            {
                 [btn186 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox186=NO;
                objParser.column186=0;
            }
            break;
        case 187:
            if (chkBox187 == NO)
            {
                 [btn187 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox187=YES;
                objParser.column187=1;
            }
            else
            {
                 [btn187 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox187=NO;
                objParser.column187=0;
            }
            break;
        case 188:
            if (chkBox188 == NO)
            {
                 [btn188 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox188=YES;
                objParser.column188=1;
            }
            else
            {
                 [btn188 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox188=NO;
                objParser.column188=0;
            }
            break;
        case 189:
            if (chkBox189 == NO)
            {
                 [btn189 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox189=YES;
                objParser.column189=1;
            }
            else
            {
                 [btn189 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox189=NO;
                objParser.column189=0;
            }
            break;
        case 190:
            if (chkBox190 == NO)
            {
                 [btn190 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox190=YES;
                objParser.column190=1;
            }
            else
            {
                 [btn190 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox190=NO;
                objParser.column190=0;
            }
            break;
        case 191:
            if (chkBox191 == NO)
            {
                 [btn191 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox191=YES;
                objParser.column191=1;
            }
            else
            {
                 [btn191 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox191=NO;
                objParser.column191=0;
            }
            break;
        case 192:
            if (chkBox192 == NO)
            {
                 [btn192 setImage:[UIImage imageNamed:@"Checkmark.png"] forState:UIControlStateNormal];
                chkBox192=YES;
                objParser.column192=1;
            }
            else
            {
                 [btn192 setImage:[UIImage imageNamed:@"Uncheckmark.png"] forState:UIControlStateNormal];
                chkBox192=NO;
                objParser.column192=0;
            }
            break;
        default:
            break;
    }
    
 
    
    
    
}

-(void)clickSave
{
    if([FromDate_txt.text length]>0 && [ToDate_txt.text length]>0 && [Property_txt.text length]>0   && [Manager_txt.text length]>0 && ![DateFirst_lab.text isEqualToString:@"MM / dd"] &&  ![DateSecond_lab.text isEqualToString:@"MM / dd"] && ![DateThird_lab.text isEqualToString:@"MM / dd"] && ![DateFourth_lab.text isEqualToString:@"MM / dd"])
    {
    
   
            
    objParser.FromDate=[NSString stringWithFormat:@"%@",FromDate_txt.text];
    objParser.ToDate=[NSString stringWithFormat:@"%@",ToDate_txt.text];
    objParser.Property=[Property_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    objParser.Manager=[Manager_txt.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        
    objParser.FirstDate=[NSString stringWithFormat:@"%@",DateFirst_lab.text];
    objParser.SecondDate=[NSString stringWithFormat:@"%@",DateSecond_lab.text];
    objParser.ThirdDate=[NSString stringWithFormat:@"%@",DateThird_lab.text];
    objParser.FourthDate=[NSString stringWithFormat:@"%@",DateFourth_lab.text];
        
    
        WeeklyReportViewPart2 *Week_obj=[[WeeklyReportViewPart2 alloc]initWithParserObj:objParser];  
        [self.navigationController pushViewController:Week_obj animated:YES];
    
      
          
    }
    else
    {
        if([DateFirst_lab.text isEqualToString:@"MM / dd"])
        {
             Note_lab.textColor=[UIColor redColor];
            DateFirst_lab.layer.borderColor = [UIColor redColor].CGColor;
            
        }
        if ([DateSecond_lab.text isEqualToString:@"MM / dd"]) 
        {
            DateSecond_lab.layer.borderColor = [UIColor redColor].CGColor;
             Note_lab.textColor=[UIColor redColor];
        }
        if ([DateThird_lab.text isEqualToString:@"MM / dd"])
        {
             DateThird_lab.layer.borderColor = [UIColor redColor].CGColor;
             Note_lab.textColor=[UIColor redColor];
        }
        if ([DateFourth_lab.text isEqualToString:@"MM / dd"])
        {
             DateFourth_lab.layer.borderColor = [UIColor redColor].CGColor;
             Note_lab.textColor=[UIColor redColor];
            
        }

        
        
      
        
        
       
       
        
        
        chkLabel=YES;
        
        
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"Please Fill The All Data.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];    
        alt.delegate=self;
        [alt show];
         [alt release];
    }

}


-(void)backButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)LoadUserProperty

{
    
    //  http://50.57.50.220/lindiproperty/index.php/lindiproperty/getProperty_service/108
    LendiPropertyAppDelegate *objApp = (LendiPropertyAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    propertycheck=YES;
    NSString *temp_url=[NSString stringWithFormat:@"%@/getProperty_service/%@",MainUrl,objApp.strUserId];
    
    
    NSURL *url = [[NSURL alloc]initWithString:[temp_url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:url];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) 
    {
        webData = [[NSMutableData alloc]init];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    
    
}

- (IBAction)PropertyDoneclcik

{
    if(isPropertyChanged==NO)
    {
        
        objParser.selectedProperty=[propertyid objectAtIndex:0];
        
    }
    
    NSLog(@"%@",objParser.selectedProperty);
    
    [UIView animateWithDuration:0.8 delay:0.0 options:0
                     animations:^{                              
                         CGPoint point = pickerview.center;
                         point.y = point.y + 600;
                         pickerview.center = point;
                         
                     } 
                     completion:^(BOOL finished) {  
                         [self enableview];
                     }];    
    
    
    
    
}
-(void)enableview

{
    FromDate_btn.userInteractionEnabled=YES;
    ToDate_btn.userInteractionEnabled=YES;
    DateFirst_btn.userInteractionEnabled=YES;
    DateSecond_btn.userInteractionEnabled=YES;
    DateThird_btn.userInteractionEnabled=YES;
    DateFourth_btn.userInteractionEnabled=YES;
    FromDate_txt.userInteractionEnabled=YES;
    ToDate_txt.userInteractionEnabled=YES;
    Property_txt.userInteractionEnabled=YES;
    Manager_txt.userInteractionEnabled=YES;
    Scroll_view.userInteractionEnabled=YES;
    btnNext.enabled=YES;
    
}

-(void)disabeleview

{
    FromDate_btn.userInteractionEnabled=NO;
    ToDate_btn.userInteractionEnabled=NO;
    DateFirst_btn.userInteractionEnabled=NO;
    DateSecond_btn.userInteractionEnabled=NO;
    DateThird_btn.userInteractionEnabled=NO;
    DateFourth_btn.userInteractionEnabled=NO;
    FromDate_txt.userInteractionEnabled=NO;
    ToDate_txt.userInteractionEnabled=NO;
    Property_txt.userInteractionEnabled=NO;
    Manager_txt.userInteractionEnabled=NO;
    Scroll_view.userInteractionEnabled=NO;
    btnNext.enabled=NO;
    
}



#pragma mark - TextField Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	switch (textField.tag) 
    {
        case 1:
            [textField resignFirstResponder];
            return NO;
            break;
        case 2:
            [textField resignFirstResponder];
            return NO;
            break;
        default:
            return YES;
            break;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}





#pragma mark - View lifecycle




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver_val = [version intValue];
    
    
    if(ver_val >=6.0 ){
        [[UIDevice currentDevice] setOrientation:UIDeviceOrientationPortrait];
    }

    
    
    self.Scroll_view.contentSize=CGSizeMake(768, 3000);
    
    barButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
    [barButton setTitle:@"Back"];
    [self.navigationItem setLeftBarButtonItem:barButton];
    [barButton release];

   
    DateFirst_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateFirst_lab.layer.borderWidth = 2.0;
    
    DateSecond_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateSecond_lab.layer.borderWidth = 2.0;
    
    DateThird_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateThird_lab.layer.borderWidth = 2.0;
    
    DateFourth_lab.layer.borderColor = [UIColor blackColor].CGColor;
    DateFourth_lab.layer.borderWidth = 2.0;
    
    
    chkBox1=NO;chkBox2=NO;chkBox3=NO;chkBox4=NO;chkBox5=NO;chkBox6=NO;chkBox7=NO;chkBox8=NO;chkBox9=NO;chkBox10=NO;chkBox11=NO;chkBox12=NO;chkBox13=NO;chkBox14=NO;chkBox15=NO;chkBox16=NO;chkBox17=NO;chkBox18=NO;chkBox19=NO;chkBox20=NO;chkBox21=NO;chkBox22=NO;chkBox23=NO;chkBox24=NO;chkBox25=NO;chkBox26=NO;chkBox27=NO;chkBox28=NO;chkBox29=NO;chkBox30=NO;chkBox31=NO;chkBox32=NO;chkBox33=NO;chkBox34=NO;chkBox35=NO;chkBox36=NO;chkBox37=NO;chkBox38=NO;chkBox39=NO;chkBox40=NO;chkBox41=NO;chkBox42=NO;chkBox43=NO;chkBox44=NO;chkBox45=NO;chkBox46=NO;chkBox47=NO;chkBox48=NO;chkBox49=NO;chkBox50=NO;chkBox51=NO;chkBox52=NO;chkBox53=NO;chkBox54=NO;chkBox55=NO;chkBox56=NO;chkBox57=NO;chkBox58=NO;chkBox59=NO;chkBox60=NO;chkBox61=NO;chkBox62=NO;chkBox63=NO;chkBox64=NO;chkBox65=NO;chkBox66=NO;chkBox67=NO;chkBox68=NO;chkBox69=NO;chkBox70=NO;chkBox71=NO;chkBox72=NO;chkBox73=NO;chkBox74=NO;chkBox75=NO;chkBox76=NO;chkBox77=NO;chkBox78=NO;chkBox79=NO;chkBox80=NO;chkBox81=NO;chkBox82=NO;chkBox83=NO;chkBox84=NO;chkBox85=NO;chkBox86=NO;chkBox87=NO;chkBox88=NO;chkBox89=NO;chkBox90=NO;chkBox91=NO;chkBox92=NO;chkBox93=NO;chkBox94=NO;chkBox95=NO;chkBox96=NO;chkBox97=NO;chkBox98=NO;chkBox99=NO;chkBox100=NO;
    
    
     chkBox101=NO;chkBox102=NO;chkBox103=NO;chkBox104=NO;chkBox105=NO;chkBox106=NO;chkBox107=NO;chkBox108=NO;chkBox109=NO;chkBox110=NO;chkBox111=NO;chkBox112=NO;chkBox113=NO;chkBox114=NO;chkBox115=NO;chkBox116=NO;chkBox117=NO;chkBox118=NO;chkBox119=NO;chkBox120=NO;chkBox121=NO;chkBox122=NO;chkBox123=NO;chkBox124=NO;chkBox125=NO;chkBox126=NO;chkBox127=NO;chkBox128=NO;chkBox129=NO;chkBox130=NO;chkBox131=NO;chkBox132=NO;chkBox133=NO;chkBox134=NO;chkBox135=NO;chkBox136=NO;chkBox137=NO;chkBox138=NO;chkBox139=NO;chkBox140=NO;chkBox141=NO;chkBox142=NO;chkBox143=NO;chkBox144=NO;chkBox145=NO;chkBox146=NO;chkBox147=NO;chkBox148=NO;chkBox149=NO;chkBox150=NO;chkBox151=NO;chkBox152=NO;chkBox153=NO;chkBox154=NO;chkBox155=NO;chkBox156=NO;chkBox157=NO;chkBox158=NO;chkBox159=NO;chkBox160=NO;chkBox161=NO;chkBox162=NO;chkBox163=NO;chkBox164=NO;chkBox165=NO;chkBox166=NO;chkBox167=NO;chkBox168=NO;chkBox169=NO;chkBox170=NO;chkBox171=NO;chkBox172=NO;chkBox173=NO;chkBox174=NO;chkBox175=NO;chkBox176=NO;chkBox177=NO;chkBox178=NO;chkBox179=NO;chkBox180=NO;chkBox181=NO;chkBox182=NO;chkBox183=NO;chkBox184=NO;chkBox185=NO;chkBox186=NO;chkBox187=NO;chkBox188=NO;chkBox189=NO;chkBox190=NO;chkBox191=NO;chkBox192=NO;

    self.view.backgroundColor=[UIColor colorWithRed:(float)(249.00/255) green:(float)(242.00/255) blue:(float)(214.00/255) alpha:1];
    btnNext = [[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(clickSave)];
    self.navigationItem.rightBarButtonItem =btnNext;
    
    [self startSpinner:@"spinner" andDisplay:@"Loading.."];
    
    [self LoadUserProperty];
    
    
    
   
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)setFrame
{
    
//    FromDate_txt
//    ToDate_txt
//    Property_txt
//    Manager_txt;
    
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
   return (interfaceOrientation==UIInterfaceOrientationPortrait ||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);
    
    
}

#pragma mark - Spinner Methods

-(void) startSpinner:(NSString*)type andDisplay:(NSString*)display
{
    
    if(self.spinnerView){
        [self.spinnerView.view removeFromSuperview];
        self.spinnerView = nil;    
    }
    self.spinnerView =[[[SpinnerModal_iPad alloc]initWithType:type andDisplay:display]autorelease];
   
    [self.view addSubview:self.spinnerView.view];
}

-(void) stopSpinner
{
    
    [self.spinnerView.view removeFromSuperview];
    self.spinnerView = nil;    
}






#pragma mark - UIPikerview Delegates 



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [PikerArray count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [PikerArray objectAtIndex:row]; 
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    isPropertyChanged=YES;
    
    objParser.selectedProperty=[propertyid objectAtIndex:row];
    
     NSLog(@"%@",objParser.selectedProperty);  
    
}


#pragma  mark - Connection Delegates


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error

{
    [webData release];
    [connection release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection

{
    NSString *jsonStr = [[NSString alloc] 
                         initWithData:webData                         
                         encoding:NSASCIIStringEncoding];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
    NSDictionary *jsondic = [parser objectWithString:jsonStr];
    
    NSString *str = [NSString stringWithFormat:@"%@",[jsondic valueForKey:@"success"]];
    
    
    if ([str isEqualToString:@"1"])
    {

    
    
        NSDictionary *resultdic=[[NSDictionary alloc]init];
        
        resultdic=[jsondic valueForKey:@"result"];
        
        NSLog(@"%@",[resultdic valueForKey:@"property_name"]);
        
        PikerArray=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"property_name"]];

        propertyid=[[NSMutableArray alloc]initWithArray:[resultdic valueForKey:@"property_id"]];
    
            if([PikerArray count]>0)
                
            {
        
                [Propertypicker reloadAllComponents];
        
                [self stopSpinner];
                [UIView animateWithDuration:0.8 delay:0.0 options:0
                                 animations:^{                              
                                     CGPoint point = pickerview.center;
                                     point.y = point.y - 600;
                                     pickerview.center = point;
                             
                                    } 
                                 completion:^(BOOL finished) {  
                                 }];    
                
        
                [self.view bringSubviewToFront:pickerview];
        
                [self disabeleview];
                
            }
        
    }
    
    else
        
    {
        [self stopSpinner];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Lindy Property" message:@"No Property Assigned!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        alert.delegate=self;
        [alert release];
        
        
        
        
    }
    
    [webData release];
}

@end
