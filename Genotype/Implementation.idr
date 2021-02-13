module Genotype.Implementation

import Genotype.Specification

import Data.List

export
Show Nucleotype where
    show AA = "AA"
    show GG = "GG"
    show _ = "??" 

export
Show Person where
    show p = p.firstName ++ " "
           ++ p.lastName

export
Show Polymorphism where
    show p = p.rs

export
Show SNP where
    show snp = show snp.polymorphism
             ++ show snp.nucleotype

export
Show Risk where
    show r = show r.snp ++ " ("
           ++ r.description ++ ")"

export
Show Genome where
    show g = show g.person ++ " "
           ++ show (map show g.snps)

export
Eq Nucleotype where
    AA == AA = True
    GG == GG = True
    _ == _ = False

export
Eq Person where
    (==) x y = show x == show y

export
Eq Polymorphism where
    (==) x y = show x == show y

export
Eq SNP where
    (==) x y = show x == show y

export
Eq Genome where
    (==) x y = show x == show y

export
Eq Risk where
    (==) x y = show x == show y

export
Genotype Risk where
    risksForSnp rs snp = filter (\r => r.snp == snp) rs
    risksForGenome rs g = concat (map (\s => risksForSnp rs s) g.snps)