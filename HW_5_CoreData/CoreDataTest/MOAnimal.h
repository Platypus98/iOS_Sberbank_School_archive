//
//  MOAnimal.h
//  CoreDataTest
//
//  Created by Ilya on 18/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface MOAnimal : NSManagedObject

@property (nonatomic, assign) NSInteger index; /**< Порядковый номер */
@property (nonatomic, copy) NSString *name; /**< Наименование */
@property (nonatomic, assign) NSInteger legsCount; /**< Количество ног */

@end

NS_ASSUME_NONNULL_END
