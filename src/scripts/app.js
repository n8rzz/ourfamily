import $ from 'jquery-browserify';
// import Base from './util/Base';
import DrawerView from './Drawer/DrawerView';
import FieldMaskView from './FieldMask/FieldMaskView';
import AlertView from './Alert/AlertView';
// import Gallery from './controllers/Gallery';

/**
 * Base view controller
 *  All other views and controllers are instantiated from this class
 *
 * @class App
 * @author Nate Geslin
 */
export default class App {
    constructor($element) {
        this.$element = $element;
        this.$drawer = null
        this.drawrerView = null;
        this.$alert = null;
        this.alertView = null;

        return this._init();
    }

    /**
     * @method _init
     * @private
     * @chainable
     */
    _init() {

        return this._createChildren()
                   ._enable();
    }

    /**
     * @method _createChildren
     * @private
     * @chainable
     */
    _createChildren() {
        this.$drawer = this.$element.find('[data-controller="js-drawer"]');
        this.$fieldMask = this.$element.find('[data-controller="js-fieldMask"]');
        this.$alert = this.$element.find('[data-controller="js-alertView"]');

        return this;
    }

    /**
     * @method _enable
     * @private
     * @chainable
     */
    _enable() {
        this.drawerView = new DrawerView(this.$drawer);
        this.$fieldMask = new FieldMaskView(this.$fieldMask);
        this.alertView = new AlertView(this.$alert);

        return this;
    }

    /**
     * @method _disable
     * @private
     * @chainable
     */
    _disable() {

        return this._destroy();
    }

    /**
     * @method _destroy
     * @private
     * @chainable
     */
    _destroy() {
        this.$element = null;
        this.drawerView = null;
        this.$drawer = null;
        this.$fieldMask = null;
        this.alertView = null;
        this.$alert = null;

        return this;
    }
}
