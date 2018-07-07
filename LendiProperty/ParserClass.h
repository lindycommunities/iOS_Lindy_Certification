//
//  ParserClass.h
//  LendiProperty
//
//  Created by Vinay Devdikar on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserClass : NSObject
{
    
    ParserClass *Parser_obj;
    
    NSString *strIRUserID,*strIRProperty,*strIRResiName,*strIRAPT,*strIRPhone,*strIRDesc,*strIRPreparedBy,*strIRWitness,*strIRAddress,*strIRPhone1,*strUserName,*strSavedDate;
    
    NSString *ReportID, *UserID ,*CreationDate ,*PropertyManager ,*Contractor ,*MaintancesSuper ,*Phoneno ,*StartTime ,*ActionTaken ,*EndTime ,*EmployeeName ,*Intials ,*Sign ,*SignDate;
    
    
  NSString *Report_ID  ,*User_ID ,*Creation_Date ,*FromDate ,*ToDate  ,*Property , *Manager,*A,*B,*C,*D,*E,*F,*G,*H,*I,*J,*K,*FirstDate ,*SecondDate ,*ThirdDate,*FourthDate;
    
    NSString *Building,*Activity,*strAIDesc,*selectedProperty,*resident_name,*unit_no,*room_type,*damage_type,*damage_cost;
    
    
    
    
  NSInteger column1,column2,column3,column4,column5,column6,column7,column8,column9,column10,column11,column12,column13,column14,column15,column16,column17,column18,column19,column20,column21,column22,column23,column24,column25,column26,column27,column28,column29,column30,column31,column32,column33,column34,column35,column36,column37,column38,column39,column40,column41,column42,column43,column44,column45,column46,column47,column48,column49,column50,column51,column52,column53,column54,column55,column56,column57,column58,column59,column60,column61,column62,column63,column64,column65,column66,column67,column68,column69,column70,column71,column72,column73,column74,column75,column76,column77,column78,column79,column80,column81,column82,column83,column84,column85,column86,column87,column88,column89,column90,column91,column92,column93,column94,column95,column96,column97,column98,column99,column100;

 NSInteger column101,column102,column103,column104,column105,column106,column107,column108,column109,column110,column111,column112,column113,column114,column115,column116,column117,column118,column119,column120,column121,column122,column123,column124,column125,column126,column127,column128,column129,column130,column131,column132,column133,column134,column135,column136,column137,column138,column139,column140,column141,column142,column143,column144,column145,column146,column147,column148,column149,column150,column151,column152,column153,column154,column155,column156,column157,column158,column159,column160,column161,column162,column163,column164,column165,column166,column167,column168,column169,column170,column171,column172,column173,column174,column175,column176,column177,column178,column179,column180,column181,column182,column183,column184,column185,column186,column187,column188,column189,column190,column191,column192,column193,column194,column195,column196,column197,column198,column199,column200;
    
      
}




@property(nonatomic,retain)NSString *Report_ID  ,*User_ID ,*Creation_Date ,*FromDate ,*ToDate  ,*Property , *Manager,*FirstDate ,*SecondDate,*ThirdDate,*FourthDate,*A,*B,*C,*D,*E,*F,*G,*H,*I,*J,*K;

@property (nonatomic, assign) NSInteger column1,column2,column3,column4,column5,column6,column7,column8,column9,column10,column11,column12,column13,column14,column15,column16,column17,column18,column19,column20,column21,column22,column23,column24,column25,column26,column27,column28,column29,column30,column31,column32,column33,column34,column35,column36,column37,column38,column39,column40,column41,column42,column43,column44,column45,column46,column47,column48,column49,column50,column51,column52,column53,column54,column55,column56,column57,column58,column59,column60,column61,column62,column63,column64,column65,column66,column67,column68,column69,column70,column71,column72,column73,column74,column75,column76,column77,column78,column79,column80,column81,column82,column83,column84,column85,column86,column87,column88,column89,column90,column91,column92,column93,column94,column95,column96,column97,column98,column99,column100;


@property (nonatomic, assign) NSInteger column101,column102,column103,column104,column105,column106,column107,column108,column109,column110,column111,column112,column113,column114,column115,column116,column117,column118,column119,column120,column121,column122,column123,column124,column125,column126,column127,column128,column129,column130,column131,column132,column133,column134,column135,column136,column137,column138,column139,column140,column141,column142,column143,column144,column145,column146,column147,column148,column149,column150,column151,column152,column153,column154,column155,column156,column157,column158,column159,column160,column161,column162,column163,column164,column165,column166,column167,column168,column169,column170,column171,column172,column173,column174,column175,column176,column177,column178,column179,column180,column181,column182,column183,column184,column185,column186,column187,column188,column189,column190,column191,column192,column193,column194,column195,column196,column197,column198,column199,column200;



@property (nonatomic, retain) NSString *strIRUserID,*strIRProperty,*strIRResiName,*strIRAPT,*strIRPhone,*strIRDesc,*strIRPreparedBy,*strIRWitness,*strIRAddress,*strIRPhone1,*strUserName,*strSavedDate;



@property (nonatomic, retain) NSString *ReportID ,*UserID ,*CreationDate ,*PropertyManager ,*Contractor ,*MaintancesSuper ,*Phoneno ,*StartTime ,*ActionTaken ,*EndTime ,*EmployeeName ,*Intials ,*Sign ,*SignDate;

@property (nonatomic, retain) NSString *Building,*Activity,*strAIDesc,*selectedProperty,*resident_name,*unit_no,*room_type,*damage_type,*damage_cost;


@end
