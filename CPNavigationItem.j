/*
 * CPNavigationItem.j
 * CappuccinoExtensions
 *
 * Created by Nicholas Small.
 * Copyright 2009-2010, 280 North, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <Foundation/CPObject.j>


@implementation CPNavigationItem : CPObject
{
    CPNavigationBar     _navigationBar;
    CPViewController    _viewController;
    
    CPString            _title;
    CPView              _titleView;
    
    CPButton            _backButton;
    BOOL                _hidesBackButton;
    
    CPButton            _actionButton;
    BOOL                _hidesActionButton;
    
    CPView              _leftView;
    CPView              _rightView;
}

- (id)initWithTitle:(CPString)aTitle
{
    if (!aTitle)
        return nil;
    
    self = [super init];
    
    if (self)
    {
        [self setTitle:aTitle];
    }
    
    return self;
}

- (void)setTitle:(CPString)aTitle
{
    if (!aTitle || _title == aTitle)
        return;
    
    _title = [aTitle copy];
    
    if ([_titleView isKindOfClass:CPTextField])
    {
        [_titleView setStringValue:_title];
        [_titleView sizeToFit];
    }
    
    if ([_backButton isKindOfClass:CPButton])
    {
        [_backButton setTitle:_title];
        [_backButton sizeToFit];
    }
    
    [_navigationBar _layoutSubviewsAnimated:NO];
}

- (CPString)title
{
    return _title;
}

- (void)setTitleView:(CPView)aView
{
    if (_titleView == aView)
        return;
    
    _titleView = aView;
}

- (CPView)titleView
{
    return _titleView;
}

// Back Button

- (void)setBackButton:(CPButton)aButton
{
    if (_backButton == aButton)
        return;
    
    _backButton = aButton;
}

- (CPButton)backButton
{
    return _backButton;
}

- (void)setHidesBackButton:(BOOL)aFlag animated:(BOOL)animated
{
    if (_hidesBackButton == aFlag)
        return;
    
    _hidesBackButton = aFlag;
    
    [_navigationBar _setBackView:_hidesBackButton ? nil : [_navigationBar backView] animated:animated];
}

- (BOOL)hidesBackButton
{
    return _hidesBackButton;
}

// Action Button

- (void)setActionButton:(CPButton)aButton animated:(BOOL)animated
{
    if (_actionButton == aButton)
        return;
    
    _actionButton = aButton;
    
    [_navigationBar _setActionView:_actionButton animated:animated];
}

- (CPButton)actionButton
{
    return _actionButton;
}

- (void)setHidesActionButton:(BOOL)aFlag animated:(BOOL)animated
{
    if (_hidesActionButton == aFlag)
        return;
    
    _hidesActionButton = aFlag;
    
    [_navigationBar _setActionButton:_hidesActionButton ? nil : [_navigationBar actionView]];
}

- (BOOL)hidesActionButton
{
    return _hidesActionButton;
}

// Left/Right Views

- (void)setLeftView:(CPView)aView animated:(BOOL)animated
{
    _leftView = aView;
    
    [_navigationBar _setLeftView:_leftView animated:animated];
}

- (CPView)leftView
{
    return _leftView;
}

- (void)setRightView:(CPView)aView animated:(BOOL)animated
{
    _rightView = aView;
    
    [_navigationBar _setRightView:_rightView animated:animated];
}

- (CPView)rightView
{
    return _rightView;
}

- (CPButton)buttonForActionButton
{
    var button = [[CPButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 90.0, 24.0)];
    [button setTitle:@"Action"];
    [button setDefaultButton:YES];
    
    return button;
}

@end
