import $ from 'jquery-browserify';
// import Base from './util/Base';
import DrawerView from './Drawer/DrawerView';
// import Gallery from './controllers/Gallery';

export default class App {
    constructor($element) {
        this.$element = $element;
        this.$drawer = null;

        return this._init();
    }

    _init() {

        return this._createChildren()
                   ._enable();
    }

    _createChildren() {
        console.log('app');
        this.$drawer = this.$element.find('[data-controller="js-drawer"]');

        return this;
    }

    _enable() {
        this.drawerView = new DrawerView(this.$drawer);

        return this;
    }

    _disable() {
        this.drawerView = null;
        this.$drawer = null;

        return this;
    }
}



// var App = function() {
//   var $element = $('[data-controller="js-app"]');
//
//   console.log('app', $element);
//
//   var $alertView = $element.find('[data-controller="js-alertView"]');
//
//   var $drawer = $element.find('[data-controller="js-drawer"]');
//   var $drawerTrigger = $element.find('[data-controller="js-drawerTrigger"]');
//   var $drawerView = $element.find('[data-controller="js-drawerView"]');
//
//   $drawerTrigger.on('click', function(e) {
//     e.preventDefault();
//
//     $drawerView.slideToggle();
//   });
//
// }
//
// var app = App();
