//
//  Recipes.m
//  miniGame
//
//  Created by 趴特萬 on 13/5/22.
//
//

#import "Recipes.h"
#import "PlsitRead.h"
@implementation Recipes
-(id)initWithIndex:(NSInteger)index{
    self=[super init];
    
    PlsitRead *read=[[PlsitRead alloc]initWithFileName:@"Property List.plist"];
    if (self) {
        self.name=[[[read readFromFile] objectAtIndex:index] objectForKey:@"菜名"];
        self.material=[[[read readFromFile]objectAtIndex:index]objectForKey:@"材料"];
        self.practice=[[[read readFromFile]objectAtIndex:index]objectForKey:@"做法"];
        
    }
    return self;
}


@end
