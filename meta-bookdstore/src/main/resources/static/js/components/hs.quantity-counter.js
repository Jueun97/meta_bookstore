/**
 * Quantity Counter wrapper.
 *
 * @author Htmlstream
 * @version 1.0
 *
 */


; (function($) {
	'use strict';
	$.HSCore.components.HSQantityCounter = {
		/**
		 *
		 *
		 * @var Object _baseConfig
		 */
		_baseConfig: {},

		/**
		 *
		 *
		 * @var jQuery pageCollection
		 */
		pageCollection: $(),

		/**
		 * Initialization of Count quantity wrapper.
		 *
		 * @param String selector (optional)
		 * @param Object config (optional)
		 *
		 * @return jQuery pageCollection - collection of initialized items.
		 */

		init: function(selector, config) {

			this.collection = selector && $(selector).length ? $(selector) : $();
			if (!$(selector).length) return;

			this.config = config && $.isPlainObject(config) ?
				$.extend({}, this._baseConfig, config) : this._baseConfig;

			this.config.itemSelector = selector;

			this.initCountQty();

			return this.pageCollection;

		},

		initCountQty: function() {
			//Variables
			var $self = this,
				collection = $self.pageCollection;

			//Actions
			this.collection.each(function(i, el) {
				//Variables
				console.log("checking event");
				var $this = $(el),
					$plus = $this.find('.js-plus'),
					$minus = $this.find('.js-minus'),
					$result = $this.find('.js-result'),
					resultVal = parseInt($result.val()),
					maxVal = parseInt($this.find('.js-result').attr('max'));

				$plus.on('click', function(e) {
					e.preventDefault();
					console.log(">>>>>" +  $result);
					resultVal += 1;

					if (resultVal <= maxVal) {
						$result.val(resultVal);
					} else {
						alert("재고가 부족합니다.");
						$result.val(resultVal -= 1);
					}



					$result.trigger('click');

				});

				$minus.on('click', function(e) {
					e.preventDefault();

					if (resultVal >= 2) {
						resultVal -= 1;

						$result.val(resultVal);
						$result.trigger('click');

					} else {
						return false;
					}
				});

				$result.keydown(function(e) {
					console.log(e.keyCode);
					var enter = e.keyCode === 13 ? true : false;

					if (enter) {
						e.preventDefault();
						resultVal = parseInt($result.val());
						if (resultVal > maxVal) {
							alert("재고가 부족합니다.");
							resultVal = maxVal;
						}

						$result.val(resultVal);
						$result.trigger('click');
					}
				})

				//Actions
				collection = collection.add($this);
			});
		}

	};

})(jQuery);