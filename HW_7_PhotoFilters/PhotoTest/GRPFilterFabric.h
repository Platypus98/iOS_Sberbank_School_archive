//
//  GRPFilterFabric.h
//  PhotoTest
//
//  Created by Ilya on 09/06/2019.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRPFilterModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GRPFilterFabric : NSObject

- (GRPFilterModel *)createSepiaFilter;
- (GRPFilterModel *)createBoxBlurFilter;
- (GRPFilterModel *)createDiscBlurFilter;
- (GRPFilterModel *)createGaussianBlurFilter;
- (GRPFilterModel *)createMedianBlurFilter;
- (GRPFilterModel *)createMotionBlurFilter;
- (GRPFilterModel *)createZoomBlurFilter;

@end

NS_ASSUME_NONNULL_END
