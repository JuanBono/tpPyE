module Lib
    ( someFunc
    ) where
import qualified Graphics.Gnuplot.Terminal.X11 as G
import qualified Control.Monad.Fix as F

someFunc :: IO ()
someFunc = putStrLn "someFunc"

f = F.fix
