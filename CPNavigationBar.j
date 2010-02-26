/*
 * CPNavigationBar.j
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

@import <AppKit/CPView.j>


@implementation CPNavigationBar : CPView
{
    id                  _delegate;
    
    CPArray             _items;
    
    CPTextField         _titleView;
    CPView              _backView;
    CPView              _actionView;
    
    CPView              _leftView;
    CPView              _rightView;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self setAutoresizingMask:CPViewWidthSizable];
        [self setBackgroundColor:[CPColor colorWithPatternImage:[[CPImage alloc] initWithContentsOfFile:[[CPBundle bundleForClass:[self class]] pathForResource:@"NavigationBar.png"] size:CGSizeMake(1.0, 36.0)]]];
    }
    
    return self;
}

- (void)viewWillMoveToSuperview:(CPView)aView
{
    [self setFrame:CGRectMake(0.0, 0.0, CGRectGetWidth([aView bounds]), 36.0)];
}

- (void)pushNavigationItem:(CPNavigationItem)anItem animated:(BOOL)animated
{
    animated = !!animated;
    
    if ([_items containsObject:anItem])
        return;
    
    if (!_items)
        _items = [CPArray array];
    
    if ([_delegate respondsToSelector:@selector(navigationBar:shouldPushItem:)])
        if (![_delegate navigationBar:self shouldPushItem:anItem])
            return;
    
    ([_items lastObject] || {})._navigationBar = nil;
    
    anItem._navigationBar = self;
    [_items addObject:anItem];
    
    [self _layoutSubviewsAnimated:animated];
    
    if ([_delegate respondsToSelector:@selector(navigationBar:didPushItem:)])
        [_delegate navigationBar:self didPushItem:anItem];
}

- (void)popToNavigationItem:(CPNavigationItem)anItem animated:(BOOL)animated
{
    animated = !!animated;
    
    if (!_items || [_items count] <= 1)
        return;
    
    if ([_delegate respondsToSelector:@selector(navigationBar:shouldPopItem:)])
        if (![_delegate navigationBar:self shouldPopItem:anItem])
            return;
    
    var item = [_items lastObject];
    if (item)
        item._navigationBar = nil;
    
    var count = [_items count] - 1,
        index = [_items indexOfObject:anItem];
    
    for (; count > index; count--)
        [_items removeLastObject];
    
    var item = [_items lastObject];
    if (item)
        item._navigationBar = self;
    
    [self _layoutSubviewsAnimated:animated];
    
    if ([_delegate respondsToSelector:@selector(navigationBar:didPopItem:)])
        [_delegate navigationBar:self didPopItem:anItem];
}

- (void)popNavigationItemAnimated:(BOOL)animated
{
    [self popToNavigationItem:[self backItem] animated:animated];
}

- (void)setItems:(CPArray)anArray animated:(BOOL)animated
{
    _items = [CPArray array];
    
    var count = [anArray count];
    for (var i = 0; i < count; i++)
        [self pushNavigationItem:anArray[i] animated:(animated && i == count - 1) ? animated : NO];
}

- (CPArray)items
{
    return _items;
}

- (CPNavigationItem)topItem
{
    return [_items lastObject];
}

- (CPNavigationItem)backItem
{
    if ([_items count] > 1)
        return [_items objectAtIndex:[_items count] - 2];
}

- (void)setDelegate:(id)aDelegate
{
    _delegate = aDelegate;
}

- (id)delegate
{
    return _delegate;
}

// Views

- (void)_setTitleView:(CPView)aView animated:(BOOL)animated
{
    if (_titleView)
    {
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_titleView];
            [anim addProperty:@"alphaValue" start:1.0 end:0.0];
            [anim setDuration:0.3];
            [anim removeFromSuperviewOnEnd:YES];
            [anim startAnimation];
        }
        else
            [_titleView removeFromSuperview];
    }
    
    _titleView = aView;
    
    if (_titleView)
    {
        [_titleView setFrameOrigin:CGPointMake(CGRectGetMidX([self bounds]) - CGRectGetMidX([_titleView bounds]), 3.0)];
        [_titleView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
        
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_titleView];
            [anim addProperty:@"alphaValue" start:0.0 end:1.0];
            [anim setDuration:0.3];
            [anim addToViewOnStart:self];
            [anim startAnimation];
        }
        else
            [self addSubview:_titleView];
    }
}

- (CPView)titleView
{
    return _titleView;
}

- (void)_setBackView:(CPView)aView animated:(BOOL)animated
{
    if (_backView)
    {
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_backView];
            [anim addProperty:@"alphaValue" start:1.0 end:0.0];
            [anim setDuration:0.3];
            [anim removeFromSuperviewOnEnd:YES];
            [anim startAnimation];
        }
        else
            [_backView removeFromSuperview];
    }
    
    _backView = aView;
    
    if (_backView)
    {
        [_backView setFrameOrigin:CGPointMake(CGRectGetMinX([_titleView frame]) - CGRectGetWidth([_backView bounds]) - 20.0, 6.0)];
        [_backView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
        
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_backView];
            [anim addProperty:@"alphaValue" start:0.0 end:1.0];
            [anim setDuration:0.3];
            [anim addToViewOnStart:self];
            [anim startAnimation];
        }
        else
            [self addSubview:_backView];
    }
}

- (CPView)backView
{
    return _backView;
}

- (void)_setActionView:(CPView)aView animated:(BOOL)animated
{
    if (_actionView)
    {
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_actionView];
            [anim addProperty:@"alphaValue" start:1.0 end:0.0];
            [anim setDuration:0.3];
            [anim removeFromSuperviewOnEnd:YES];
            [anim startAnimation];
        }
        else
            [_actionView removeFromSuperview];
    }
    
    _actionView = aView;
    
    if (_actionView)
    {
        [_actionView setFrameOrigin:CGPointMake(CGRectGetMaxX([_titleView frame]) + 20.0, 6.0)];
        [_actionView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
        
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_actionView];
            [anim addProperty:@"alphaValue" start:0.0 end:1.0];
            [anim setDuration:0.3];
            [anim addToViewOnStart:self];
            [anim startAnimation];
        }
        else
            [self addSubview:_actionView];
    }
}

- (CPView)actionView
{
    return _actionView;
}

- (void)_setLeftView:(CPView)aView animated:(BOOL)animated
{
    if (_leftView)
    {
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_leftView];
            [anim addProperty:@"alphaValue" start:1.0 end:0.0];
            [anim setDuration:0.3];
            [anim removeFromSuperviewOnEnd:YES];
            [anim startAnimation];
        }
        else
            [_leftView removeFromSuperview];
    }
    
    _leftView = aView;
    
    if (_leftView)
    {
        [_leftView setFrameOrigin:CGPointMake(6.0, CGRectGetMinY([_leftView frame]) || 6.0)];
        
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_leftView];
            [anim addProperty:@"alphaValue" start:0.0 end:1.0];
            [anim setDuration:0.3];
            [anim addToViewOnStart:self];
            [anim startAnimation];
        }
        else
            [self addSubview:_leftView];
    }
}

- (void)_setRightView:(CPView)aView animated:(BOOL)animated
{
    if (_rightView)
    {
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_rightView];
            [anim addProperty:@"alphaValue" start:1.0 end:0.0];
            [anim setDuration:0.3];
            [anim removeFromSuperviewOnEnd:YES];
            [anim startAnimation];
        }
        else
            [_rightView removeFromSuperview];
    }
    
    _rightView = aView;
    
    if (_rightView)
    {
        [_rightView setFrameOrigin:CGPointMake(CGRectGetWidth([self bounds]) - CGRectGetWidth([_rightView bounds]) - 6.0, CGRectGetMinY([_rightView frame]) || 6.0)];
        [_rightView setAutoresizingMask:CPViewMinXMargin];
        
        if (animated)
        {
            var anim = [[CPPropertyAnimation alloc] initWithView:_rightView];
            [anim addProperty:@"alphaValue" start:0.0 end:1.0];
            [anim setDuration:0.3];
            [anim addToViewOnStart:self];
            [anim startAnimation];
        }
        else
            [self addSubview:_rightView];
    }
}

- (void)_layoutSubviewsAnimated:(BOOL)animated
{
    var anItem = [self topItem];
    
    // Title
    
    var titleView = [anItem titleView];
    if (!titleView)
    {
        titleView = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
        [titleView setFont:[CPFont boldSystemFontOfSize:22.0]];
        [titleView setTextShadowColor:[CPColor whiteColor]];
        [titleView setTextShadowOffset:CGSizeMake(0.0, 1.0)];
        [titleView setStringValue:[anItem title]];
        [titleView sizeToFit];
        
        [anItem setTitleView:titleView];
    }
    
    [self _setTitleView:titleView animated:animated];
    
    var backItem = [self backItem];
    
    if (backItem && ![anItem hidesBackButton])
    {
        var backButton = [backItem backButton];
        
        if (!backButton)
        {
            backButton = [[CPButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 90.0, 24.0)];
            [backButton setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin];
            [backButton setTitle:[backItem title]];
            [backButton setTarget:self];
            [backButton setAction:@selector(popNavigationItemAnimated:)];
            
            var currentColor = [[backButton currentValueForThemeAttribute:@"bezel-color"] patternImage];
            var tpi = [[CPThreePartImage alloc] initWithImageSlices:[
                [[CPImage alloc] initWithContentsOfFile:[[CPBundle bundleForClass:[self class]] pathForResource:@"ButtonBezelLeft.png"] size:CGSizeMake(12.0, 24.0)],
                [currentColor imageSlices][1],
                [currentColor imageSlices][2]
            ] isVertical:NO];
            [backButton setValue:[CPColor colorWithPatternImage:tpi] forThemeAttribute:@"bezel-color"];
            var inset = CGInsetMakeCopy([backButton currentValueForThemeAttribute:@"content-inset"]);
            inset.left += 11.0;
            inset.right += 4.0;
            [backButton setValue:inset forThemeAttribute:@"content-inset"];
            [backButton sizeToFit];
            
            [backItem setBackButton:backButton];
        }
    }
    
    [self _setBackView:[anItem hidesBackButton] ? nil : [backItem backButton] animated:animated];
    [self _setActionView:[anItem actionButton] animated:animated];
    
    [self _setLeftView:[anItem leftView] animated:animated];
    [self _setRightView:[anItem rightView] animated:animated];
}

@end
