(function() {

  this.Animator = (function() {

    function Animator() {}

    Animator.generate = function(params) {
      var animation, index, keyframe, lastSheet, property, rules, value, _ref;
      if (params == null) params = {};
      animation = "@-" + (Animator.prefix()) + "-keyframes " + params["name"] + " {";
      _ref = params["keyframes"];
      for (keyframe in _ref) {
        rules = _ref[keyframe];
        animation += "" + keyframe + " {";
        for (property in rules) {
          value = rules[property];
          animation += "" + (property.replace("prefix", Animator.prefix())) + ": " + value + ";";
        }
        animation += "}";
      }
      animation += "}";
      console.log(animation);
      if ((lastSheet = document.styleSheets[document.styleSheets.length - 1]) != null) {
        if (lastSheet.cssRules != null) index = lastSheet.cssRules.length;
        return lastSheet.insertRule(animation, index || 0);
      }
    };

    Animator.animate = function(params) {
      if (params == null) params = {};
      return params.element.each(function(index, element) {
        return Animator._setStylesOn(element, params.styles);
      });
    };

    Animator._setStylesOn = function(element, styles) {
      var property, value;
      if (styles == null) styles = {};
      for (property in styles) {
        value = styles[property];
        console.log(Modernizr.prefixed(property));
        element.style[Modernizr.prefixed(property)] = value;
      }
      return console.log(element.style);
    };

    Animator.prefix = function() {
      var prefix, style, _i, _len, _ref;
      if (Animator._prefix == null) {
        style = document.createElement('test').style;
        _ref = Modernizr._domPrefixes;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          prefix = _ref[_i];
          if (style["-" + prefix + "-animation-name"] != null) {
            Animator._prefix = prefix;
          }
        }
      }
      return Animator._prefix;
    };

    return Animator;

  })();

}).call(this);
