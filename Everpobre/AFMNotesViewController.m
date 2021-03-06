//
//  AFMNotesViewController.m
//  Everpobre
//
//  Created by Alejandro on 18/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNotesViewController.h"
#import "AFMNote.h"
#import "AFMNoteCellView.h"
#import "AFMPhoto.h"
#import "AFMNoteViewController.h"
#import "AFMNotebook.h"

static NSString* const cellId = @"NoteCellId";

@interface AFMNotesViewController ()

@end

@implementation AFMNotesViewController

#pragma mark - View lifecycle

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self registerNib];
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95
                                                            alpha:1];
    self.title = @"Notas";
    self.detailViewControllerClassName = NSStringFromClass([AFMNoteViewController class]);
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addNewNote:)];
    
    self.navigationItem.rightBarButtonItem = add;
}

#pragma mark - Xib registration

-(void) registerNib {
    UINib *nib = [UINib nibWithNibName:@"AFMNoteCollectionViewCell"
                                bundle:nil];
    
   [self.collectionView registerNib:nib
         forCellWithReuseIdentifier:cellId];
}

#pragma mark - Data Source

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Obtener el objeto
    AFMNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Obtener una celda
    AFMNoteCellView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId
                                                                      forIndexPath:indexPath];
    
    // Configurar la celda
    [cell observeNote:note];
    
    return cell;
}

#pragma mark - Utils

-(void) addNewNote:(id) sender {
    AFMNoteViewController *newNoteVC = [[AFMNoteViewController alloc] initForNewNoteInNoteBook:self.notebook];
    [self.navigationController pushViewController:newNoteVC
                                         animated:YES];
}

@end
