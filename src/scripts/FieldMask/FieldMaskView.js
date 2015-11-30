import $ from 'jquery-browserify';

/**
 * @property CHAR_CODES
 * @type {array}
 * @constant
 */
const CHAR_CODES = [45, 46, 47];

/**
 * @property REGEX_NUMBER
 * @type {string}
 * @constant
const REGEX_NUMBER = /^[0-9]+$/;

/**
 * @class FieldMaskView
 * @author Nate Geslin
 * @beta
 */
export default class FieldMaskView {
    constructor($element) {

        return this._init($element);
    }

    /**
    * @method _init
    * @chainable
    */
    _init($element) {
        if ($element.length < 1) {
            return;
        }

        this.$element = $element;
        console.log('FieldMask');

        return this._setupHandlers()
                   ._createChildren()
                   ._enable();
    }

    /**
     * @method _setupHandlers
     * @private
     * @chainable
     */
    _setupHandlers() {
        this._onChangeHandler = $.proxy(this._onChange, this);

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
        this.$element.off('change', this._onChangeHandler);
        this.$element.off('keyup', this._onChangeHandler);

        return this;
    }

    /**
    * @method _destroy
    * @chainable
    */
    _destroy() {

        return this;
    }

    /**
     * Evaluate the current value of $element and add slashes to current value
     *
     * @method _onChange
     * @param event {JQuery Event|object}
     */
    _onChange(event) {
        let currentValue = this.$element.val();
        let length = currentValue.length - 1;

        if (!REGEX_NUMBER.test(currentValue.charAt(length))) {
            let transformedValue = currentValue.slice(0, length);
            this.$element.val(transformedValue);
        }

        if (currentValue.length === 2 || currentValue.length === 5) {

            return this._addSlashToCurrentValue(currentValue);
        }
    }

    /**
     * @method _addSlashToCurrentValue
     * @param currentValue {string}
     */
    _addSlashToCurrentValue(currentValue) {
        let transformedValue = currentValue + '/';

        this.$element.val(transformedValue);
    }
}
