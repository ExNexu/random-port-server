{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import System.Random
import System.IO.Unsafe

port :: Int
port = unsafePerformIO (getStdRandom (randomR (3000, 3010)))

filePath :: String
filePath = "/etc/apache2/server-port"

main = do {
  -- print $ "The server is running on port " ++ show port;
  writeFile filePath ("port " ++ show port);
  scotty port $ do
    get "/" $ do
      text "Ok"
}
