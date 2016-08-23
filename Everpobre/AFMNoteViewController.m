//
//  AFMNoteViewController.m
//  Everpobre
//
//  Created by Alejandro on 19/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMNoteViewController.h"
#import "AFMNote.h"
#import "AFMPhoto.h"
#import "AFMNotebook.h"
#import "AFMPhotoViewController.h"

@interface AFMNoteViewController () <UITextFieldDelegate>
@property (nonatomic, strong) AFMNote *model;
@property (nonatomic) BOOL new;
@property (nonatomic) BOOL deleteCurrentNote;
@end

@implementation AFMNoteViewController

#pragma mark - Init

-(id) initWithModel:(id) model {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    
    return self;
}

-(id) initForNewNoteInNoteBook:(AFMNotebook *) notebook {
    AFMNote *newNote = [AFMNote noteWithName:@""
                                    notebook:notebook
                                     context:notebook.managedObjectContext];
    
    _new = YES;
    return [self initWithModel:newNote];
}

#pragma mark - View lifecycle

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // modelo -> vista
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterLongStyle;
    
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    self.nameView.text = self.model.name;
    self.textView.text = self.model.text;
    
    UIImage *img = self.model.photo.image;
    if (!img) {
        img = [UIImage imageNamed:@"noImage.png"];
    }
    
    self.photoView.image = img;
    
    [self startObservingKeyboard];
    [self setupInputAccessoryView];
    
    if (self.new) {
        // Mostramos el botón de cancelar
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(cancel:)];
        self.navigationItem.rightBarButtonItem = cancel;
    }
    
    self.nameView.delegate = self;
    
    // Añadimos un gesture recognizer a la foto
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(displayDetailPhoto:)];
    [self.photoView addGestureRecognizer:tap];
    
    // Añadimos botón de compartir nota
    UIBarButtonItem *share = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                           target:self
                                                                           action:@selector(displayShareController:)];
    self.navigationItem.rightBarButtonItem = share;
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.deleteCurrentNote) {
        [self.model.managedObjectContext deleteObject:self.model];
    } else {
        // vista -> modelo
        self.model.text = self.textView.text;
        self.model.photo.image = self.photoView.image;
        self.model.name = self.nameView.text;
    }
    
    [self stopObservingKeyboard];
}

#pragma mark - Keyboard

-(void) startObservingKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDissapear:)
               name:UIKeyboardWillHideNotification
             object:nil];
}

-(void) stopObservingKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

-(void) notifyThatKeyboardWillAppear:(NSNotification *) notification {
    if ([self.textView isFirstResponder]) {
        // Extraer el userInfo
        NSDictionary *dict = notification.userInfo;
        
        // Extraer la duración de la animación
        double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        // Cambiar las propiedades de la caja de texto
        [UIView animateWithDuration:duration
                              delay:0
                            options:0
                         animations:^{
                             self.textView.frame = CGRectMake(self.modificationDateView.frame.origin.x,
                                                              self.modificationDateView.frame.origin.y,
                                                              self.textView.frame.size.width,
                                                              self.textView.frame.size.height);
                         } completion:nil];
        
        [UIView animateWithDuration:duration
                         animations:^{
                             self.textView.alpha = 0.8;
                         }];
    }
}

-(void) notifyThatKeyboardWillDissapear:(NSNotification *) notification {
    if ([self.textView isFirstResponder]) {
        // Extraer el userInfo
        NSDictionary *dict = notification.userInfo;
        
        // Extraer la duración de la animación
        double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        // Cambiar las propiedades de la caja de texto
        [UIView animateWithDuration:duration
                              delay:0
                            options:0
                         animations:^{
                             self.textView.frame = CGRectMake(0,
                                                              320,
                                                              self.textView.frame.size.height,
                                                              self.textView.frame.size.width);
                         } completion:nil];
        
        [UIView animateWithDuration:duration
                         animations:^{
                             self.textView.alpha = 1;
                         }];
    }
}

-(void) setupInputAccessoryView {
    // Creamos una barra
    UIToolbar *textBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    UIToolbar *nameBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    // Añadimos botones
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                          target:self
                                                                          action:@selector(dismissKeyboard:)];
    
    UIBarButtonItem *sep = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                         target:nil
                                                                         action:nil];
    
    UIBarButtonItem *smile = [[UIBarButtonItem alloc] initWithTitle:@":-)"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(insertTitle:)];
    
    [textBar setItems:@[smile, sep, done]];
    [nameBar setItems:@[sep, done]];
    
    // La asignamos como accessoryInputView
    self.textView.inputAccessoryView = textBar;
    self.nameView.inputAccessoryView = nameBar;
}

-(void) dismissKeyboard:(id) sender {
    [self.view endEditing:YES];
}

-(void) insertTitle:(UIBarButtonItem *) sender {
    [self.textView insertText:sender.title];
}

#pragma mark - Utils

-(void) cancel:(id) sender {
    self.deleteCurrentNote = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSArray *) arrayOfItems {
    NSMutableArray *items = [NSMutableArray array];
    
    if (self.model.name) {
        [items addObject:self.model.name];
    }
    
    if (self.model.text) {
        [items addObject:self.model.text];
    }
    
    if (self.model.photo.image) {
        [items addObject:self.model.photo.image];
    }
    
    return items;
}

#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    // Podríamos validar el texto
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Actions

-(void) displayDetailPhoto:(id) sender {
    if (self.model.photo == nil) {
        self.model.photo = [AFMPhoto photoWithImage:nil
                                            context:self.model.managedObjectContext];
    }
                            
    AFMPhotoViewController *pVC = [[AFMPhotoViewController alloc] initWithModel:self.model.photo];
    
    [self.navigationController pushViewController:pVC
                                         animated:YES];
}

-(void) displayShareController:(id) sender {
    // Crear un UIActivityController
    UIActivityViewController *avc = [[UIActivityViewController alloc] initWithActivityItems:[self arrayOfItems]
                                                                      applicationActivities:nil];
    
    // Lo presentamos
    [self presentViewController:avc
                       animated:YES
                     completion:nil];
}

@end
