{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import System.Random
import System.IO.Unsafe

port :: Int
port = unsafePerformIO (getStdRandom (randomR (3000, 3010)))

main = do {
  -- print $ "The server is running on port " ++ show port;
  writeFile "server-port" (show port);
  scotty port $ do
    get "/" $ do
      text "Ok"
}
