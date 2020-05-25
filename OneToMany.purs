module Main where

import Control.Parallel
import Control.Apply ((<*>))
import Data.Argonaut.Core (Json)
import Data.Symbol (SProxy(SProxy))
import Data.Tuple (Tuple(..))
import Prelude (Unit, bind, discard, otherwise, pure, show, ($), (*), (+), (-), (<<<), (<=), (>), min, unit, (>>=))
import Data.Functor ((<$>))
import Scribble.Session (Session, session, connect, send, receive, lift, whileWaiting, select, choice, disconnect, request)
import Scribble.FSM (Protocol(..), Role(..))
import Scribble.Protocol.Large.OneToMany as OTM
import Scribble.Transport.WebSocket (WebSocket, URL(..))
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Effect.Aff (Aff(..))
import Effect.Aff.Class (liftAff)
import Effect.Class (liftEffect)
import Effect.Console (log)
import Concur.React (HTML)
import Concur.Core (Widget)
import Control.Bind.Indexed (ibind)
import Control.Applicative.Indexed (ipure)
import Concur.React.Run (runWidgetInDom)
import Effect (Effect)

main :: Effect Unit
main = runWidgetInDom "root" $ (mbServer)

mbServer :: Widget HTML Unit
mbServer
  = session
        (Proxy :: Proxy WebSocket)
        (Role :: Role OTM.A) $ do
