////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2009 CodeCatalyst, LLC - http://www.codecatalyst.com/
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
////////////////////////////////////////////////////////////////////////////////

package com.codecatalyst.extensions.degrafa.core
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * Declaritive tag used to describe a style parameter.
	 * 
	 * @see com.codecatalyst.extensions.degrafa.skin.StyleableGraphicBorderSkin StyleableGraphicBorderSkin
	 */
	public class Style extends EventDispatcher
	{
		// ------------------------------------------------------------
		//  Protected properties
		// ------------------------------------------------------------
		
		/**
		 * Backing variable for <code>name</code> property.
		 * 
		 * @private
		 */		
		protected var _name:String;
		
		/**
		 * Backing variable for <code>value</code> property.
		 * 
		 * @private
		 */		
		protected var _value:*;
		
		/**
		 * Backing variable for <code>defaultObject</code> property.
		 * 
		 * @private
		 */
		protected var _defaultValue:*;
		
		// ------------------------------------------------------------
		//  Public properties
		// ------------------------------------------------------------

		[Bindable( "nameChanged" )]
		/**
		 * Name.
		 */
		public function get name():String
		{
			return _name;
		}
		
		public function set name( value:String ):void
		{
			if ( _name != value )
			{
				_name = value;
				
				dispatchEvent( new Event( "nameChanged" ) );
			}
		}

		[Bindable( "valueChanged" )]
		/**
		 * Value.
		 */
		public function get value():*
		{
			return _value;
		}
		
		public function set value( value:* ):void
		{
			if ( _value != value )
			{
				_value = value;
				
				dispatchEvent( new Event( "valueChanged" ) );
			}
		}

		[Bindable( "defaultValueChanged" )]
		/**
		 * Default value (optional).
		 */
		public function get defaultValue():*
		{
			return _defaultValue;
		}
		
		public function set defaultValue( value:* ):void
		{
			if ( _defaultValue != value )
			{
				_defaultValue = value;
				
				dispatchEvent( new Event( "defaultValueChanged" ) );
			}
		}

		// ------------------------------------------------------------
		//  Constructor
		// ------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function Style()
		{
			super();
		}

		// ------------------------------------------------------------
		//  Public methods
		// ------------------------------------------------------------
		
		[Bindable( "valueChanged" )]
		/**
		 * Convenience getter for Array values.
		 */
		public function getValueAt( index:int ):*
		{
			if ( value is Array )
			{
				return value[ index ];
			}
			
			return null;
		}
	}
}