module Handler.ParseUrl where

import           Import
import           Network.URI

instance ToJSON URI where
    toJSON (URI scheme authority path query fragment) = object ["scheme" .= scheme
                                                                , "authority" .= authInfo authority
                                                                , "path" .= path
                                                                , "query" .= query
                                                                , "fragment" .= fragment]
         where
             authInfo Nothing = object ["authority" .= ("No authority present" :: String)]
             authInfo (Just (URIAuth user host port)) = object ["user" .= user, "host" .= host, "port" .= port]

getParseUrlR :: String -> Handler Value
getParseUrlR url = return $ parseUrl (parseURI url)

parseUrl :: Maybe URI -> Value
parseUrl Nothing = object ["errormsg" .= ("Not a valid URI" :: String)]
parseUrl (Just uri) = toJSON uri