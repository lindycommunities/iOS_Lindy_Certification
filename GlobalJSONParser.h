//
//  GlobalJSONParser.h
//  PatientIntake
//
//  Created by Sudip Deshpande on 21/02/13.
//
//

#import <Foundation/Foundation.h>
@protocol WsCompleteDelegate
-(void) RequestFinished:(NSDictionary*)JsonDictionary;
-(void) RequestError;

@end
@interface GlobalJSONParser : NSObject
{
 
    
        NSArray *jsonArray;
        NSMutableData *jsonData;
        NSDictionary *dic;
    id <WsCompleteDelegate> delegate;
}
@property (retain, nonatomic) id <WsCompleteDelegate> delegate;
@property (retain, nonatomic) NSString *flag,*PostData,*PostCommand;

    @property (nonatomic,retain) NSDictionary *dic;
    -(id)initWithJSONString:(NSString *)JSON;
-(id)initWithJSONString:(NSString *)JSON Image:(NSData *)imgview;
-(id)initWithJSONStringIMAGE:(NSString *)JSONIMAGE;
-(id)initWithJSONString:(NSString *)JSON ANDPOSTData:(NSString *)_postData;
-(id)initWithJSONStringPDF:(NSString *)JSON ANDPOSTData:(NSString *)_postData;

-(id)initWithJSONStringPDF:(NSString *)JSON;

@end
