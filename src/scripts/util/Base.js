export default class Base {
    constructor($element) {
        this.$element = $element;
        this._isEnabled = false;


        return this._init();
    }

    /**
     *
     */
    _init() {
        return this._createChildren()
                  ._setupHandlers()
                  ._enable();
    }

    /**
     *
     */
    _createChildren() {

        return this;
    }

    /**
     *
     */
    _setupHandlers() {

        return this;
    }

    /**
     *
     */
    _enable() {
        if (this._isEnabled) {
          return this;
        }

        this._isEnabled = true;

        return this;
    }

    /**
     *
     */
    _disable() {
        if (!this._isEnabled) {
          return this;
        }

        this._isEnabled = false;

        return this;
    }

    /**
     *
     */
    _destroy() {

        return this;
    }
}
