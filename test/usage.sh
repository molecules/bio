#
# This script is used to generate Python tests.
#
# The output generated by each test can be seen at:
#
# https://github.com/ialbert/bio/tree/master/test/data
#

# Stop on errors.
set -uex

# Get data from NCBI
bio fetch NC_045512,MN996532 > genomes.gb

# Slice the genomes
bio fasta genomes.gb --end  100 > genomes.fa

# Slice the genomes
bio fasta genomes.gb --end  100  --alias alias.txt > genomes.alias.fa

# Generate features only.
bio fasta genomes.gb --end 10 --type CDS > cds.fa

# Translate the features.
bio fasta genomes.gb --type CDS --translate > translate.fa

# Extract the proteins.
bio fasta genomes.gb  --protein > protein.fa

# Stop codons
bio fasta -s -3 > stop.fa

# Default alignment.
bio align GATTACA GATCA > gattaca1.txt

# Default alignment.
bio align GATTACA GATCA --global > gattaca2.txt

# Default alignment.
bio align GATTACA GATCA --local > gattaca3.txt

# Select S proteins
bio fasta --gene S --protein  genomes.gb > s.fa

# Align proteins.
bio align s.fa > align-default.txt

# Alignment as a table.
bio align s.fa --table > align-table.txt

# Align as variants.
bio align s.fa --variant > align-variant.txt

# Convert genbank files to GFF
bio gff genomes.gb > genomes.gff

# Convert genbank files to GFF
bio gff genomes.gb --type CDS > CDS.gff

# Slice the GFF file.
bio gff -s 300 -e 10k > slice.gff

# Taxonomy listing.
bio taxon 117565 -d 5 > taxonomy.txt

# Taxonomy lineage.
bio taxon genomes.gb --lineage > lineage.txt

# Getting some metadata
bio meta 11138 -H > meta.txt
