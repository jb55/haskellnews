{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

module HN.View.Template where

import HN.View

template name innerhead innerbody = do
  docType
  html $ do
    head $ do link ! rel "stylesheet" ! type_ "text/css" ! href "/css/bootstrap.min.css"
              link ! rel "stylesheet" ! type_ "text/css" ! href "/css/bootstrap-responsive.css"
              link ! rel "stylesheet" ! type_ "text/css" ! href "/css/haskellnews.css"
              meta ! httpEquiv "Content-Type" ! content "text/html; charset=UTF-8"
              innerhead
    body !# name $ do
      innerbody

showCount :: (Show n,Integral n) => n -> String
showCount = reverse . foldr merge "" . zip ("000,00,00,00"::String) . reverse . show where
  merge (f,c) rest | f == ',' = "," ++ [c] ++ rest
                   | otherwise = [c] ++ rest

footer =
  div !# "footer" $
    div !. "container" $ do
      p !. "muted credit" $ do
        a ! href "http://haskellnews.org" $ "Haskell News"
        " by "
        a ! href "http://chrisdone.com" $ "Chris Done"
        " | "
        a ! href "https://github.com/chrisdone/haskellnews" $ "Source code"
        " | "
        a ! href "http://haskell.org/" $ "Haskell"