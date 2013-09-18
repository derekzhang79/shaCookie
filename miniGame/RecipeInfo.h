//
//  RecipeInfo.h
//  miniGame
//
//  Created by 趴特萬 on 13/3/27.
//
//

@protocol RecipeInFoDelegate <NSObject>
@required
-(void)doThingAfterRecipeInfoIsOkFromDelegate;

@end
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import <CoreLocation/CoreLocation.h>

@interface RecipeInfo : NSObject<ASIHTTPRequestDelegate>{
    ASIHTTPRequest *asiRequest_Rec;
    ASIHTTPRequest *asiRequest_Loc;
    ASIHTTPRequest *asiRequest_Veg;
    
}

@property(nonatomic,strong)NSArray *dictionary_nmlData;
@property(nonatomic,weak)id<RecipeInFoDelegate>delegate;
-(id)initWithURLString:(NSString*)str_url;
@end