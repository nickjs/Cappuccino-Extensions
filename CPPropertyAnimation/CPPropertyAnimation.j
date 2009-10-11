/*
 * CPPropertyAnimation.j
 * AppKit
 *
 * Created by Nicholas Small.
 * Copyright 2009, Nicholas Small.
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

@import <AppKit/CPAnimation.j>


/*
  A VERY basic, but functional, property animation for Cappuccino. This is not CoreAnimation,
  nor anything similar. However, it will handle some basic property animations, and
  more can easily be added.
*/
@implementation CPPropertyAnimation : CPAnimation
{
	CPView			view;
	CPDictionary	properties;
	
	CPView			_startView;
	BOOL			_endView;
}
 
- (id)initWithView:(CPView)aView
{
	self = [super initWithDuration:1.0 animationCurve:CPAnimationLinear];
	
	if (self)
	{
		[self setDelegate:self];
		
		view = aView;
		properties = [CPDictionary dictionary];
	}
	
	return self;
}

- (CPView)view
{
	return view;
}

- (void)addProperty:(CPString)aPath start:(CPValue)aStart end:(CPValue)anEnd
{
	if (![view respondsToSelector:aPath])
		return;
	
	[properties setObject:{start: aStart, end:anEnd} forKey:aPath];
	
	[view setValue:aStart forKey:aPath];
}

- (void)addToViewOnStart:(CPView)aView
{
	_startView = aView;
}

- (CPView)willAddToViewOnStart
{
	return _startView;
}

- (void)removeFromSuperviewOnEnd:(BOOL)aFlag
{
	_endView = aFlag;
}

- (BOOL)willRemoveFromSuperviewOnEnd
{
	return _endView;
}

- (void)setCurrentProgress:(float)progress
{
	[super setCurrentProgress:progress];
	
	var progress = [self currentValue];
	
	var keys = [properties allKeys],
		count = [keys count];
	
	for (var i = 0; i < count; i++)
	{
		var keyPath = keys[i],
			property = [properties objectForKey:keyPath];
		
		if (!property)
			continue;
		
		var start = property.start,
			end = property.end,
			value;
		
		if (keyPath == 'width' || keyPath == 'height')
			value = (progress * (end - start)) + start;
		else if (keyPath == 'size')
			value = CGSizeMake((progress * (end.width - start.width)) + start.width, (progress * (end.height - start.height)) + start.height);
		else if (keyPath == 'frame')
		{
			value = CGRectMake(
				(progress * (end.origin.x - start.origin.x)) + start.origin.x, 
				(progress * (end.origin.y - start.origin.y)) + start.origin.y,
				(progress * (end.size.width - start.size.width)) + start.size.width, 
				(progress * (end.size.height - start.size.height)) + start.size.height);
		}
		else if (keyPath == 'alphaValue')
			value = (progress * (end - start)) + start;
		
		[view setValue:value forKey:keyPath];
	}
}

- (void)startAnimation
{
	var count = [properties count];
	for (var i = 0; i < count; i++)
	{
		var keyPath = [properties allKeys][i],
			property = [properties objectForKey:keyPath];
		
		if (!property)
			continue;
		
		[view setValue:property.start forKey:keyPath];
	}
	
	if (_startView)
		[_startView addSubview:view];
	
	[super startAnimation];
}

- (void)animationDidEnd:(CPAnimation)anAnimation
{
	if (_endView)
		[view removeFromSuperview];
}

@end
