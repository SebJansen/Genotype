module Main

import Genotype.Specification
import Genotype.Implementation

import Data.List

seb : Person
seb = MkPerson "Seb" "Jansen"

p1 : Polymorphism
p2 : Polymorphism

p1 = MkPolymorphism "rs4680"
p2 = MkPolymorphism "rs4880"

snp1 : SNP
snp2 : SNP

snp1 = MkSNP p1 AA
snp2 = MkSNP p2 GG

genome : Genome
genome = MkGenome seb [snp1, snp2]

risk1 : Risk
risk2 : Risk

risk1 = MkRisk snp1 "Increased susceptibility to OCD, panic disorder, phobic anxiety" 35
risk2 = MkRisk snp2 "Increased susceptibility to Parkinson's, Alzheimer's, Hypertension" 50

rs : List Risk
rs = [risk1, risk2]

main : IO ()
main = do
  printLn $ risksForGenome rs genome
