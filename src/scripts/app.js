import $ from 'jquery-browserify';
// import Base from './util/Base';
import DrawerView from './Drawer/DrawerView';
import FieldMaskView from './FieldMask/FieldMaskView';
// import Gallery from './controllers/Gallery';

export default class App {
    constructor($element) {
        this.$element = $element;
        this.$drawer = null;
        this.$fieldMask = null;

        return this._init();
    }

    _init() {

        return this._createChildren()
                   ._enable();
    }

    _createChildren() {
        this.$drawer = this.$element.find('[data-controller="js-drawer"]');
        this.$fieldMask = this.$element.find('[data-controller="js-fieldMask"]');

        return this;
    }

    _enable() {
        this.drawerView = new DrawerView(this.$drawer);
        this.$fieldMask = new FieldMaskView(this.$fieldMask);

        return this;
    }

    _disable() {
        this.drawerView = null;
        this.$drawer = null;
        this.$fieldMask = null;

        return this;
    }
}

//   var $alertView = $element.find('[data-controller="js-alertView"]');
