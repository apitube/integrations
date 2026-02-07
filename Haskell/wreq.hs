{-# LANGUAGE OverloadedStrings #-}

import Network.Wreq
import Control.Lens
import qualified Data.ByteString.Lazy.Char8 as L8

main :: IO ()
main = do
    let opts = defaults & param "per_page" .~ ["50"]
                        & param "api_key" .~ ["YOUR_API_KEY"]
    r <- getWith opts "https://api.apitube.io/v1/news/everything"
    L8.putStrLn (r ^. responseBody)
