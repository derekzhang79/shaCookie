//
//  RecipeInfo.m
//  miniGame
//
//  Created by 趴特萬 on 13/3/27.
//
//

#import "RecipeInfo.h"
#import <CoreLocation/CoreLocation.h>
#import "JSON.h"
@interface RecipeInfo ()

@end

@implementation RecipeInfo
-(id)init{
    self=[super init];
    if (self) {
        
        //NSString *url_String_Rec=[NSString stringWithFormat:@"http://54.244.225.229/shacookie/jsonrecipe.php"];
        NSString *url_String_Loc=[NSString stringWithFormat:@"http://54.244.225.229/shacookie/jsondevicelocation.php"];
        //NSString *url_String_Veg=[NSString stringWithFormat:@"http://54.244.225.229/shacookie/jsonVegetables.php"];
        //NSURL *url_Rec=[NSURL URLWithString:url_String_Rec];
        NSURL *url_Loc=[NSURL URLWithString:url_String_Loc];
        //NSURL *url_Veg=[NSURL URLWithString:url_String_Veg];
        //asiRequest_Rec=[ASIHTTPRequest requestWithURL:url_Rec];
        asiRequest_Loc=[ASIHTTPRequest requestWithURL:url_Loc];
        //asiRequest_Veg=[ASIHTTPRequest requestWithURL:url_Veg];
        //[asiRequest_Rec setDelegate:self];
        //[asiRequest_Rec startAsynchronous];
        [asiRequest_Loc setDelegate:self];
        [asiRequest_Loc startAsynchronous];
        //[asiRequest_Veg setDelegate:self];
        //[asiRequest_Veg startAsynchronous];
    }
    return self;
}



-(void)requestFinished:(ASIHTTPRequest *)request{
    NSString *jsonStr=[[NSString alloc]initWithData:request.responseData encoding:NSUTF8StringEncoding];
    
    SBJsonParser *jsonStrParser=[[SBJsonParser alloc]init];
    self.dictionary_nmlData=[jsonStrParser objectWithString:jsonStr error:nil];
    [self.delegate doThingAfterRecipeInfoIsOkFromDelegate];
    
}
-(void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"Fail");
}

@end