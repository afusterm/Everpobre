//
//  AFMNotesTableViewController.m
//  Everpobre
//
//  Created by Alejandro on 5/3/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNotesTableViewController.h"
#import "AFMNote.h"
#import "AFMNotebook.h"

@interface AFMNotesTableViewController ()
@property (strong, nonatomic) AFMNotebook* model;
@end

@implementation AFMNotesTableViewController

-(id) initWithNotebook:(AFMNotebook *) notebook {
    // crear el fetchedResults
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AFMNote entityName]];
    req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", notebook];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AFMNamedEntityAttributes.name
                                                          ascending:YES]];
    
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:notebook.managedObjectContext
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil];
    if (self = [super initWithFetchedResultsController:fetched
                                                 style:UITableViewStylePlain]) {
        self.fetchedResultsController = fetched;
        self.model = notebook;
        self.title = notebook.name;
    }
    
    return self;
}

#pragma mark - data source

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AFMNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    static NSString *cellId = @"NoteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = note.name;
    
    return cell;
}

@end
