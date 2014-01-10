module Foundation where

import           Yesod
import           Yesod.Default.Util
import           Yesod.Form.Jquery

data App = App

instance Yesod App

mkYesodData "App" [parseRoutes|
/         HomeR     GET
/url/#String/parts ParseUrlR GET
|]
