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
data M6 = M6
derive instance genericM6 :: Generic M6 _
instance encodeJsonM6 :: EncodeJson M6 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM6 :: DecodeJson M6 where
  decodeJson = genericDecodeJsonWith jsonEncoding

foreign import data OneToMany :: Protocol

foreign import data A :: Role

instance roleNameA :: RoleName A "A"

foreign import data S19 :: Type
foreign import data S19Connected :: Type
foreign import data S21 :: Type
foreign import data S22 :: Type
foreign import data S22Connected :: Type
foreign import data S23 :: Type
foreign import data S24 :: Type
foreign import data S24Connected :: Type
foreign import data S25 :: Type
foreign import data S26 :: Type
foreign import data S26Connected :: Type
foreign import data S27 :: Type
foreign import data S28 :: Type
foreign import data S28Connected :: Type
foreign import data S29 :: Type
foreign import data S30 :: Type
foreign import data S31 :: Type
foreign import data S32 :: Type
foreign import data S33 :: Type
foreign import data S34 :: Type
foreign import data S20 :: Type

instance initialA :: Initial A S19
instance terminalA :: Terminal A S20
instance connectS19 :: Connect A B2 S19 S19Connected
instance sendS19 :: Send B2 S19Connected S21 Connect
instance sendS21 :: Send B2 S21 S22 M2
instance connectS22 :: Connect A B3 S22 S22Connected
instance sendS22 :: Send B3 S22Connected S23 Connect
instance sendS23 :: Send B3 S23 S24 M3
instance connectS24 :: Connect A B4 S24 S24Connected
instance sendS24 :: Send B4 S24Connected S25 Connect
instance sendS25 :: Send B4 S25 S26 M4
instance connectS26 :: Connect A B5 S26 S26Connected
instance sendS26 :: Send B5 S26Connected S27 Connect
instance sendS27 :: Send B5 S27 S28 M5
instance connectS28 :: Connect A B6 S28 S28Connected
instance sendS28 :: Send B6 S28Connected S29 Connect
instance sendS29 :: Send B6 S29 S30 M6
instance disconnectS30 :: Disconnect A B2 S30 S31
instance disconnectS31 :: Disconnect A B3 S31 S32
instance disconnectS32 :: Disconnect A B4 S32 S33
instance disconnectS33 :: Disconnect A B5 S33 S34
instance disconnectS34 :: Disconnect A B6 S34 S20

foreign import data B6 :: Role

instance roleNameB6 :: RoleName B6 "B6"

foreign import data S76 :: Type
foreign import data S78 :: Type
foreign import data S79 :: Type
foreign import data S77 :: Type

instance initialB6 :: Initial B6 S76
instance terminalB6 :: Terminal B6 S77
instance acceptS76 :: Accept B6 A S76 S78
instance receiveS78 :: Receive A S78 S79 M6
instance disconnectS79 :: Disconnect B6 A S79 S77

foreign import data B5 :: Role

instance roleNameB5 :: RoleName B5 "B5"

foreign import data S67 :: Type
foreign import data S69 :: Type
foreign import data S70 :: Type
foreign import data S68 :: Type

instance initialB5 :: Initial B5 S67
instance terminalB5 :: Terminal B5 S68
instance acceptS67 :: Accept B5 A S67 S69
instance receiveS69 :: Receive A S69 S70 M5
instance disconnectS70 :: Disconnect B5 A S70 S68

foreign import data B4 :: Role

instance roleNameB4 :: RoleName B4 "B4"

foreign import data S58 :: Type
foreign import data S60 :: Type
foreign import data S61 :: Type
foreign import data S59 :: Type

instance initialB4 :: Initial B4 S58
instance terminalB4 :: Terminal B4 S59
instance acceptS58 :: Accept B4 A S58 S60
instance receiveS60 :: Receive A S60 S61 M4
instance disconnectS61 :: Disconnect B4 A S61 S59

foreign import data B3 :: Role

instance roleNameB3 :: RoleName B3 "B3"

foreign import data S49 :: Type
foreign import data S51 :: Type
foreign import data S52 :: Type
foreign import data S50 :: Type

instance initialB3 :: Initial B3 S49
instance terminalB3 :: Terminal B3 S50
instance acceptS49 :: Accept B3 A S49 S51
instance receiveS51 :: Receive A S51 S52 M3
instance disconnectS52 :: Disconnect B3 A S52 S50

foreign import data B2 :: Role

instance roleNameB2 :: RoleName B2 "B2"

foreign import data S40 :: Type
foreign import data S42 :: Type
foreign import data S43 :: Type
foreign import data S41 :: Type

instance initialB2 :: Initial B2 S40
instance terminalB2 :: Terminal B2 S41
instance acceptS40 :: Accept B2 A S40 S42
instance receiveS42 :: Receive A S42 S43 M2
instance disconnectS43 :: Disconnect B2 A S43 S41

