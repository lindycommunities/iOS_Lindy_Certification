//
//  ParserClass.m
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ParserClass.h"

@implementation ParserClass


@synthesize strIRUserID,strIRProperty,strIRResiName,strIRAPT,strIRPhone,strIRDesc,strIRPreparedBy,strIRWitness,strIRAddress,strIRPhone1,strUserName,strSavedDate;


@synthesize column1,column2,column3,column4,column5,column6,column7,column8,column9,column10,column11,column12,column13,column14,column15,column16,column17,column18,column19,column20,column21,column22,column23,column24,column25,column26,column27,column28,column29,column30,column31,column32,column33,column34,column35,column36,column37,column38,column39,column40,column41,column42,column43,column44,column45,column46,column47,column48,column49,column50,column51,column52,column53,column54,column55,column56,column57,column58,column59,column60,column61,column62,column63,column64,column65,column66,column67,column68,column69,column70,column71,column72,column73,column74,column75,column76,column77,column78,column79,column80,column81,column82,column83,column84,column85,column86,column87,column88,column89,column90,column91,column92,column93,column94,column95,column96,column97,column98,column99,column100;


@synthesize column101,column102,column103,column104,column105,column106,column107,column108,column109,column110,column111,column112,column113,column114,column115,column116,column117,column118,column119,column120,column121,column122,column123,column124,column125,column126,column127,column128,column129,column130,column131,column132,column133,column134,column135,column136,column137,column138,column139,column140,column141,column142,column143,column144,column145,column146,column147,column148,column149,column150,column151,column152,column153,column154,column155,column156,column157,column158,column159,column160,column161,column162,column163,column164,column165,column166,column167,column168,column169,column170,column171,column172,column173,column174,column175,column176,column177,column178,column179,column180,column181,column182,column183,column184,column185,column186,column187,column188,column189,column190,column191,column192,column193,column194,column195,column196,column197,column198,column199,column200;

@synthesize ReportID,UserID ,CreationDate ,PropertyManager ,Contractor ,MaintancesSuper ,Phoneno ,StartTime ,ActionTaken ,EndTime ,EmployeeName ,Intials ,Sign ,SignDate;

@synthesize Report_ID  ,User_ID ,Creation_Date ,FromDate ,ToDate  ,Property , Manager,A,B,C,D,E,F,G,H,I,J,K,FirstDate,SecondDate,ThirdDate,FourthDate;

@synthesize Building,Activity,strAIDesc,selectedProperty,resident_name,unit_no,room_type,damage_type,damage_cost;

-(id)init
{
    self = [super init];
    if (self)
    {
               
      
        
        column1= 0;column2= 0;column3= 0;column4= 0;column5= 0;column6= 0;column7= 0;column8= 0;column9= 0;column10= 0;column11= 0;column12= 0;column13= 0;column14= 0;column15= 0;column16= 0;column17= 0;column18= 0;column19= 0;column20= 0;column21= 0;column22= 0;column23= 0;column24= 0;column25= 0;column26= 0;column27= 0;column28= 0;column29= 0;column30= 0;column31= 0;column32= 0;column33= 0;column34= 0;column35= 0;column36= 0;column37= 0;column38= 0;column39= 0;column40= 0;column41= 0;column42= 0;column43= 0;column44= 0;column45= 0;column46= 0;column47= 0;column48= 0;column49= 0;column50= 0;column51= 0;column52= 0;column53= 0;column54= 0;column55= 0;column56= 0;column57= 0;column58= 0;column59= 0;column60= 0;column61= 0;column62= 0;column63= 0;column64= 0;column65= 0;column66= 0;column67= 0;column68= 0;column69= 0;column70= 0;column71= 0;column72= 0;column73= 0;column74= 0;column75= 0;column76= 0;column77= 0;column78= 0;column79= 0;column80= 0;column81= 0;column82= 0;column83= 0;column84= 0;column85= 0;column86= 0;column87= 0;column88= 0;column89= 0;column90= 0;column91= 0;column92= 0;column93= 0;column94= 0;column95= 0;column96= 0;column97= 0;column98= 0;column99= 0;column100= 0;

        
        
        
        
        
        
        
        
        
        column101= 0;column102= 0;column103= 0;column104= 0;column105= 0;column106= 0;
        column107=0;column108= 0;column109= 0;column110= 0;column111= 0;column112= 0;
        column113=0;column114= 0;column115= 0;column116= 0;column117= 0;column118= 0;column119= 0;column120= 0;column121= 0;column122= 0;column123= 0;column124= 0;
        column125= 0;column126= 0;column127= 0;column128= 0;column129=0;column130= 0;
        column131= 0;column132= 0;column133= 0;column134= 0;column135= 0;column136= 0;
        column137= 0;column138= 0;column139= 0;column140= 0;column141= 0;column142= 0;
        column143= 0;column144= 0;column145= 0;column146= 0;column147= 0;column148= 0;
        column149= 0;column150= 0;column151= 0;column152= 0;column153= 0;column154= 0;
        column155= 0;column156= 0;column157= 0;column158= 0;column159= 0;column160= 0;
        column161= 0;column162= 0;column163= 0;column164= 0;column165= 0;column166= 0;
        column167= 0;column168= 0;column169= 0;column170= 0;column171= 0;column172= 0;
        column173= 0;column174= 0;column175= 0;column176= 0;column177= 0;column178= 0;
        column179= 0;column180= 0;column181= 0;column182= 0;column183= 0;column184= 0;
        column185= 0;column186= 0;column187= 0;column188= 0;column189= 0;column190= 0;
        column191= 0;column192= 0;column193= 0;column194= 0;column195= 0;column196= 0;
        column197= 0;column198= 0;column199= 0;column200= 0;
        
        
        
     
             
        
        
               
    }
    return self;
}
@end
