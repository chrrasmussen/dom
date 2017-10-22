module Dom.Size exposing ( left, top, width, height, Boundary(..) )

{-| Figuring out the size of a node is actually pretty tricky. Nodes have
padding, borders, and margins. You can also scroll the content in a node in
many situations. Here it is as a picture:

<img src=""></img>

This module lets you choose one of these boundaries and then measure its size.

# Sizes
@docs width, height, Boundary

-}

import Dom exposing (Error, Id)
import Native.Dom
import Task exposing (Task)


{-| Get the position from left of a node, measured along a certain boundary.

If the node has the `hidden` attribute or the `display: none` style, this
will be zero.
-}
left : Boundary -> Id -> Task Error Float
left =
  Native.Dom.left


{-| Get the position from top of a node, measured along a certain boundary.

If the node has the `hidden` attribute or the `display: none` style, this
will be zero.
-}
top : Boundary -> Id -> Task Error Float
top =
  Native.Dom.top


{-| Get the width of a node, measured along a certain boundary.

If the node has the `hidden` attribute or the `display: none` style, this
will be zero.
-}
width : Boundary -> Id -> Task Error Float
width =
  Native.Dom.width


{-| Get the height of a node, measured along a certain boundary.

If the node has the `hidden` attribute or the `display: none` style, this
will be zero.
-}
height : Boundary -> Id -> Task Error Float
height =
  Native.Dom.height


{-| Check out [this diagram][diagram] to understand what all of these
boundaries refer to.

If you happen to know the JavaScript equivalents by heart, maybe this will help you:

  - `scrollHeight` is the same as `height Content`
  - `clientHeight` is the same as `height VisibleContent`
  - `offsetHeight` is the same as `height VisibleContentWithBorders`
  - `getBoundingClientRect().height` is the same as `height VisibleContentWithBordersAndMargins`

But again, look at [the diagram][diagram]. It makes this easier!

[diagram]:
-}
type Boundary
  = Content
  | VisibleContent
  | VisibleContentWithBorders
  | VisibleContentWithBordersAndMargins