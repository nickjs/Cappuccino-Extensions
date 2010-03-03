/*
 * CPViewController.j
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

@import <AppKit/CPResponder.j>


/*! @class CPViewController
    The CPViewController class provides the fundamental view-management controller for Cappuccino applications.
    The basic view controller class supports the presentation of an associated view in addition to basic support
    for managing modal views and, in the future, animations. Subclasses such as CPNavigationController and
    CPTabBarController provide additional behavior for managing complex hierarchies of view controllers and views.
    
    You use each instance of CPViewController to manage a single view (and hierarchy). For a simple view controller,
    this entails managing the view hierarchy responsible for presenting your application content.
    A typical view hierarchy consists of a root view—a reference to which is available in the view property of this class—
    and one or more subviews presenting the actual content. In the case of navigation and tab bar controllers, the view
    controller manages not only the high-level view hierarchy (which provides the navigation controls) but also one
    or more additional view controllers that handle the presentation of the application content.
    
    Unlike UIViewController in Cocoa Touch, a CPViewController does not represent an entire screen of content. You
    will add your root view to an existing view or window's content view. You can manage many view controllers
    on screen at once. CPViewController is also the preferred way of working with Cibs.
    
    Subclasses can override -loadView to create their custom view hierarchy, or specify a cib name to be loaded automatically.
    It has methods that are called when a view appears or disappears.
    This class is also a good place for delegate & datasource methods, and other controller stuff.
*/
@implementation UIViewController : CPResponder
{
    CPView              _view;
    
    CPRadioItem         _radioItem;
    CPNavigationItem    _navigationItem;
    
    CPString            _title;
    
    CPString            _cibName;
    CPBundle            _cibBundle;
    
    CPViewController    _parentViewController;
    CPDictionary        _childViewControllers;
    
    BOOL                _isViewLoaded;
}

/*!
    Convenience initializer calls -initWithCibName:bundle: with nil for both parameters.
*/
- (id)init
{
    return [self initWithCibName:nil bundle:nil];
}

/*!
    The designated initializer. If you subclass CPViewController, you must call the super implementation of this method, even if you aren't using a Cib.
    In the specified Cib, the File's Owner proxy should have its class set to your view controller subclass, with the view outlet connected to the main view.
    If you pass in a nil Cib name, then you must either call -setView: before -view is invoked, or override -loadView to set up your views.
    
    @param cibNameOrNil The path to the cib to load for the root view or nil to programmatically create views.
    @param cibBundleOrNil The bundle that the cib is located in or nil for the main bundle.
*/
- (id)initWithCibName:(CPString)cibNameOrNil bundle:(CPBundle)cibBundleOrNil
{
    self = [super init];
    
    if (self)
    {
        // We're lazy. Don't load the cib until someone actually requests the view.
        _cibName = cibNameOrNil;
        _cibBundle = cibBundleOrNil || [CPBundle mainBundle];
    }
    
    return self;
}

/*!
    Programmatically creates the view that the controller manages.
    You should never call this method directly. The view controller calls this method when the view property is requested but is nil.
    
    If you create your views manually, you must override this method and use it to create your view and assign it to the view property.
    The default implementation for programmatic views is to create a plain view. You can invoke super to utilize this view.
    
    If you use Interface Builder to create your views and initialize the view controller—that is, you initialize the view using the
    initWithCibName:bundle: method—then you must not override this method. The consequences risk shattering the space-time continuum.
    
    Note: The cib loading system is currently asynchronous.
*/
- (void)loadView
{
    if ([self isViewLoaded])
        return;
    
    if (_cibName)
    {
        var cib = [[CPCib alloc] initWithContentsOfURL:[_cibBundle pathForResource:_cibName + @".cib"]];
        [cib instantiateCibWithExternalNameTable:[CPDictionary dictionaryWithObject:self forKey:CPCibOwner]];
    }
    else
    {
        _view = [[CPView alloc] initWithFrame:CGRectMakeZero()];
        [_view setBackgroundColor:[CPColor blueColor]];
    }
}

/*!
    Called after the view has been loaded.
    For view controllers created in code, this is after -loadView. For view controllers unarchived from a cib, this is after the view is set.
    This method is most commonly used to perform additional initialization steps on views that are loaded from cib files.
    The default implementation does nothing, but it is recommended your invoke super in case of future changes.
*/
- (void)viewDidLoad
{
}

/*!
    Called after the view controller's view is set to nil. Not invoked as a result of -dealloc.
    The default implementation does nothing, but it is recommended your invoke super in case of future changes.
*/
- (void)viewDidUnload
{
}

/*!
    Returns the view that the controller manages.
    If this property is nil, the controller sends loadView to itself to create the view that it manages.
    Subclasses should override the loadView method to create any custom views. The default value is nil.
    
    Note: An error will not be thrown if after -loadView, the view property is still nil. -view will simply return nil, but will continue to call -loadView on subsequent calls.
*/
- (CPView)view
{
    if (!_view)
    {
        [self loadView];
        
        if (_view)
            [self viewDidLoad];
    }
    
    return _view;
}


/*!
    Manually sets the view that the controller manages.
    Setting to nil will cause -loadView to be called on all subsequent calls of -view.
    
    @param aView The view this controller should represent.
*/
- (void)setView:(CPView)aView
{
    if (_view && _view == aView)
        return;
    
    if (_view)
        _view._viewController = nil;
    
    if (_view)
        [_view removeFromSuperview];
    
    _view = aView;
    
    if (_view)
        _view._viewController = self;
    
    _isViewLoaded = !!_view;
}

// Auxiliary View Items

/*!
    Returns the navigation item for this view controller or creates it if it doesn't exist. You MUST use this
    method to create a navigation item for a view controller; there is no setter.
    
    Note: The title of the view controller must already in order for a navigation item to be created.
*/
- (CPNavigationItem)navigationItem
{
    if (!_navigationItem)
    {
        _navigationItem = [[CPNavigationItem alloc] initWithTitle:[self title]];
        _navigationItem._viewController = self;
    }
    
    return _navigationItem;
}

/*!
    Returns the radio item for this view controller or creates it if it doesn't exist. You MUST use this
    method to create a radio item for a view controller; there is no setter.
    
    Note: Unlike a navigation item, a radio item MAY be created without a title.
*/
- (CPRadioItem)radioItem
{
    if (!_radioItem)
    {
        _radioItem = [[CPRadioItem alloc] init];
        [_radioItem setTitle:[self title]];
    }
    
    return _radioItem;
}

/*!
    Returns the parent controller (navigation or tab bar) of the current view controller or nil.
    
    Parent view controllers are relevant in navigation, tab bar, and modal view controller hierarchies.
    In each of these hierarchies, the parent is the object responsible for displaying the current view controller.
    If you are using a view controller as a standalone object—that is, not as part of a view controller hierarchy—the value in this property is nil.
*/
- (CPViewController)parentViewController
{
    return _parentViewController;
}

/*!
    Returns the closest parent navigation controller of the current view controller or nil.
*/
- (CPNavigationController)navigationController
{
    if (!_parentViewController)
        return nil;
    
    if ([_parentViewController isKindOfClass:CPNavigationController])
        return _parentViewController;
    
    return [_parentViewController navigationController];
}

/*!
    Returns the closest parent tracking controller of the current view controller or nil.
*/
- (CPTrackingController)trackingController
{
    if (!_parentViewController)
        return nil;
    
    if ([_parentViewController isKindOfClass:CPTrackingController])
        return _parentViewController;
    
    return [_parentViewController navigationController];
}

// View Appearance Hooks

/*!
    Sent to the controller before the view appears on screen.
    
    The default implementation of this method does nothing. Subclasses may override this method to take an appropriate action. When doing so, they must invoke super.
    
    @param animated Will be YES if the view is animating. Animations are supported in the API, but don't actually do anything yet.
*/
- (void)viewWillAppear:(BOOL)animated
{
}

/*!
    Sent to the controller after the view fully appears on screen.
    
    The default implementation of this method does nothing. Subclasses may override this method to take an appropriate action. When doing so, they must invoke super.
    
    @param animated Will be YES if the view is animating. Animations are supported in the API, but don't actually do anything yet.
*/
- (void)viewDidAppear:(BOOL)animated
{
}

/*!
    Sent to the controller before the view is dismissed, covered, or otherwise hidden from view.
    
    The default implementation of this method does nothing. Subclasses may override this method to take an appropriate action. When doing so, they must invoke super.
    
    @param animated Will be YES if the view is animating. Animations are supported in the API, but don't actually do anything yet.
*/
- (void)viewWillDisappear:(BOOL)animated
{
}

/*!
    Sent to the controller after the view is dismissed, covered, or otherwise hidden from view.
    
    The default implementation of this method does nothing. Subclasses may override this method to take an appropriate action. When doing so, they must invoke super.
    
    @param animated Will be YES if the view is animating. Animations are supported in the API, but don't actually do anything yet.
*/
- (void)viewDidDisappear:(BOOL)animated
{
}

// Accessors

/*!
    Returns the localized title that represents the view this controller manages.
*/
- (CPString)title
{
    return _title;
}

/*!
    Sets the localized title that represents the view this controller manages.
    
    Subclasses should set the title to a human-readable string that represents the view to the user.
    If the receiver has a navigation or tab bar item, its title will change to reflect the new title.
    If the receiver is a navigation controller, the default value is the top view controller’s title.
    
    @param aTitle A string for the new title. This string will use -copy.
*/
- (void)setTitle:(CPString)aTitle
{
    if (_title == aTitle)
        return;
    
    _title = [aTitle copy];
    
    if (_navigationItem) // Don't create them if they don't already exist. Aka don't call [self navigationItem].
        [_navigationItem setTitle:_title];
    
    if (_radioItem)
        [_radioItem setTitle:_title];
}

/*!
    Returns a BOOL that indicated whether the view property has successfully been loaded (not nil).
    Calling this method will not cause the view to load if it is currently nil.
*/
- (BOOL)isViewLoaded
{
    return _isViewLoaded;
}

/*!
    Returns the path of the cib file this view controller represents.
    This attribute is read-only. You can only set it through -initWithCibName:bundle:
*/
- (CPString)cibName
{
    return _cibName;
}

/*!
    Returns the bundle that the cib file this view controller represents resides in.
    This attribute is read-only. You can only set it through -initWithCibName:bundle:
*/
- (CPBundle)cibBundle
{
    return _cibBundle;
}

@end

/*!
    @ignore
*/
@implementation _CPLayoutView : CPView
{
    CPViewController            _viewController;
}

- (id)init
{
    self = [super initWithFrame:CGRectMakeZero()];
    
    if (self)
    {
        [self setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    }
    
    return self;
}

- (void)viewWillMoveToSuperview:(CPView)aView
{
    [self setFrame:CGRectMakeCopy([aView bounds])];
    
    [_viewController viewWillAppear:NO];
}

- (void)viewDidMoveToSuperview
{
    [_viewController viewDidAppear:NO];
}

- (void)removeFromSuperview
{
    [_viewController viewWillDisappear:NO];
    
    [super removeFromSuperview];
    
    [_viewController viewDidDisappear:NO];
}

@end

@implementation CPView (CPViewController)

- (UIViewController)viewController
{
    return self._viewController;
}

@end
