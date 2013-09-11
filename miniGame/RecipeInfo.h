//
//  RecipeInfo.h
//  miniGame
//
//  Created by 趴特萬 on 13/3/27.
//
//

@protocol RecipeInFoDelegate <NSObject>
@optional
-(void)doThingAfterRecipeInfoIsOkFromDelegate;

@end
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "ASIHTTPRequest.h"

@interface RecipeInfo : NSObject<ASIHTTPRequestDelegate>{
    ASIHTTPRequest *asiRequest_Rec;
    ASIHTTPRequest *asiRequest_Loc;
    ASIHTTPRequest *asiRequest_Veg;
    
}

@property(nonatomic,strong)NSDictionary *dictionary_nmlData;
@property(nonatomic,weak)id<RecipeInFoDelegate>delegate;
@end
