//
//  GRPProgressView.h
//  GRPProgressView
//
//  Created by Alexey Levanov on 25/05/2019.
//  Copyright © 2019 Alexey Levanov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GRPProgressView : UIView

- (instancetype)initWithFrame:(CGRect)frame isVertical:(BOOL)isVertical;

/**
 Устанавливает новое значение прогресса с анимацией или без

 @param progress нормированное значение от 0 до 1
 @param withAnimation флаг анимации, если YES - изменения будут анимированны
 */
- (void)setProgress:(CGFloat)progress withAnimation:(BOOL)withAnimation;

@property (nonatomic, strong) UIColor *baseColor;	/**< Базовый цвет прогресс-бара */
@property (nonatomic, strong) UIColor *progressColor;	/**< Цвет заполнения прогресс бара */

@end

NS_ASSUME_NONNULL_END
