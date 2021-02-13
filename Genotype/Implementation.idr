module Genotype.Implementation

import Genotype.Specification

import Data.List

public export
Show Nucleotype where
    show AA = "AA"
    show GG = "GG"
    show _ = "??" 

public export
Show Person where
    show p = p.firstName ++ " "
           ++ p.lastName

public export
Show Polymorphism where
    show p = p.rs

public export
Show SNP where
    show snp = show snp.polymorphism
             ++ show snp.nucleotype

public export
Show Risk where
    show r = show r.snp ++ " ("
           ++ r.description ++ ")"

public export
Show Genome where
    show g = show g.person ++ " "
           ++ show (map show g.snps)

public export
Eq Nucleotype where
    AA == AA = True
    GG == GG = True
    _ == _ = False

public export
Eq Person where
    (x == y) = show x == show y

public export
Eq Polymorphism where
    (x == y) = x.rs == y.rs

public export
Eq SNP where
    (x == y) = show x == show y

public export
Eq Genome where
    (x == y) = show x == show y

public export
Eq Risk where
    (x == y) = show x == show y

public export
Genotype Risk where
    risksForSnp rs snp = filter (\r => r.snp == snp) rs
    risksForGenome rs g = concat (map (\s => risksForSnp rs s) g.snps)