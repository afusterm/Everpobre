//
//  AFMPhotoViewController.m
//  Everpobre
//
//  Created by Alejandro on 21/08/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AFMPhotoViewController.h"
#import "AFMPhoto.h"

@import CoreImage;

@interface AFMPhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) AFMPhoto *model;
@end

@implementation AFMPhotoViewController

-(id) initWithModel:(id) model {
    NSAssert(model, @"Model can't be nil");
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
}

#pragma mark - View lifecicle

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.photoView.image = self.model.image;
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.model.image = self.photoView.image;
}

#pragma mark - Actions

- (IBAction)takePhoto:(id)sender {
    // Crear el image picker
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // Configurar. Comprobar si tiene cámara
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    // Asignar delegado
    picker.delegate = self;
    
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // Mostrarlo
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                         
                     }];
}

- (IBAction)deletePhoto:(id)sender {
    // Estado inicial
    CGRect oldBounds = self.photoView.bounds;
    
    // Eliminarla de la vista
    [UIView animateWithDuration:0.6
                          delay:0
                        options:0
                     animations:^{
                         self.photoView.bounds = CGRectZero;
                         self.photoView.alpha = 0;
                         self.photoView.transform = CGAffineTransformMakeRotation(M_2_PI);
                     } completion:^(BOOL finished) {
                         self.photoView.image = nil;
                         self.photoView.alpha = 1;
                         self.photoView.bounds = oldBounds;
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];
}

- (IBAction)applyVintageEffect:(id)sender {
    // Crear un contexto
    CIContext *ctxt = [CIContext contextWithOptions:nil];
    
    // Crear un CIImage de entrada
    CIImage *image = [CIImage imageWithCGImage:self.model.image.CGImage];
    
    // Crear un filtro
    CIFilter *old = [CIFilter filterWithName:@"CIFalseColor"];
    // Hay que llamar a setDefaults para que se asignen los valores por defecto. El constructor no lo hace.
    [old setDefaults];
    // El filtro CIFalseColor no entiende la propiedad kCIInputIntensityKey. Si se pone un valor en esta
    // propiedad lanzará una excepción
    [old setValue:image forKeyPath:kCIInputImageKey];
    
    // Creamos el vignette
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
    [vignette setDefaults];
    [vignette setValue:@12 forKeyPath:kCIInputIntensityKey];
    
    // Encadenamos los dos filtros
    [vignette setValue:old.outputImage forKeyPath:kCIInputImageKey];
    
    // Obtenemos imagen de salida
    CIImage *output = vignette.outputImage;
    
    // Aplicar el filtro
    [self.activityView startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGImageRef res = [ctxt createCGImage:output
                                    fromRect:[output extent]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityView stopAnimating];
            
            // Guardamos la nueva imagen
            UIImage *img = [UIImage imageWithCGImage:res];
            self.photoView.image = img;
            
            // Liberar el CGImageRef
            CGImageRelease(res);
        });
    });
}

- (IBAction)zoomToFace:(id)sender {
    NSArray *features = [self featuresInImage:self.photoView.image];
    
    if (features) {
        CIFeature *face = [features lastObject];
        CGRect faceBounds = [face bounds];
        
        CIImage *image = [CIImage imageWithCGImage:self.photoView.image.CGImage];
        CIImage *crop = [image imageByCroppingToRect:faceBounds];
        
        UIImage *newImage = [UIImage imageWithCIImage:crop];
        
        self.photoView.image = newImage;
    }
}

-(NSArray *) featuresInImage:(UIImage *) image {
    CIContext *ctxt = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:ctxt
                                              options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    CIImage *img = [CIImage imageWithCGImage:image.CGImage];
    
    NSArray *features = [detector featuresInImage:img];
    
    if ([features count]) {
        return features;
    }
    
    return nil;
}

#pragma mark - UIImagePickerControllerDelegate

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.model.image = img;
    
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];
}

@end
