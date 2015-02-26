{-# LANGUAGE RankNTypes #-}
import Text.CSV
import Math.Statistics

archivo :: String 
archivo = "/home/juan/Programacion/Haskell/Prob/tpPyE/datos.csv"

entre :: forall t. Ord t => t -> t -> [t] -> [t]
entre x y lista = [n | n <- lista, x<=n && n<=y]
verMaybe :: forall t. Maybe t -> t
verMaybe (Just x) = x

main :: IO ()
main = do
  input <- readFile archivo
  let datos = parseCSV archivo input
      hacer f = either handleError (doWork f) datos
      l1 = hacer (entre 200 300)
      l2 = hacer (entre 300 400)
      l3 = hacer (entre 400 500)
      l4 = hacer (entre 500 600) 
      l5 = hacer (entre 600 700)
      l6 = hacer (entre 700 800)
      longitud = hacer (length)
    in
   putStr ("\n El maximo es: "++(hacer maximum)++
           "\n El minimo es: "++(hacer minimum)++
           "\n El rango es: "++(hacer range)++
           "\n La mediana es: "++(hacer median)++
           "\n La media es: "++(hacer mean)++
           "\n La moda es: "++(hacer (verMaybe.mode))++
           "\n La desviacion standard es: "++(hacer stddev)++
           "\n La desviacion normal es: " ++(hacer avgdev)++
           "\n La varianza es: "++(hacer var)++
           "\n L1 es: "++l1++" f abs: "++(hacer (length . (entre 200 300)))++
           "\n L2 es: "++l2++" f abs: "++(hacer (length . (entre 300 400)))++
           "\n L3 es: "++l3++" f abs: "++(hacer (length . (entre 400 500)))++
           "\n L4 es: "++l4++" f abs: "++(hacer (length . (entre 500 600)))++
           "\n L5 es: "++l5++" f abs: "++(hacer (length . (entre 600 700)))++
           "\n L6 es: "++l6++" f abs: "++(hacer (length . (entre 700 800)))++
           "\n cantidad de datos: "++longitud++
           "\n\n")

handleError :: forall t. t -> String
handleError _  = "Error"
doWork :: forall b. Show b => ([Double] -> b) -> [[String]] -> String
doWork f = (show.f.(map valor).tail) 
valor :: [String] -> Double
valor [_,b] = toDouble b
toDouble :: String -> Double
toDouble = read






