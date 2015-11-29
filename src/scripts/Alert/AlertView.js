import $ from 'jquery-browserify';

/**
 * @property TRANSITION
 * @final
 */
let TRANSITION = {
    /**
     * @property TIME_DELAY
     * @final
     */
    TIME_DELAY: 3000,
    /**
     * @property FADE_SPEED
     * @final
     */
    FADE_SPEED: 'slow'
}

/**
 * @property timer
 * @final
 */
let timer;

/**
 * @method initTimer
 * @param callback {function}
 * @param delay {number}
 */
function initTimer(callback, delay) {
    timer = window.setTimeout(callback, delay);
}

/**
 * @class AlertView
 * @author
 */
export default class AlertView {
    constructor($element) {

        return this._init($element);
    }

    /**
     * @method _init
     * @param $element {JQuery|object}
     * @private
     */
    _init($element) {
        if ($element.length < 1) {
            return;
        }

        /**
         * @property $element
         * @type {JQuery|object|null}
         */
        this.$element = $element || null;


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
        this._removeAlertViewHandler = $.proxy(this._removeAlertView, this);

        return this;
    }

    /**
     * @method _createChildren
     * @private
     * @chainable
     */
    _createChildren() {
        return this;
    }

    /**
     * @method _enable
     * @private
     * @chainable
     */
    _enable() {
        if (this.$element === null) {
            return this;
        }

        initTimer(this._removeAlertViewHandler, TRANSITION.TIME_DELAY);

        return this;
    }

    /**
     * @method _disable
     * @private
     * @chainable
     */
    _disable() {
        this._removeAlertViewHandler = null;

        return this._destroy();
    }

    /**
     * @method _destroy
     * @private
     * @chainable
     */
    _destroy() {
        this.$element = null;

        return this;
    }

    /**
     * @method _removeAlertView
     * @private
     */
    _removeAlertView() {
        this.$element.fadeOut(TRANSITION.FADE_SPEED);
        timer = null;
    }
}
