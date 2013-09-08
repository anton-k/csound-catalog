-- | Instruments from Csound amsterdam catalog by Jean-Claude Risset
module Csound.Catalog.Wave.Amsterdam(
    tibetan        
) where

import Csound.Base

-- | Tibetan chant. It's a chorus of many sinusoids.
--
-- > tibetan n off cps
--
-- * n - the number of sinusoids (the best is 9)
--
-- * off - frequency step of the harmonics ~ (0.01, 0.03)
-- 
-- * cps - the frequency of the note
tibetan :: Int -> Sig -> D -> Sig
tibetan n off cps = chorus dts (oscBy wave) (sig cps)
    where wave = ifB (cps <* 230) (waveBy 5) (ifB (cps <* 350) (waveBy 3) (waveBy 1))
          waveBy x = sines $ [0.3, 0, 0, 0] ++ replicate x 0.1

          dts = fmap ((* off) . fromIntegral) $ let dx = div n 2 in fmap (\x -> x - dx) [0 .. n - 1]

