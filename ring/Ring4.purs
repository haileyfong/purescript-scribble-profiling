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
instance acceptS13 :: Accept A B4 S13 S14
instance receiveS14 :: Receive B4 S14 S15 M
instance disconnectS15 :: Disconnect A B2 S15 S16
instance disconnectS16 :: Disconnect A B4 S16 S11

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
instance connectS58 :: Connect B4 A S58 S58Connected
instance sendS58 :: Send A S58Connected S59 Connect
instance sendS59 :: Send A S59 S60 M
instance disconnectS60 :: Disconnect B4 B3 S60 S61
instance disconnectS61 :: Disconnect B4 A S61 S56

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

