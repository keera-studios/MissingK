module Control.Arrow.Extra
  ( module Control.Arrow.Extra
  , module Control.Arrow
  )
 where

import Control.Arrow

both :: (a -> b) -> (a, a) -> (b, b)
both f (x, y) = (f x, f y)

both2 :: (a -> b -> c) -> (a, a) -> (b, b) -> (c, c)
both2 f (x1, x2) (y1, y2) = (f x1 y1, f x2 y2)
