import $ from 'jquery-browserify';
// import Drawer from './controllers/Drawer';
// import Gallery from './controllers/Gallery';

// export default class App {
//   constructor() {
//       this.$element = $('[data-controller="js-app"]');
//
//       return this._init();
//   }
//
//   _init() {
//
//   }
// }



var App = function() {
  var $element = $('[data-controller="js-app"]');

  console.log('app', $element);

  var $alertView = $element.find('[data-controller="js-alertView"]');

  var $drawer = $element.find('[data-controller="js-drawer"]');
  var $drawerTrigger = $element.find('[data-controller="js-drawerTrigger"]');
  var $drawerView = $element.find('[data-controller="js-drawerView"]');

  $drawerTrigger.on('click', function(e) {
    e.preventDefault();

    $drawerView.slideToggle();
  });

}

var app = App();
