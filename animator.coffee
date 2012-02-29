class @Animator
  @generate: (params={}) ->
    animation = "@-#{Animator.prefix()}-keyframes #{params["name"]} {"
    for keyframe, rules of params["keyframes"]
      animation += "#{keyframe} {"
      for property,value of rules
        animation += "#{property.replace("prefix",Animator.prefix())}: #{value};"
      animation += "}"
    animation += "}"
    
    if (lastSheet = document.styleSheets[document.styleSheets.length-1])?
      index = lastSheet.cssRules.length if lastSheet.cssRules?
      lastSheet.insertRule(animation, index || 0)
  
  @animate: (params={}) ->
    if params.element? and params.element.each?
      params.element.each (index, element) ->
        Animator._setStylesOn(element,params.styles)
    else if params.element?
      Animator._setStylesOn(element,params.styles)
  
  @_setStylesOn: (element,styles={}) ->
    for property, value of styles
      console.log Modernizr.prefixed(property)
      element.style[Modernizr.prefixed(property)] = value
  
  @prefix: ->
    unless Animator._prefix?
      style = document.createElement('test').style
      for prefix in Modernizr._domPrefixes
        Animator._prefix = prefix if style["-#{prefix}-animation-name"]?
    Animator._prefix