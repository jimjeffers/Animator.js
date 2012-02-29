$(document).ready ->
  Animator.generate
    "name": "rocking"
    "keyframes":
      "from":
        "-prefix-transform": "rotate(-10deg) translate(50px,0)"
        "-prefix-animation-timing-function": "ease-in-out"
      "50%":
        "-prefix-transform": "rotate(10deg) translate(-150px,0)"
        "-prefix-animation-timing-function": "ease-in-out"
      "to": 
        "-prefix-transform": "rotate(-10deg) translate(50px,0)"
        "-prefix-animation-timing-function": "ease-in-out"
  
  Animator.animate
    element: $("#red")
    styles:
      "animationName": "rocking"
      "animationDuration": "5s"
      "animationIterationCount": "infinite"