import $ from 'jquery-browserify';

/**
 * @class FieldMaskView
 * @author Nate Geslin
 */
export default class FieldMaskView {
    constructor($element) {
        this.$element = $element;

        return this._init();
    }

    /**
    * @method _init
    * @chainable
    */
    _init() {

        return this._setupHandlers()
                   ._createChildren()
                   ._enable();
    }

    _setupHandlers() {
        this._onChangeHanlder = $.proxy(this._onChange, this);

        return this;
    }

    /**
    * @method _createChildren
    * @chainable
    */
    _createChildren() {

        return this;
    }

    /**
    * @method _enable
    * @chainable
    */
    _enable() {
        this.$element.on('change', this._onChangeHandler);
        this.$element.on('keyup', this._onChangeHandler);

        return this;
    }

    /**
    * @method _disable
    * @chainable
    */
    _disable() {

        return this;
    }

    /**
    * @method _destroy
    * @chainable
    */
    _destroy() {

        return this;
    }

    _onChange(event) {

      console.log('change', event);
    }
}
