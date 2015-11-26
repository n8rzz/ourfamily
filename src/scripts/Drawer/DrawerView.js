// import Base from '../util/Base';

/**
 * @class DrawerView
 * @author Nate Geslin
 */
export default class DrawerView {
    constructor($element) {
        this.$element = $element;
        this.$drawerTrigger = null;
        this.$drawerView = null;

        return this._init();
    }

    /**
     * @method _init()
     * @chainable
     */
    _init() {

        return this._createChildren()
                    ._setupHandlers()
                    ._enable();
    }

    /**
     * @method _createChildren
     * @chainable
     */
    _createChildren() {
        this.$drawerTrigger = this.$element.find('[data-controller="js-drawerTrigger"]');
        this.$drawerView = this.$element.find('[data-controller="js-drawerView"]');

        return this;
    }

    /**
     * @method _setupHandlers
     * @chainable
     */
    _setupHandlers() {
        this._onClickHandler = $.proxy(this._onClick, this);

        return this;
    }

    /**
     * @method _enable
     * @chainable
     */
    _enable() {
        this.$drawerTrigger.on('click', this._onClickHandler);

        return this;
    }

    /**
     * @method _disable
     * @chainable
     */
    _disable() {
        this.$drawerTrigger.off('click', this._onClickHandler);

        return this;
    }

    /**
     * @method _destroy
     * @chainable
     */
    _destroy() {
        this.$element = null;
        this.$drawerTrigger = null;
        this.$drawerView = null;

        return this;
    }

    /**
     * @method _onClick
     * @chainable
     */
    _onClick(event) {
        event.preventDefault();
        console.log('click');

        this.$drawerView.slideToggle();
    }
}




