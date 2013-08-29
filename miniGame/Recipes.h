//
//  Recipes.h
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import <Foundation/Foundation.h>

@interface Recipes : NSObject

-(id)initWithIndex:(NSInteger)index;

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSArray *material;
@property(nonatomic,strong)NSArray *practice;
@end