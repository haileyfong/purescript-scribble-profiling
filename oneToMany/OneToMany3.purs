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
data M3 = M3
derive instance genericM3 :: Generic M3 _
instance encodeJsonM3 :: EncodeJson M3 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM3 :: DecodeJson M3 where
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

foreign import data S10 :: Type
foreign import data S10Connected :: Type
foreign import data S12 :: Type
foreign import data S13 :: Type
foreign import data S13Connected :: Type
foreign import data S14 :: Type
foreign import data S15 :: Type
foreign import data S16 :: Type
foreign import data S11 :: Type

instance initialA :: Initial A S10
instance terminalA :: Terminal A S11
instance connectS10 :: Connect A B2 S10 S10Connected
instance sendS10 :: Send B2 S10Connected S12 Connect
instance sendS12 :: Send B2 S12 S13 M2
instance connectS13 :: Connect A B3 S13 S13Connected
instance sendS13 :: Send B3 S13Connected S14 Connect
instance sendS14 :: Send B3 S14 S15 M3
instance disconnectS15 :: Disconnect A B2 S15 S16
instance disconnectS16 :: Disconnect A B3 S16 S11

foreign import data B3 :: Role

instance roleNameB3 :: RoleName B3 "B3"

foreign import data S31 :: Type
foreign import data S33 :: Type
foreign import data S34 :: Type
foreign import data S32 :: Type

instance initialB3 :: Initial B3 S31
instance terminalB3 :: Terminal B3 S32
instance acceptS31 :: Accept B3 A S31 S33
instance receiveS33 :: Receive A S33 S34 M3
instance disconnectS34 :: Disconnect B3 A S34 S32

foreign import data B2 :: Role

instance roleNameB2 :: RoleName B2 "B2"

foreign import data S22 :: Type
foreign import data S24 :: Type
foreign import data S25 :: Type
foreign import data S23 :: Type

instance initialB2 :: Initial B2 S22
instance terminalB2 :: Terminal B2 S23
instance acceptS22 :: Accept B2 A S22 S24
instance receiveS24 :: Receive A S24 S25 M2
instance disconnectS25 :: Disconnect B2 A S25 S23

