module Scribble.Protocol.Large.OneToMany where

import Scribble.FSM
import Data.Void (Void)
import Data.Tuple (Tuple)

-- From purescript-argonaut-codecs
import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Encode (class EncodeJson)
import Data.Argonaut.Core (Json) -- From purescript-argonaut-core
import Data.Generic.Rep (class Generic) -- From purescript-generics-rep
-- From purescript-argonaut-generic
import Data.Argonaut.Decode.Generic.Rep (genericDecodeJsonWith)
import Data.Argonaut.Encode.Generic.Rep (genericEncodeJsonWith)
import Data.Argonaut.Types.Generic.Rep (Encoding)


jsonEncoding :: Encoding
jsonEncoding =
  { tagKey: "tag"
  , valuesKey: "values"
  , unwrapSingleArguments: true
  }

data M2 = M2
derive instance genericM2 :: Generic M2 _
instance encodeJsonM2 :: EncodeJson M2 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM2 :: DecodeJson M2 where
  decodeJson = genericDecodeJsonWith jsonEncoding
data Connect = Connect
derive instance genericConnect :: Generic Connect _
instance encodeJsonConnect :: EncodeJson Connect where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonConnect :: DecodeJson Connect where
  decodeJson = genericDecodeJsonWith jsonEncoding

foreign import data OneToMany :: Protocol

foreign import data A :: Role

instance roleNameA :: RoleName A "A"

foreign import data S7 :: Type
foreign import data S7Connected :: Type
foreign import data S9 :: Type
foreign import data S10 :: Type
foreign import data S8 :: Type

instance initialA :: Initial A S7
instance terminalA :: Terminal A S8
instance connectS7 :: Connect A B2 S7 S7Connected
instance sendS7 :: Send B2 S7Connected S9 Connect
instance sendS9 :: Send B2 S9 S10 M2
instance disconnectS10 :: Disconnect A B2 S10 S8

foreign import data B2 :: Role

instance roleNameB2 :: RoleName B2 "B2"

foreign import data S16 :: Type
foreign import data S18 :: Type
foreign import data S19 :: Type
foreign import data S17 :: Type

instance initialB2 :: Initial B2 S16
instance terminalB2 :: Terminal B2 S17
instance acceptS16 :: Accept B2 A S16 S18
instance receiveS18 :: Receive A S18 S19 M2
instance disconnectS19 :: Disconnect B2 A S19 S17

