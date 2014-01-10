import           Handler.Home
import           Handler.ParseUrl
import           Import

mkYesodDispatch "App" resourcesApp

main :: IO ()
main = warpEnv App