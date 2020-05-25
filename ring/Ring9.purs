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

data Connect = Connect
derive instance genericConnect :: Generic Connect _
instance encodeJsonConnect :: EncodeJson Connect where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonConnect :: DecodeJson Connect where
  decodeJson = genericDecodeJsonWith jsonEncoding
data M = M
derive instance genericM :: Generic M _
instance encodeJsonM :: EncodeJson M where
  encodeJson = genericEncodeJsonWith jsonEncoding
instance decodeJsonM :: DecodeJson M where
  decodeJson = genericDecodeJsonWith jsonEncoding

foreign import data OneToMany :: Protocol

foreign import data A :: Role

instance roleNameA :: RoleName A "A"

foreign import data S10 :: Type
foreign import data S10Connected :: Type
foreign import data S12 :: Type
foreign import data S13 :: Type
foreign import data S14 :: Type
foreign import data S15 :: Type
foreign import data S16 :: Type
foreign import data S11 :: Type

instance initialA :: Initial A S10
instance terminalA :: Terminal A S11
instance connectS10 :: Connect A B2 S10 S10Connected
instance sendS10 :: Send B2 S10Connected S12 Connect
instance sendS12 :: Send B2 S12 S13 M
instance acceptS13 :: Accept A B9 S13 S14
instance receiveS14 :: Receive B9 S14 S15 M
instance disconnectS15 :: Disconnect A B2 S15 S16
instance disconnectS16 :: Disconnect A B9 S16 S11

foreign import data B9 :: Role

instance roleNameB9 :: RoleName B9 "B9"

foreign import data S120 :: Type
foreign import data S122 :: Type
foreign import data S123 :: Type
foreign import data S123Connected :: Type
foreign import data S124 :: Type
foreign import data S125 :: Type
foreign import data S126 :: Type
foreign import data S121 :: Type

instance initialB9 :: Initial B9 S120
instance terminalB9 :: Terminal B9 S121
instance acceptS120 :: Accept B9 B8 S120 S122
instance receiveS122 :: Receive B8 S122 S123 M
instance connectS123 :: Connect B9 A S123 S123Connected
instance sendS123 :: Send A S123Connected S124 Connect
instance sendS124 :: Send A S124 S125 M
instance disconnectS125 :: Disconnect B9 B8 S125 S126
instance disconnectS126 :: Disconnect B9 A S126 S121

foreign import data B8 :: Role

instance roleNameB8 :: RoleName B8 "B8"

foreign import data S110 :: Type
foreign import data S112 :: Type
foreign import data S113 :: Type
foreign import data S113Connected :: Type
foreign import data S114 :: Type
foreign import data S115 :: Type
foreign import data S116 :: Type
foreign import data S111 :: Type

instance initialB8 :: Initial B8 S110
instance terminalB8 :: Terminal B8 S111
instance acceptS110 :: Accept B8 B7 S110 S112
instance receiveS112 :: Receive B7 S112 S113 M
instance connectS113 :: Connect B8 B9 S113 S113Connected
instance sendS113 :: Send B9 S113Connected S114 Connect
instance sendS114 :: Send B9 S114 S115 M
instance disconnectS115 :: Disconnect B8 B7 S115 S116
instance disconnectS116 :: Disconnect B8 B9 S116 S111

foreign import data B7 :: Role

instance roleNameB7 :: RoleName B7 "B7"

foreign import data S100 :: Type
foreign import data S102 :: Type
foreign import data S103 :: Type
foreign import data S103Connected :: Type
foreign import data S104 :: Type
foreign import data S105 :: Type
foreign import data S106 :: Type
foreign import data S101 :: Type

instance initialB7 :: Initial B7 S100
instance terminalB7 :: Terminal B7 S101
instance acceptS100 :: Accept B7 B6 S100 S102
instance receiveS102 :: Receive B6 S102 S103 M
instance connectS103 :: Connect B7 B8 S103 S103Connected
instance sendS103 :: Send B8 S103Connected S104 Connect
instance sendS104 :: Send B8 S104 S105 M
instance disconnectS105 :: Disconnect B7 B6 S105 S106
instance disconnectS106 :: Disconnect B7 B8 S106 S101

foreign import data B6 :: Role

instance roleNameB6 :: RoleName B6 "B6"

foreign import data S85 :: Type
foreign import data S87 :: Type
foreign import data S88 :: Type
foreign import data S88Connected :: Type
foreign import data S89 :: Type
foreign import data S90 :: Type
foreign import data S91 :: Type
foreign import data S86 :: Type

instance initialB6 :: Initial B6 S85
instance terminalB6 :: Terminal B6 S86
instance acceptS85 :: Accept B6 B5 S85 S87
instance receiveS87 :: Receive B5 S87 S88 M
instance connectS88 :: Connect B6 B7 S88 S88Connected
instance sendS88 :: Send B7 S88Connected S89 Connect
instance sendS89 :: Send B7 S89 S90 M
instance disconnectS90 :: Disconnect B6 B5 S90 S91
instance disconnectS91 :: Disconnect B6 B7 S91 S86

foreign import data B5 :: Role

instance roleNameB5 :: RoleName B5 "B5"

foreign import data S70 :: Type
foreign import data S72 :: Type
foreign import data S73 :: Type
foreign import data S73Connected :: Type
foreign import data S74 :: Type
foreign import data S75 :: Type
foreign import data S76 :: Type
foreign import data S71 :: Type

instance initialB5 :: Initial B5 S70
instance terminalB5 :: Terminal B5 S71
instance acceptS70 :: Accept B5 B4 S70 S72
instance receiveS72 :: Receive B4 S72 S73 M
instance connectS73 :: Connect B5 B6 S73 S73Connected
instance sendS73 :: Send B6 S73Connected S74 Connect
instance sendS74 :: Send B6 S74 S75 M
instance disconnectS75 :: Disconnect B5 B4 S75 S76
instance disconnectS76 :: Disconnect B5 B6 S76 S71

foreign import data B4 :: Role

instance roleNameB4 :: RoleName B4 "B4"

foreign import data S55 :: Type
foreign import data S57 :: Type
foreign import data S58 :: Type
foreign import data S58Connected :: Type
foreign import data S59 :: Type
foreign import data S60 :: Type
foreign import data S61 :: Type
foreign import data S56 :: Type

instance initialB4 :: Initial B4 S55
instance terminalB4 :: Terminal B4 S56
instance acceptS55 :: Accept B4 B3 S55 S57
instance receiveS57 :: Receive B3 S57 S58 M
instance connectS58 :: Connect B4 B5 S58 S58Connected
instance sendS58 :: Send B5 S58Connected S59 Connect
instance sendS59 :: Send B5 S59 S60 M
instance disconnectS60 :: Disconnect B4 B3 S60 S61
instance disconnectS61 :: Disconnect B4 B5 S61 S56

foreign import data B3 :: Role

instance roleNameB3 :: RoleName B3 "B3"

foreign import data S40 :: Type
foreign import data S42 :: Type
foreign import data S43 :: Type
foreign import data S43Connected :: Type
foreign import data S44 :: Type
foreign import data S45 :: Type
foreign import data S46 :: Type
foreign import data S41 :: Type

instance initialB3 :: Initial B3 S40
instance terminalB3 :: Terminal B3 S41
instance acceptS40 :: Accept B3 B2 S40 S42
instance receiveS42 :: Receive B2 S42 S43 M
instance connectS43 :: Connect B3 B4 S43 S43Connected
instance sendS43 :: Send B4 S43Connected S44 Connect
instance sendS44 :: Send B4 S44 S45 M
instance disconnectS45 :: Disconnect B3 B2 S45 S46
instance disconnectS46 :: Disconnect B3 B4 S46 S41

foreign import data B2 :: Role

instance roleNameB2 :: RoleName B2 "B2"

foreign import data S25 :: Type
foreign import data S27 :: Type
foreign import data S28 :: Type
foreign import data S28Connected :: Type
foreign import data S29 :: Type
foreign import data S30 :: Type
foreign import data S31 :: Type
foreign import data S26 :: Type

instance initialB2 :: Initial B2 S25
instance terminalB2 :: Terminal B2 S26
instance acceptS25 :: Accept B2 A S25 S27
instance receiveS27 :: Receive A S27 S28 M
instance connectS28 :: Connect B2 B3 S28 S28Connected
instance sendS28 :: Send B3 S28Connected S29 Connect
instance sendS29 :: Send B3 S29 S30 M
instance disconnectS30 :: Disconnect B2 A S30 S31
instance disconnectS31 :: Disconnect B2 B3 S31 S26

