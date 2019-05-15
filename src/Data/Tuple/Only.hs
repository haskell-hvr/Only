{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveFoldable     #-}
{-# LANGUAGE DeriveFunctor      #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE DeriveTraversable  #-}
{-# LANGUAGE Safe               #-}

module Data.Tuple.Only where

import           Control.DeepSeq  (NFData (rnf))
import           Data.Data        (Data)
import           Data.Foldable    (Foldable (..))
import           Data.Traversable (Traversable (..))
import           Data.Typeable    (Typeable)
import           GHC.Generics     (Generic)

-- | The 1-tuple type or single-value "collection".
--
-- This type is structurally equivalent to the
-- 'Data.Functor.Identity.Identity' type, but its intent is more
-- about serving as the anonymous 1-tuple type missing from Haskell for attaching
-- typeclass instances.
--
-- Parameter usage example:
--
-- @encodeSomething ('Only' (42::Int))@
--
-- Result usage example:
--
-- @xs <- decodeSomething
--forM_ xs $ \\('Only' id) -> {- ... -}@
--
newtype Only a = Only { fromOnly :: a }
               deriving (Eq, Ord, Read, Show, Generic, Functor, Foldable, Traversable, Data, Typeable)

instance NFData a => NFData (Only a) where
    rnf = rnf . fromOnly
