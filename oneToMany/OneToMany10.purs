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
data M7 = M7
derive instance genericM7 :: Generic M7 _
instance encodeJsonM7 :: EncodeJson M7 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM7 :: DecodeJson M7 where
  decodeJson = genericDecodeJsonWith jsonEncoding
data M8 = M8
derive instance genericM8 :: Generic M8 _
instance encodeJsonM8 :: EncodeJson M8 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM8 :: DecodeJson M8 where
  decodeJson = genericDecodeJsonWith jsonEncoding
data M9 = M9
derive instance genericM9 :: Generic M9 _
instance encodeJsonM9 :: EncodeJson M9 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM9 :: DecodeJson M9 where
  decodeJson = genericDecodeJsonWith jsonEncoding
data M10 = M10
derive instance genericM10 :: Generic M10 _
instance encodeJsonM10 :: EncodeJson M10 where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM10 :: DecodeJson M10 where
  decodeJson = genericDecodeJsonWith jsonEncoding

foreign import data OneToMany :: Protocol

foreign import data A :: Role

instance roleNameA :: RoleName A "A"

foreign import data S22 :: Type
foreign import data S22Connected :: Type
foreign import data S24 :: Type
foreign import data S25 :: Type
foreign import data S25Connected :: Type
foreign import data S26 :: Type
foreign import data S27 :: Type
foreign import data S27Connected :: Type
foreign import data S28 :: Type
foreign import data S29 :: Type
foreign import data S29Connected :: Type
foreign import data S30 :: Type
foreign import data S31 :: Type
foreign import data S31Connected :: Type
foreign import data S32 :: Type
foreign import data S33 :: Type
foreign import data S33Connected :: Type
foreign import data S35Connected :: Type
foreign import data S44Connected :: Type
foreign import data S46Connected :: Type
foreign import data S34 :: Type
foreign import data S35 :: Type
foreign import data S36 :: Type
foreign import data S37 :: Type
foreign import data S38 :: Type
foreign import data S39 :: Type
foreign import data S40 :: Type
foreign import data S41 :: Type
foreign import data S42 :: Type
foreign import data S43 :: Type
foreign import data S44 :: Type
foreign import data S45 :: Type
foreign import data S46 :: Type
foreign import data S47 :: Type
foreign import data S48 :: Type
foreign import data S49 :: Type
foreign import data S23 :: Type

instance initialA :: Initial A S22
instance terminalA :: Terminal A S23
instance connectS22 :: Connect A B2 S22 S22Connected
instance sendS22 :: Send B2 S22Connected S24 Connect
instance sendS24 :: Send B2 S24 S25 M2
instance connectS25 :: Connect A B3 S25 S25Connected
instance sendS25 :: Send B3 S25Connected S26 Connect
instance sendS26 :: Send B3 S26 S27 M3
instance connectS27 :: Connect A B4 S27 S27Connected
instance sendS27 :: Send B4 S27Connected S28 Connect
instance sendS28 :: Send B4 S28 S29 M4
instance connectS29 :: Connect A B5 S29 S29Connected
instance sendS29 :: Send B5 S29Connected S30 Connect
instance sendS30 :: Send B5 S30 S31 M5
instance connectS31 :: Connect A B6 S31 S31Connected
instance sendS31 :: Send B6 S31Connected S32 Connect
instance sendS32 :: Send B6 S32 S33 M6
instance connectS33 :: Connect A B7 S33 S33Connected
instance sendS33 :: Send B7 S33Connected S34 Connect
instance sendS34 :: Send B7 S34 S35 M7
instance connectS35 :: Connect A B8 S35 S35Connected
instance sendS35 :: Send B8 S35Connected S43 Connect
instance sendS36 :: Send B8 S43 S44 M8
instance connectS37 :: Connect A B9 S44 S44Connected
instance sendS37 :: Send B8 S44Connected S45 Connect
instance sendS38 :: Send B8 S45 S46 M9
instance connectS39 :: Connect A B10 S46 S46Connected
instance sendS39 :: Send B8 S46Connected S47 Connect
instance sendS40 :: Send B8 S47 S48 M10
instance disconnectS35 :: Disconnect A B2 S48 S36
instance disconnectS36 :: Disconnect A B3 S36 S37
instance disconnectS37 :: Disconnect A B4 S37 S38
instance disconnectS38 :: Disconnect A B5 S38 S39
instance disconnectS39 :: Disconnect A B6 S39 S40
instance disconnectS40 :: Disconnect A B7 S40 S41
instance disconnectS41 :: Disconnect A B8 S41 S42
instance disconnectS42 :: Disconnect A B9 S42 S49
instance disconnectS43 :: Disconnect A B10 S49 S23

foreign import data B10 :: Role

instance roleNameB10 :: RoleName B10 "B10"

foreign import data S121 :: Type
foreign import data S123 :: Type
foreign import data S124 :: Type
foreign import data S122 :: Type

instance initialB10 :: Initial B10 S121
instance terminalB10 :: Terminal B10 S122
instance acceptS121 :: Accept B10 A S121 S123
instance receiveS123 :: Receive A S123 S124 M10
instance disconnectS124 :: Disconnect B10 A S124 S122

foreign import data B9 :: Role

instance roleNameB9 :: RoleName B9 "B9"

foreign import data S111 :: Type
foreign import data S113 :: Type
foreign import data S114 :: Type
foreign import data S112 :: Type

instance initialB9 :: Initial B9 S111
instance terminalB9 :: Terminal B9 S112
instance acceptS111 :: Accept B9 A S111 S113
instance receiveS113 :: Receive A S113 S114 M9
instance disconnectS114 :: Disconnect B9 A S114 S112

foreign import data B8 :: Role

instance roleNameB8 :: RoleName B8 "B8"

foreign import data S101 :: Type
foreign import data S103 :: Type
foreign import data S104 :: Type
foreign import data S102 :: Type

instance initialB8 :: Initial B8 S101
instance terminalB8 :: Terminal B8 S102
instance acceptS101 :: Accept B8 A S101 S103
instance receiveS103 :: Receive A S103 S104 M8
instance disconnectS104 :: Disconnect B8 A S104 S102

foreign import data B7 :: Role

instance roleNameB7 :: RoleName B7 "B7"

foreign import data S91 :: Type
foreign import data S93 :: Type
foreign import data S94 :: Type
foreign import data S92 :: Type

instance initialB7 :: Initial B7 S91
instance terminalB7 :: Terminal B7 S92
instance acceptS91 :: Accept B7 A S91 S93
instance receiveS93 :: Receive A S93 S94 M7
instance disconnectS94 :: Disconnect B7 A S94 S92

foreign import data B6 :: Role

instance roleNameB6 :: RoleName B6 "B6"

foreign import data S82 :: Type
foreign import data S84 :: Type
foreign import data S85 :: Type
foreign import data S83 :: Type

instance initialB6 :: Initial B6 S82
instance terminalB6 :: Terminal B6 S83
instance acceptS82 :: Accept B6 A S82 S84
instance receiveS84 :: Receive A S84 S85 M6
instance disconnectS85 :: Disconnect B6 A S85 S83

foreign import data B5 :: Role

instance roleNameB5 :: RoleName B5 "B5"

foreign import data S73 :: Type
foreign import data S75 :: Type
foreign import data S76 :: Type
foreign import data S74 :: Type

instance initialB5 :: Initial B5 S73
instance terminalB5 :: Terminal B5 S74
instance acceptS73 :: Accept B5 A S73 S75
instance receiveS75 :: Receive A S75 S76 M5
instance disconnectS76 :: Disconnect B5 A S76 S74

foreign import data B4 :: Role

instance roleNameB4 :: RoleName B4 "B4"

foreign import data S64 :: Type
foreign import data S66 :: Type
foreign import data S67 :: Type
foreign import data S65 :: Type

instance initialB4 :: Initial B4 S64
instance terminalB4 :: Terminal B4 S65
instance acceptS64 :: Accept B4 A S64 S66
instance receiveS66 :: Receive A S66 S67 M4
instance disconnectS67 :: Disconnect B4 A S67 S65

foreign import data B3 :: Role

instance roleNameB3 :: RoleName B3 "B3"

foreign import data S55 :: Type
foreign import data S57 :: Type
foreign import data S58 :: Type
foreign import data S56 :: Type

instance initialB3 :: Initial B3 S55
instance terminalB3 :: Terminal B3 S56
instance acceptS55 :: Accept B3 A S55 S57
instance receiveS57 :: Receive A S57 S58 M3
instance disconnectS58 :: Disconnect B3 A S58 S56

foreign import data B2 :: Role

instance roleNameB2 :: RoleName B2 "B2"

foreign import data S6 :: Type
foreign import data S8 :: Type
foreign import data S9 :: Type
foreign import data S7 :: Type

instance initialB2 :: Initial B2 S6
instance terminalB2 :: Terminal B2 S7
instance acceptS46 :: Accept B2 A S6 S8
instance receiveS48 :: Receive A S8 S9 M2
instance disconnectS49 :: Disconnect B2 A S9 S7

