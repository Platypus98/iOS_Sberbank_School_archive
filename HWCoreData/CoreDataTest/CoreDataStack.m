//
//  CoreDataStack.m
//  CoreDataBlah
//
//  Created by Владислав Усачёв on 18/06/2019.
//  Copyright © 2019 Владислав Усачёв. All rights reserved.
//

#import "CoreDataStack.h"


@interface CoreDataStack ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, strong) NSManagedObjectModel *objectModel;

@end


@implementation CoreDataStack

+ (instancetype)shared
{
    static dispatch_once_t once;
    static CoreDataStack *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [CoreDataStack new];
    });
    return sharedInstance;
}

- (NSManagedObjectContext *)writeContext
{
    if (_writeContext)
    {
        return _writeContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self coordinator];
    if (coordinator)
    {
        _writeContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    }
    _writeContext.parentContext = [self viewContext];
    return _writeContext;
}

- (NSManagedObjectContext *)viewContext
{
    if (_viewContext)
    {
        return _viewContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self coordinator];
    if (coordinator)
    {
        _viewContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    }
    [_viewContext setPersistentStoreCoordinator:coordinator];
    return _viewContext;
}

- (NSPersistentStoreCoordinator *)coordinator
{
    if (_coordinator)
    {
        return _coordinator;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *urlDirectory = [[[NSURL URLWithString:documentsDirectory] URLByAppendingPathComponent:@"CoreData.sqlite"] absoluteString];
    NSError *error;
    NSURL *url = [NSURL fileURLWithPath:urlDirectory isDirectory:NO];
    
    _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self objectModel]];
    
    if (![_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:@{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES} error:&error])
    {
        NSLog(@"%@", [error localizedFailureReason]);
        abort();
    }
    
    return _coordinator;
}

- (NSManagedObjectModel *)objectModel
{
    if (_objectModel)
    {
        return _objectModel;
    }
    
    NSURL *objectModelDirectory = [[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"];
    _objectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:objectModelDirectory];
    return _objectModel;
}

@end

