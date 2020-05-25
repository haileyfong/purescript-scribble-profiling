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
data M5 = M5
derive instance genericM5 :: Generic M5 _
instance encodeJsonM5 :: EncodeJson M5 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM5 :: DecodeJson M5 where
  decodeJson = genericDecodeJsonWith jsonEncoding

foreign import data OneToMany :: Protocol

foreign import data A :: Role

instance roleNameA :: RoleName A "A"

foreign import data S16 :: Type
foreign import data S16Connected :: Type
foreign import data S18 :: Type
foreign import data S19 :: Type
foreign import data S19Connected :: Type
foreign import data S20 :: Type
foreign import data S21 :: Type
foreign import data S21Connected :: Type
foreign import data S22 :: Type
foreign import data S23 :: Type
foreign import data S23Connected :: Type
foreign import data S24 :: Type
foreign import data S25 :: Type
foreign import data S26 :: Type
foreign import data S27 :: Type
foreign import data S28 :: Type
foreign import data S17 :: Type

instance initialA :: Initial A S16
instance terminalA :: Terminal A S17
instance connectS16 :: Connect A B2 S16 S16Connected
instance sendS16 :: Send B2 S16Connected S18 Connect
instance sendS18 :: Send B2 S18 S19 M2
instance connectS19 :: Connect A B3 S19 S19Connected
instance sendS19 :: Send B3 S19Connected S20 Connect
instance sendS20 :: Send B3 S20 S21 M3
instance connectS21 :: Connect A B4 S21 S21Connected
instance sendS21 :: Send B4 S21Connected S22 Connect
instance sendS22 :: Send B4 S22 S23 M4
instance connectS23 :: Connect A B5 S23 S23Connected
instance sendS23 :: Send B5 S23Connected S24 Connect
instance sendS24 :: Send B5 S24 S25 M5
instance disconnectS25 :: Disconnect A B2 S25 S26
instance disconnectS26 :: Disconnect A B3 S26 S27
instance disconnectS27 :: Disconnect A B4 S27 S28
instance disconnectS28 :: Disconnect A B5 S28 S17

foreign import data B5 :: Role

instance roleNameB5 :: RoleName B5 "B5"

foreign import data S61 :: Type
foreign import data S63 :: Type
foreign import data S64 :: Type
foreign import data S62 :: Type

instance initialB5 :: Initial B5 S61
instance terminalB5 :: Terminal B5 S62
instance acceptS61 :: Accept B5 A S61 S63
instance receiveS63 :: Receive A S63 S64 M5
instance disconnectS64 :: Disconnect B5 A S64 S62

foreign import data B4 :: Role

instance roleNameB4 :: RoleName B4 "B4"

foreign import data S52 :: Type
foreign import data S54 :: Type
foreign import data S55 :: Type
foreign import data S53 :: Type

instance initialB4 :: Initial B4 S52
instance terminalB4 :: Terminal B4 S53
instance acceptS52 :: Accept B4 A S52 S54
instance receiveS54 :: Receive A S54 S55 M4
instance disconnectS55 :: Disconnect B4 A S55 S53

foreign import data B3 :: Role

instance roleNameB3 :: RoleName B3 "B3"

foreign import data S43 :: Type
foreign import data S45 :: Type
foreign import data S46 :: Type
foreign import data S44 :: Type

instance initialB3 :: Initial B3 S43
instance terminalB3 :: Terminal B3 S44
instance acceptS43 :: Accept B3 A S43 S45
instance receiveS45 :: Receive A S45 S46 M3
instance disconnectS46 :: Disconnect B3 A S46 S44

foreign import data B2 :: Role

instance roleNameB2 :: RoleName B2 "B2"

foreign import data S34 :: Type
foreign import data S36 :: Type
foreign import data S37 :: Type
foreign import data S35 :: Type

instance initialB2 :: Initial B2 S34
instance terminalB2 :: Terminal B2 S35
instance acceptS34 :: Accept B2 A S34 S36
instance receiveS36 :: Receive A S36 S37 M2
instance disconnectS37 :: Disconnect B2 A S37 S35

