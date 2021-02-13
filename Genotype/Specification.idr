module Genotype.Specification

import Data.List

public export
data Nucleotype = AA | AG | GG
                | CC | CT | TT

public export
record Person where
    constructor MkPerson
    firstName, lastName : String

public export
record Polymorphism where
    constructor MkPolymorphism
    rs : String

public export
record SNP where
    constructor MkSNP
    polymorphism : Polymorphism
    nucleotype : Nucleotype

public export
record Genome where
    constructor MkGenome
    person : Person
    snps : List SNP

public export
record Risk where
    constructor MkRisk
    snp : SNP
    description : String
    severity : Int

public export
interface Genotype Risk where
    risksForSnp : List Risk -> SNP -> List Risk
    risksForGenome : List Risk -> Genome -> List Risk