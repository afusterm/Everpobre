//
//  AppDelegate.m
//  Everpobre
//
//  Created by Alejandro on 13/2/16.
//  Copyright © 2016 Alejandro. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTSimpleCoreDataStack.h"

#import "AFMNotebook.h"
#import "AFMNote.h"
#import "AFMNotebooksViewController.h"
#import "UIViewController+Navigation.h"
#import "AFMLocation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // crear una instancia del stack Core Data
    self.model = [AGTSimpleCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // ¿Añadimos datos chorras?
    if (ADD_DUMMY_DATA) {
        [self addDummyData];
    }
    
    // Iniciamos el inspector del contexto
    [self printContextState];
    
    [self autoSave];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AFMNotebook entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AFMNamedEntityAttributes.modificationDate
                                                          ascending:NO],
                            [NSSortDescriptor sortDescriptorWithKey:AFMNamedEntityAttributes.name
                                                          ascending:YES]];
    
    // tamaño del lote en que va a ir cargando. Una guía para el tamaño es poner el doble
    // de los datos que se vayan a mostrar. Para 10 celdas poner 20.
    req.fetchBatchSize = 20;
    
    NSFetchedResultsController *results = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:self.model.context
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil];
    
    AFMNotebooksViewController *nbVC = [[AFMNotebooksViewController alloc]
                                        initWithFetchedResultsController:results
                                        style:UITableViewStylePlain];
    
    self.window.rootViewController = [nbVC wrappedInNavigation];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [self save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Utils
-(void) addDummyData{
    
    [self.model zapAllData];
    
    AFMNotebook *novias = [AFMNotebook notebookWithName:@"Ex-novias para el recuerdo"
                                                context:self.model.context];
    
    [AFMNote noteWithName:@"Camila Dávalos"
                 notebook:novias
                  context:self.model.context];
    
    [AFMNote noteWithName:@"Mariana Dávalos"
                 notebook:novias
                  context:self.model.context];
    
    [AFMNote noteWithName:@"Pampita"
                 notebook:novias
                  context:self.model.context];
    
    AFMNotebook *lugares = [AFMNotebook notebookWithName:@"Lugares donde me han pasado cosas raras"
                                                 context:self.model.context];
    
    [AFMNote noteWithName:@"Puerta del Sol"
                 notebook:lugares
                  context:self.model.context];
    [AFMNote noteWithName:@"Tatooine"
                 notebook:lugares
                  context:self.model.context];
    [AFMNote noteWithName:@"Dantooine"
                 notebook:lugares
                  context:self.model.context];
    [AFMNote noteWithName:@"Solaria"
                 notebook:lugares
                  context:self.model.context];
    
    // Guardamos
    [self save];
    
}

-(void) trastearConDatos {
    AFMNotebook *novias = [AFMNotebook notebookWithName:@"Ex-novias para el recuerdo"
                                                context:self.model.context];
    [AFMNote noteWithName:@"Camila Dávalos"
                 notebook:novias
                  context:self.model.context];
    AFMNote *pampita = [AFMNote noteWithName:@"Pampita"
                                    notebook:novias
                                     context:self.model.context];
    
    // buscar
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:[AFMNote entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AFMNamedEntityAttributes.name
                                                          ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:AFMNamedEntityAttributes.modificationDate
                        
                                                          ascending:NO]];
    
    NSArray *results = [self executeFetchRequest:req
                                  withErrorBlock:^(NSError *error) {
                                      NSLog(@"Error al buscar: %@", error);
                                  }];
    if (results != nil) {
        NSLog(@"Results %@", results);
    }
    
    // eliminamos
    [self.model.context deleteObject:pampita];
    
    // guardamos
    [self save];
}

-(void) save {
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %s \n\n %@", __func__, error);
    }];
}

-(void) autoSave {
    if (AUTO_SAVE) {
        NSLog(@"Autoguardando...");
        [self save];
        
        [self performSelector:@selector(autoSave)
                   withObject:nil
                   afterDelay:2];

    }
}

-(NSArray *) executeFetchRequest:(NSFetchRequest *) request
                  withErrorBlock:(void (^)(NSError *error)) errorBlock {
    NSError *err = nil;
    NSArray *results = [self.model.context executeFetchRequest:request
                                                         error:&err];
    
    if (results == nil) {
        errorBlock(err);
    }
    
    return results;
}

#pragma mark - Predicate Playground

-(void) predicateTest {
    NSPredicate *novias = [NSPredicate predicateWithFormat:@"notebook.name ==[cd] 'Ex-novias para el recuerdo'"];
    NSPredicate *davalos = [NSCompoundPredicate andPredicateWithSubpredicates:@[novias, [NSPredicate predicateWithFormat:@"name ENDSWITH[cd] 'davalos'"]]];
    NSPredicate *pampita = [NSCompoundPredicate andPredicateWithSubpredicates:@[novias, [NSPredicate predicateWithFormat:@"name CONTAINS[cd] 'pampita'"]]];
    
    // fetch request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AFMNote entityName]];
    NSArray *results = nil;
    
    // Ex-novias
    req.predicate = novias;
    results = [self.model executeRequest:req
                               withError:^(NSError *error) {
                                   NSLog(@"Error buscando %@", req);
                               }];
    
    NSLog(@"Results:\n %@", results);
    
    // Davalos
    req.predicate = davalos;
    results = [self.model executeRequest:req
                               withError:^(NSError *error) {
                                   NSLog(@"Error buscando %@", req);
                               }];
    
    NSLog(@"Results:\n %@", results);
    
    // pampita
    req.predicate = pampita;
    results = [self.model executeRequest:req
                               withError:^(NSError *error) {
                                   NSLog(@"Error buscando %@", req);
                               }];
    
    NSLog(@"Results:\n %@", results);
}

-(void) printContextState {
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AFMNotebook entityName]];
    NSUInteger numNotebooks = [[self.model executeRequest:req
                                                withError:nil] count];
    
    req = [NSFetchRequest fetchRequestWithEntityName:[AFMNote entityName]];
    NSUInteger numNotes = [[self.model executeRequest:req
                                            withError:nil] count];
    
    req = [NSFetchRequest fetchRequestWithEntityName:[AFMLocation entityName]];
    NSUInteger numLocations = [[self.model executeRequest:req
                                                withError:nil] count];
    printf("-----------------------------------------------------------\n");
    printf("Total numbers of objects:   %lu\n", (unsigned long) self.model.context.registeredObjects.count);
    printf("Number of notebooks:        %lu\n", (unsigned long) numNotebooks);
    printf("Number of notes:            %lu\n", (unsigned long) numNotes);
    printf("Number of locations:        %lu\n", (unsigned long) numLocations);
    printf("-----------------------------------------------------------\n");
    
    [self performSelector:@selector(printContextState)
               withObject:nil
               afterDelay:5];
}

@end
