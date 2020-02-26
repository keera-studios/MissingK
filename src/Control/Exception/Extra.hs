module Control.Exception.Extra where

import           GHC.Conc
import qualified Control.Exception as E

-- | Returns a given computation ignoring an exception
anyway :: a -> E.SomeException -> a
anyway f _ = f

-- | Execute a computation using a handler to handle all exceptions. Note
-- that this does not really handle all possible exceptions reported by GTK+.
--
-- A more comprehensive version would be:
--
-- @
-- import System.Glib.GError   -- from glib package
--
-- handleAllExceptions :: IO () -> IO () -> IO ()
-- handleAllExceptions handler op = do
--     setUncaughtExceptionHandler (anyway handler)
--     E.handle (anyway handler) $ handleGError (anywayG handler) op
--   where
--     anywayG :: IO a -> GError -> IO a
--     anywayG x (GError _dom _code _msg) = x
-- @
handleExceptions :: IO a -> IO a -> IO a
handleExceptions handler = E.handle (anyway handler)

-- | Tries to execute all the IO computations
-- until one succeeds
trySeq :: [IO ()] -> IO ()
trySeq []     = return ()
trySeq (x:xs) = E.handle (anyway (trySeq xs)) x
