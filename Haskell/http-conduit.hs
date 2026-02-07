{-# LANGUAGE OverloadedStrings #-}

import Network.HTTP.Simple
import qualified Data.ByteString.Lazy.Char8 as L8

main :: IO ()
main = do
    let request = setRequestQueryString
            [ ("per_page", Just "50")
            , ("api_key", Just "YOUR_API_KEY")
            ]
            "GET https://api.apitube.io/v1/news/everything"
    response <- httpLBS request
    L8.putStrLn (getResponseBody response)
