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

package com.codecatalyst.extensions.degrafa.component
{
	import flash.display.DisplayObject;
	
	import mx.core.IFlexDisplayObject;
	import mx.core.IInvalidating;
	import mx.core.IProgrammaticSkin;
	import mx.core.UIComponent;
	import mx.styles.ISimpleStyleClient;

	/**
	 *  Name of the class to use as the skin for this symbol.
	 * 
	 *  @default null
	 */
	[Style(name="skin", type="Class", inherit="no")]

	public class Symbol extends UIComponent
	{
		// ========================================
		// Protected properties
		// ========================================		
		
		/**
		 * Skin.
		 * 
		 * @private
		 */
		protected var _skin:IFlexDisplayObject;
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function Symbol()
		{
			super();
		}

		// ========================================
		// Protected methods
		// ========================================

		/**
		 * @inheritDoc
		 */
		override public function styleChanged( styleProp:String ):void
		{
			super.styleChanged( styleProp );

			var allStyles:Boolean = ( ( styleProp == null ) || ( styleProp == "styleName" ) );

			if ( ( allStyles == true ) || ( styleProp == "skin" ) )
			{
				loadSkin( getStyle( "skin" ) as Class );
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ):void
		{
			super.updateDisplayList( unscaledWidth, unscaledHeight );
			
			if ( _skin != null )
			{
				_skin.setActualSize( unscaledWidth, unscaledHeight );
			}
		}
		
		/**
		 * Creates and adds an instance of the specified skin as a child of this component.
		 */
		protected function loadSkin( skinClass:Class ):void
		{
			if ( _skin != null )
			{
				removeChild( _skin as DisplayObject );
			}

			if ( skinClass != null )
			{
				_skin = new skinClass() as IFlexDisplayObject;
				
				addChild( _skin as DisplayObject );
				
				_skin.setActualSize( unscaledWidth, unscaledHeight );
			
				if ( _skin is IInvalidating && initialized )
				{
					(_skin as IInvalidating).validateNow();
				}
				else if ( _skin is IProgrammaticSkin && initialized )
				{
					(_skin as IProgrammaticSkin).validateDisplayList();
				}
				
				if ( _skin is ISimpleStyleClient )
				{
					(_skin as ISimpleStyleClient).styleName = this;
				}
			}						
		}
	}
}