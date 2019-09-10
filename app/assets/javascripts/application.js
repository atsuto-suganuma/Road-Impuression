// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require cocoon
//= require rails-ujs
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
	$("#theTarget").skippr({
		// スライドショーの変化（fade or slide）
		transition : 'slide',
		// 変化に係る時間（ミリ秒）
		speed : 1000,
		// easingの種類
		easing : 'easeOutQuart',
		// ナビゲーションの形( block or bubble)
		navType : 'block',
		// 子要素の種類（div or img）
		childrenElementType : 'div',
		// ナビゲーション↑の表示（true or false）
		arrows : true,
		// スライドショーの自動再生（true or false）
		autoPlay :true,
		// 自動再生時のスライド切り替え間隔（ミリ秒）
		autoPlayDuration : 2000,
		// キーボードの矢印キーによるスライド送りの設定（true or false）
		keyboardOnAlways : true,
		// 1枚目のスライド表示時にもどる矢印を表示するかどうか（true or false）
		hidePrevious : false
	});
});

$(function() {

  $('#back a').on('click',function(){ //クラス、バック配下にあるエータグをクリックしたときにおこる処理。バックエーのところでアイディー名の子要素を指定する。ドットオン（イベント名、関数）で様々なイベント処理を実施
    $('body, html').animate({ //セレクタにアニメーション（値の変化）を実装する
      scrollTop:0 //ページ最上部から０pxの位置まで
    }, 800); //800ミリ秒かけて移動して！
      return false;
    });
});

$(function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
});