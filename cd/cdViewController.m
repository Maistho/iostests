//
//  cdViewController.m
//  cd
//
//  Created by Gustav Bylund on 31/07/14.
//  Copyright (c) 2014 Instutitionen för datavetenskap, Linköpings Universitet. All rights reserved.
//

#import "cdViewController.h"

@interface cdViewController ()

@end

@implementation cdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)b1:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSManagedObject *newContact;
    
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    [newContact setValue: _l1.text forKey:@"name"];
    [newContact setValue: _l2.text forKey:@"price"];
    
    _l1.text = @"";
    _l2.text = @"";
    NSError *error;
    [context save:&error];
    
    _status.text = @"wow";
}

- (IBAction)b2:(id)sender {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", _l1.text];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;
    NSError *error;
    
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        _status.text = @"no matches";
    } else {
        matches = objects[0];
        _l1.text = [matches valueForKey:@"name"];
        _l2.text = [matches valueForKey:@"price"];
    }
}
@end
