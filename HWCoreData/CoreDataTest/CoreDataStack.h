//
//  CoreDataStack.h
//  CoreDataTest
//
//  Created by Ilya on 18/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataStack : NSObject

@property (nonatomic, strong) NSManagedObjectContext *viewContext; /**< Контекст для чтения данных */
@property (nonatomic, strong) NSManagedObjectContext *writeContext; /**< Контекст для записи данных */

/**
 Создание/получение синглтона CoreDataStack
 
 @return CoreDataStack
 */
+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
