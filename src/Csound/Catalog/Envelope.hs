-- | Envelopes
module Csound.Catalog.Envelope(
    fadeIn, percussive, revPercussive        
) where

import Csound.Base

-- | Fades in with the given attack time.
fadeIn :: D -> Sig
fadeIn att = linseg [0, att, 1]

-- | An exponential envelope for the percussive sound. It takes in a time of the decay section.
percussive :: D -> Sig
percussive dec = expsegr [0.001, 0.01, 1, dec, 0.001] 0.001 (dec / 2)

-- | A reversed exponential envelope for the percussive sound. It takes a time of the decay section
-- of the original envelope.
revPercussive :: D -> Sig
revPercussive dec = expsegr [0.001, dec, 1, 0.01, 0.001] 0.001 0.01

