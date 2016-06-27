{-# LANGUAGE OverloadedStrings #-}
module Syntax where

import qualified Data.Attoparsec.Combinator as Comb

data Ping = Ping { bytes :: Int,
                   from :: String,
                   fromIP :: String,
                   icmpSeq :: Int, --
                   ttl :: Int, -- time to live
                   time :: Double -- ms
                 } deriving (Show, Eq)
