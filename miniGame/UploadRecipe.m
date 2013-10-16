//
//  UploadRecipe.m
//  miniGame
//
//  Created by 趴特萬 on 13/5/31.
//
//

#import "UploadRecipe.h"
#import "ASIHTTPRequest.h"
@interface UploadRecipe ()

@end

@implementation UploadRecipe

- (void)viewDidLoad
{
    [super viewDidLoad];
    webGetter=[[WebJsonDataGetter alloc]init];
    [webGetter setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doThingAfterRecipeInfoIsOkFromDelegate{
    //NSLog(@"Delegate %@",myRecipe.dictionary_nmlData );
}
- (IBAction)submit:(id)sender {
    NSString *input=[NSString stringWithFormat:@"http://54.244.225.229/shacookie/add.php?name=%@&Food=%@&Step=%@",_name.text,_food.text,_step.text];
    NSData *dateUrl=[NSData dataWithContentsOfURL:[NSURL URLWithString:input]];
    
    NSString *result=[[NSString alloc] initWithData:dateUrl encoding:NSUTF8StringEncoding] ;
    NSLog(@"%@",result);
    //_name:[obj];
    //_name=(@"ddd %@",[myRecipe.dictionary_nmlData objectForKey:@"name"]  );
    //_name1=[myRecipe.dictionary_nmlData objectForKey:@"name"];
    //NSLog(@"%@",_name1);
    // NSLog(@"--:%@",[[_name objectAtIndex:1] objectForKey:@"name"]);
    
    
}
@end
