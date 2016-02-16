//
//  AFMNotebooksViewController.m
//  Everpobre
//
//  Created by Alejandro on 16/2/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNotebooksViewController.h"
#import "AFMNotebook.h"

@interface AFMNotebooksViewController ()

@end

@implementation AFMNotebooksViewController

#pragma mark - View Lifecycle

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"Everpobre";
    
    // crear un botón, con un target y un action
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addNotebook:)];
    
    // lo añadimos a la barra de navegación
    self.navigationItem.rightBarButtonItem = addButton;
    
    // ponemos el botón de edición
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

#pragma mark - Actions

-(void) addNotebook:(id) sender {
    // nueva instancia de AFMNotebook
    [AFMNotebook notebookWithName:@"New Notebook"
                          context:self.fetchedResultsController.managedObjectContext];
}

#pragma mark - Data Source

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // averiguar de qué libreta me está hablando
        AFMNotebook *del = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // quitarla del modelo
        [self.fetchedResultsController.managedObjectContext deleteObject:del];
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // averiguar el notebook
    AFMNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // crear una celda
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    // sincronizar libreta -> celda
    cell.textLabel.text = nb.name;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateStyle = NSDateIntervalFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:nb.modificationDate];
    
    // devolver la celda
    return cell;
}

@end
