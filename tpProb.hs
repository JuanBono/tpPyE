{-# LANGUAGE RankNTypes #-}

import Text.CSV
import Math.Statistics

archivo :: String 
archivo = "/home/juan/Programacion/Haskell/Prob/datos.csv"

main :: IO ()
main = do
  input <- readFile archivo
  let datos = parseCSV archivo input
      hacer f = either handleError (doWork f) datos
      maximo = hacer maximum
      minimo = hacer minimum
      rango = hacer calcularRango
      mediana = hacer calcularMediana
      media = hacer calcularMedia
      desviacionStandard = hacer calcularDStd
    in
   putStr ("\n El maximo es: "++maximo++
           "\n El minimo es: "++minimo++
           "\n El rango es: "++rango++
           "\n La mediana es: "++mediana++
           "\n La media es: "++media++
           "\n La desviacion standard es: "++desviacionStandard++
           "\n\n")

calcularRango :: [Int] -> Integer
calcularRango = range . (map fromIntegral)
calcularDStd :: [Int] -> Double 
calcularDStd = stddev . (map fromIntegral)
calcularMedia :: [Int] -> Double
calcularMedia = mean . (map fromIntegral)
calcularMediana :: [Int] -> Double
calcularMediana = median . (map fromIntegral)

handleError :: forall t. t -> String
handleError _  = "Error"
doWork :: forall b. Show b => ([Int] -> b) -> [[String]] -> String
doWork f csvData = (show.f.(map valor).tail) csvData
valor :: [String] -> Int
valor [_,b] = toInt b
toInt :: String -> Int
toInt = read

