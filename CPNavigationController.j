/*
 * CPNavigationController.j
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

@import "CPViewController.j"
@import "CPPropertyAnimation.j"

@import "CPNavigationItem.j"
@import "CPNavigationBar.j"


@implementation CPNavigationController : UIViewController
{
    CPMutableArray          _viewControllers;
    CPViewController        _visibleViewController;
    CPViewController        _disappearingViewController;
    
    // Navigation Bar
    CPNavigationBar         _navigationBar;
    Class                   _navigationBarClass;
    BOOL                    _navigationBarHidden;
    
    id                      _delegate;
    
    BOOL                    _isPopping;
    BOOL                    _receivedPopFromNavigationBar;
}

- (id)initWithRootViewController:(CPViewController)aController
{
    if (!aController)
        return nil;
    
    self = [super init];
    
    if (self)
    {
        [self _addViewController:aController];
        [self setTitle:[aController title]];
        _radioItem = [aController radioItem];
        
        _visibleViewController = aController;
    }
    
    return self;
}

- (void)pushViewController:(CPViewController)aController animated:(BOOL)animated
{
    _isPopping = NO;
    
    _disappearingViewController = [self topViewController];
    
    [self _addViewController:aController];
    
    _visibleViewController = [self topViewController];
    
    [_navigationBar pushNavigationItem:[_visibleViewController navigationItem] animated:animated];
    
    [self _displayViewAnimated:animated];
}

- (void)popToViewController:(CPViewController)aController animated:(BOOL)animated
{
    _isPopping = YES;
    
    if ([self topViewController] == [self bottomViewController])
        return NO;
    
    _disappearingViewController = [self topViewController];
    
    var index = [_viewControllers indexOfObject:aController],
        count = [_viewControllers count] - 1;
    
    for (; count > index; count--)
        [_viewControllers removeLastObject];
    
    _visibleViewController = [self topViewController];
    
    if (_receivedPopFromNavigationBar)
        _receivedPopFromNavigationBar = NO;
    else
        [_navigationBar popToNavigationItem:[aController navigationItem] animated:animated];
    
    [self _displayViewAnimated:animated];
}

- (void)popToRootViewControllerAnimated:(BOOL)animated
{
    [self popToViewController:[self bottomViewController] animated:animated];
}

- (void)popViewControllerAnimated:(BOOL)animated
{
    [self popToViewController:[self previousViewController] animated:animated];
}

- (CPViewController)topViewController
{
    return [_viewControllers lastObject];
}

- (CPViewController)bottomViewController
{
    return [_viewControllers objectAtIndex:0];
}

- (CPViewController)visibleViewController
{
    return _visibleViewController;
}

- (CPViewController)previousViewController
{
    var count = [_viewControllers count];
    
    if (count <= 1)
        return nil;
    
    return [_viewControllers objectAtIndex:count - 2];
}

// View Manager

- (void)loadView
{
    var view = [[_CPLayoutView alloc] init];
    view._viewController = self;
    
    _navigationBar = [[(_navigationBarClass || CPNavigationBar) alloc] init];
    [_navigationBar setDelegate:self];
    [_navigationBar setItems:[self _navigationItems] animated:NO];
    [view addSubview:_navigationBar];
    
    [self setView:view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self _displayViewAnimated:NO];
}

// Private API

- (CPArray)_navigationItems
{
    var array = [CPMutableArray array];
    
    var count = [_viewControllers count];
    for (var i = 0; i < count; i++)
    {
        var item = [_viewControllers[i] navigationItem];
        [array addObject:item];
    }
    
    return array;
}

- (BOOL)_addViewController:(CPViewController)aController
{
    if ([_viewControllers containsObject:aController])
        return NO;
    
    if (!_viewControllers)
        _viewControllers = [CPMutableArray array];
    
    aController._parentViewController = self;
    
    [_viewControllers addObject:aController];
    
    return YES;
}

- (void)_displayViewAnimated:(BOOL)animated
{
    if (_disappearingViewController)
    {
        [_disappearingViewController viewWillDisappear:animated];
        
        if (animated)
            [self _startTransition];
        else
            [[_disappearingViewController view] removeFromSuperview];
        
        [_disappearingViewController viewDidDisappear:animated];
    }
    
    if (_visibleViewController)
    {
        var view = [_visibleViewController view];
        
        [_visibleViewController viewWillAppear:animated];
        
        [view setFrameSize:CGSizeMake(CGRectGetWidth([_view bounds]), CGRectGetHeight([_view bounds]) - CGRectGetMaxY([_navigationBar frame]))];
        [view setFrameOrigin:CGPointMake(animated ? (_isPopping ? -CGRectGetWidth([view bounds]) : CGRectGetWidth([view bounds])) : 0.0, CGRectGetMaxY([_navigationBar frame]))];
        [view setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [_view addSubview:view];
        
        if (animated)
            [self _endTransition];
        
        [_visibleViewController viewDidAppear:animated];
    }
}

- (void)_startTransition
{
    if (!_disappearingViewController)
        return;
    
    var view = [_disappearingViewController view],
        anim = [[CPPropertyAnimation alloc] initWithView:view];
    
    if (_isPopping)
        [anim addProperty:@"frame" start:CGRectMakeCopy([view frame]) end:CGRectMake([view frame].size.width, [view frame].origin.y, [view frame].size.width, [view frame].size.height)];
    else
        [anim addProperty:@"frame" start:CGRectMakeCopy([view frame]) end:CGRectMake(-[view frame].size.width, [view frame].origin.y, [view frame].size.width, [view frame].size.height)];
    
    [anim addProperty:@"alphaValue" start:1.0 end:0.3];
    
    [anim setDuration:0.3];
    [anim startAnimation];
    [anim setDelegate:self];
}

- (void)_endTransition
{
    var view = [_visibleViewController view],
        anim = [[CPPropertyAnimation alloc] initWithView:view];
    
    [anim addProperty:@"frame" start:CGRectMakeCopy([view frame]) end:CGRectMake(0.0, [view frame].origin.y, [view frame].size.width, [view frame].size.height)];
    [anim addProperty:@"alphaValue" start:0.3 end:1.0];
    
    [anim setDuration:0.3];
    [anim startAnimation];
}

- (void)animationDidEnd:(CPAnimation)anAnimation
{
    var view = [_disappearingViewController view];
    
    [view removeFromSuperview];
    [view setAlphaValue:1.0];
}

@end

@implementation CPNavigationController (CPNavigationBar)

- (void)navigationBar:(CPNavigationBar)aBar didPopItem:(CPNavigationItem)anItem
{
    _receivedPopFromNavigationBar = YES;
    [self popToViewController:anItem._viewController animated:YES];
}

@end
