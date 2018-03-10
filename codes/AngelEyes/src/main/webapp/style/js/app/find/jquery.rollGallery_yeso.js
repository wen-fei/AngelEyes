/*******************************

	* rollGallery
	* Copyright (c) doving.cn!
	* Date: 2010-10-13

	* 说明：
	* 必须对包裹子元素的直接父元素应用该方法
	* example: $("#picturewrap").rollGallery({ direction:"top",speed:2000,showNum:4,aniMethod:"easeOutCirc"});
	* direction:移动方向。可取值为："left" "top"
	* speed:速度。单位毫秒
	* noStep:设置为：true  则按非步进方式滚动。非步进下动画效果失效。
	* speedPx:非步进滚动下的移动速度。单位像素
	* showNum:显示个数。即父元素能容纳的子元素个数
	* rollNum:一次滚动的个数。注意总个数必须为rollNum的倍数！
	* aniSpeed:动画速度
	* aniMethod:动画方法（需插件（如：easing）支持）
	* childrenSel:子元素筛选器
*******************************/

;(function($){
	
$.fn.rollGallery=function( options ){
	
	var opts=$.extend({},$.fn.rollGallery.defaults,options);
	
	return this.each(function(){
		var _this=$(this);
		var step=0;
		var maxMove=0;
		var animateArgu=new Object();
		_this.intervalRGallery=null;
		
		if( opts.noStep&&(!options.speed) ) opts.speed=30;
		
		if( opts.direction=="left"){
			step=_this.children( opts.childrenSel ).outerWidth(true);
		}else{
			step=_this.children( opts.childrenSel ).outerHeight(true);
		}
		
		maxMove=-(step*_this.children( opts.childrenSel ).length);
		_this[0].maxMove=maxMove;
		if( opts.rollNum ) step*=opts.rollNum;	
		animateArgu[ opts.direction ]="-="+step;	
				
		_this.children( opts.childrenSel ).slice( 0,opts.showNum ).clone(true).appendTo( _this );
		_this.mouseover( function(){ clearInterval( _this.intervalRGallery ); });
		_this.mouseout( function(){ _this.intervalRGallery=setInterval( function(){
				if( parseInt(_this.css( opts.direction ))<=maxMove ){
					_this.css( opts.direction , "0px");
				}
				if( opts.noStep ){
					_this.css( opts.direction, (parseInt(_this.css( opts.direction ))-opts.speedPx+"px") );
				}
				else{
					_this.animate( animateArgu ,opts.aniSpeed,opts.aniMethod );
				}
			}, opts.speed );});
		
		_this.mouseout();
	});
			
};

$.fn.rollGallery.defaults={
	direction : "left",
	speed : 3000,
	noStep : false,
	speedPx : 1,
	showNum : 1,
	aniSpeed:"slow",
	aniMethod:"swing",
	childrenSel:"*"
};
	
})(jQuery);