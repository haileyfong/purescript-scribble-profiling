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
data M4 = M4
derive instance genericM4 :: Generic M4 _
instance encodeJsonM4 :: EncodeJson M4 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM4 :: DecodeJson M4 where
  decodeJson = genericDecodeJsonWith jsonEncoding

foreign import data OneToMany :: Protocol

foreign import data A :: Role

instance roleNameA :: RoleName A "A"

foreign import data S13 :: Type
foreign import data S13Connected :: Type
foreign import data S15 :: Type
foreign import data S16 :: Type
foreign import data S16Connected :: Type
foreign import data S17 :: Type
foreign import data S18 :: Type
foreign import data S18Connected :: Type
foreign import data S19 :: Type
foreign import data S20 :: Type
foreign import data S21 :: Type
foreign import data S22 :: Type
foreign import data S14 :: Type

instance initialA :: Initial A S13
instance terminalA :: Terminal A S14
instance connectS13 :: Connect A B2 S13 S13Connected
instance sendS13 :: Send B2 S13Connected S15 Connect
instance sendS15 :: Send B2 S15 S16 M2
instance connectS16 :: Connect A B3 S16 S16Connected
instance sendS16 :: Send B3 S16Connected S17 Connect
instance sendS17 :: Send B3 S17 S18 M3
instance connectS18 :: Connect A B4 S18 S18Connected
instance sendS18 :: Send B4 S18Connected S19 Connect
instance sendS19 :: Send B4 S19 S20 M4
instance disconnectS20 :: Disconnect A B2 S20 S21
instance disconnectS21 :: Disconnect A B3 S21 S22
instance disconnectS22 :: Disconnect A B4 S22 S14

foreign import data B4 :: Role

instance roleNameB4 :: RoleName B4 "B4"

foreign import data S46 :: Type
foreign import data S48 :: Type
foreign import data S49 :: Type
foreign import data S47 :: Type

instance initialB4 :: Initial B4 S46
instance terminalB4 :: Terminal B4 S47
instance acceptS46 :: Accept B4 A S46 S48
instance receiveS48 :: Receive A S48 S49 M4
instance disconnectS49 :: Disconnect B4 A S49 S47

foreign import data B3 :: Role

instance roleNameB3 :: RoleName B3 "B3"

foreign import data S37 :: Type
foreign import data S39 :: Type
foreign import data S40 :: Type
foreign import data S38 :: Type

instance initialB3 :: Initial B3 S37
instance terminalB3 :: Terminal B3 S38
instance acceptS37 :: Accept B3 A S37 S39
instance receiveS39 :: Receive A S39 S40 M3
instance disconnectS40 :: Disconnect B3 A S40 S38

foreign import data B2 :: Role

instance roleNameB2 :: RoleName B2 "B2"

foreign import data S28 :: Type
foreign import data S30 :: Type
foreign import data S31 :: Type
foreign import data S29 :: Type

instance initialB2 :: Initial B2 S28
instance terminalB2 :: Terminal B2 S29
instance acceptS28 :: Accept B2 A S28 S30
instance receiveS30 :: Receive A S30 S31 M2
instance disconnectS31 :: Disconnect B2 A S31 S29

