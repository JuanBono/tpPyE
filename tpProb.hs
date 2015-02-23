{-# LANGUAGE RankNTypes #-}

import Text.CSV
import Math.Statistics

archivo :: String 
archivo = "/home/juan/Programacion/Haskell/Prob/tpPyE/datos.csv"

main :: IO ()
main = do
  input <- readFile archivo
  let datos = parseCSV archivo input
      hacer f = either handleError (doWork f) datos
      maximo = hacer maximum
      minimo = hacer minimum
      rango = hacer range
      mediana = hacer median
      media = hacer mean
      desviacionStandard = hacer stddev
    in
   putStr ("\n El maximo es: "++maximo++
           "\n El minimo es: "++minimo++
           "\n El rango es: "++rango++
           "\n La mediana es: "++mediana++
           "\n La media es: "++media++
           "\n La desviacion standard es: "++desviacionStandard++
           "\n\n")

handleError :: forall t. t -> String
handleError _  = "Error"
doWork :: forall b. Show b => ([Double] -> b) -> [[String]] -> String
doWork f csvData = (show.f.(map valor).tail) csvData

valor :: [String] -> Double
valor [_,b] = toDouble b
toDouble :: String -> Double
toDouble = read

