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

package com.codecatalyst.extensions.degrafa
{
	import com.degrafa.skins.GraphicBorderSkin;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	/**
	 * Extends the standard Degrafa GraphicBorderSkin to add support for declaritive definition of styles via <dx:Style> tags. 
	 */
	public class StyleableGraphicBorderSkin extends GraphicBorderSkin
	{
		// ------------------------------------------------------------
		//  Protected properties
		// ------------------------------------------------------------
		
		/**
		 * Backing variable for <code>styles</code> property.
		 * 
		 * @private
		 */
		public var _styles:Array;
		
		// ------------------------------------------------------------
		//  Public properties
		// ------------------------------------------------------------
		
		[Bindable( "stylesChanged" )]
		[Inspectable(category="General", arrayType="com.codecatalyst.extensions.degrafa.Style")]
		[ArrayElementType("com.codecatalyst.extensions.degrafa.Style")]
		/**
		 * Styles defined for this StyleableGraphicBorderSkin.
		 */
		public function get styles():Array
		{
			return _styles;
		}
		
		public function set styles( value:Array ):void
		{
			if ( _styles != value )
			{
				_styles = value;
				
				dispatchEvent( new Event( "stylesChanged" ) );
			}
		}
		
		// ------------------------------------------------------------
		//  Constructor
		// ------------------------------------------------------------
		
		/**
		 * Constructor.
		 */
		public function StyleableGraphicBorderSkin()
		{
			super();
		}

		// ------------------------------------------------------------
		//  Public methods
		// ------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function styleChanged( styleProp:String ):void
		{
			super.styleChanged( styleProp );
			
			for each ( var style:Style in styles )
			{
				var value:* = getStyle( style.name );
				if ( value != null )
				{
					style.value = value;
				}
			}
		}
		
		// ------------------------------------------------------------
		//  Protected methods
		// ------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override protected function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ):void
		{
			super.updateDisplayList( unscaledWidth, unscaledHeight );
		}
		
	}
}