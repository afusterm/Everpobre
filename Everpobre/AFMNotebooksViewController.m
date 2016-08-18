//
//  AFMNotebooksViewController.m
//  Everpobre
//
//  Created by Alejandro on 16/2/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNotebooksViewController.h"
#import "AFMNotebook.h"
#import "AFMNotebookCellView.h"
#import "AFMNotesTableViewController.h"

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
    
    // alta en notificación en sensor de proximidad
    UIDevice *dev = [UIDevice currentDevice];
    if ([self hasProximitySensor]) {
        // detectar cambios en el sensor de proximidad
        [dev setProximityMonitoringEnabled:YES];
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(proximityStateDidChange:)
                       name:UIDeviceProximityStateDidChangeNotification
                     object:nil];
    }
    
    // registramos el nib
    UINib *cellNib = [UINib nibWithNibName:@"AFMNotebookCellView"
                                    bundle:nil];
    [self.tableView registerNib:cellNib
         forCellReuseIdentifier:[AFMNotebookCellView cellId]];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
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
    AFMNotebookCellView *cell = [tableView dequeueReusableCellWithIdentifier:[AFMNotebookCellView cellId]];
    
    // sincronizar libreta -> celda
    cell.nameView.text = nb.name;
    cell.numberOfNotesView.text = [NSString stringWithFormat:@"%d", nb.notes.count];
    
    // devolver la celda
    return cell;
}

#pragma mark - TableView Delegate
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AFMNotebookCellView cellHeight];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AFMNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    AFMNotesTableViewController *notesVC = [[AFMNotesTableViewController alloc] initWithNotebook:nb];
    
    [self.navigationController pushViewController:notesVC
                                         animated:YES];
}

#pragma mark - Proximity Sensor

-(BOOL) hasProximitySensor {
    UIDevice *dev = [UIDevice currentDevice];
    BOOL oldValue = [dev isProximityMonitoringEnabled];
    [dev setProximityMonitoringEnabled:!oldValue];
    BOOL newValue = [dev isProximityMonitoringEnabled];
    
    [dev setProximityMonitoringEnabled:oldValue];
    
    return (oldValue != newValue);
}

// UIDeviceProximityStateDidChangeNotification
-(void) proximityStateDidChange:(NSNotification *) notification {
    // TODO: preguntar al usuario con un UIAlertView
    // NOTE: esto solo se puede probar con un iPhone físico
    [self.fetchedResultsController.managedObjectContext.undoManager undo];
}

@end
