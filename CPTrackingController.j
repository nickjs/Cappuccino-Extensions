/*
 * CPTrackingController.j
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

@import "CPRadioItem.j"


CPTrackingSegmentedMode = 0;
CPTrackingRadioMode = 1;

@implementation CPTrackingController : UIViewController
{
    CPArray             _viewControllers;
    CPViewController    _currentViewController;
    
    CPControl           _trackingControl;
}

- (id)initWithViewControllers:(CPArray)viewControllers
{
    if (!viewControllers)
        return nil;
    
    self = [super init];
    
    if (self)
    {
        _viewControllers = viewControllers;
    }
    
    return self;
}

- (void)loadView
{
    var view = [[_CPLayoutView alloc] init];
    [self setView:view];
}

- (CPControl)trackingControl
{
    if (_trackingControl)
        return _trackingControl;
    
    var count = [_viewControllers count];
    if (!count)
        return nil;
    
    _trackingControl = [[CPSegmentedControl alloc] initWithFrame:CGRectMake(0.0, 0.0, 96.0, 24.0)];
    [_trackingControl setSegmentCount:count];
    [_trackingControl setTrackingMode:CPSegmentSwitchTrackingSelectOne];
    [_trackingControl setTarget:self];
    [_trackingControl setAction:@selector(_trackingControlDidChange:)];
    
    for (var i = 0; i < count; i++)
    {
        var controller = _viewControllers[i],
            radioItem = [controller radioItem];
        
        [_trackingControl setWidth:32.0 forSegment:i];
        
        if ([radioItem image])
            [_trackingControl setImage:[radioItem image] forSegment:i];
        else
            [_trackingControl setLabel:[[radioItem title] characterAtIndex:0] forSegment:i];
    }
    
    if (_currentViewController)
        [_trackingControl setSelectedSegment:[_viewControllers indexOfObject:_currentViewController]];
    
    return _trackingControl;
}

- (void)selectViewController:(CPViewController)aController
{
    [_currentViewController viewWillDisappear:NO];
    [[_currentViewController view] removeFromSuperview];
    [_currentViewController viewDidDisappear:NO];
    
    _currentViewController = aController;
    
    if (_currentViewController)
    {
        var view = [_currentViewController view];
        
        [_currentViewController viewWillAppear:NO];
        
        [view setFrame:CGRectMakeCopy([_view bounds])];
        [view setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
        [_view addSubview:view];
        
        [_currentViewController viewDidAppear:NO];
    }
    
    [_trackingControl setSelectedSegment:_currentViewController ? [_viewControllers indexOfObject:_currentViewController] : nil];
}

- (void)selectViewControllerAtIndex:(int)anIndex
{
    var controller = [_viewControllers objectAtIndex:anIndex];
    [self selectViewController:controller];
}

- (CPViewController)selectedViewController
{
    return _currentViewController;
}

- (CPViewController)visibleViewController
{
    return _currentViewController;
}

// Private API

- (CPArray)_radioItems
{
    var array = [CPMutableArray array];
    
    var count = [_viewControllers count];
    for (var i = 0; i < count; i++)
    {
        var item = [_viewControllers[i] radioItem];
        [array addObject:item];
    }
    
    return array;
}

- (@action)_trackingControlDidChange:(id)aSender
{
    if (!aSender)
        return;
    
    [self selectViewControllerAtIndex:[aSender selectedSegment]];
}

- (@action)_selectToolbarItem:(id)aSender
{
    if (!aSender)
        return;
    
    [self selectViewControllerAtIndex:[aSender tag]];
}

@end

@implementation CPTrackingController (CPToolbarDelegate)

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar
{
    var items = [self _radioItems],
        count = [items count],
        array = [CPMutableArray array];
    
    for (var i = 0; i < count; i++)
        [array addObject:[items[i] title]];
    
    return array;
}

- (CPToolbarItem)toolbar:(CPToolbar)aToolbar itemForItemIdentifier:(CPString)anIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag
{
    var items = [self _radioItems],
        count = [items count],
        item;
    
    for (var i = 0; i < count; i++)
    {
        item = items[i];
        
        if ([item title] === anIdentifier)
            break;
        else
            item = nil;
    }
    
    if (!item)
        return nil;
    
    var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier:anIdentifier];
    
    [toolbarItem setMinSize:CGSizeMake(32.0, 32.0)];
    [toolbarItem setMaxSize:CGSizeMake(32.0, 32.0)];
    [toolbarItem setLabel:[item title]];
    [toolbarItem setImage:[item image]];
    [toolbarItem setAlternateImage:[item image]];
    [toolbarItem setTarget:self];
    [toolbarItem setAction:@selector(_selectToolbarItem:)];
    [toolbarItem setTag:[items indexOfObject:item]];
    
    return toolbarItem;
}

@end
