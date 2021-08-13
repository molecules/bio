# bio: making bioinformatics fun again

`bio` - command-line utilities to make bioinformatics explorations more enjoyable.

## What does this software do?

If you've ever done bioinformatics, you know how even seemingly straightforward tasks require multiple steps, arcane incantations, and various other preparations that slow down progress. 

Even well-defined, supposedly simple tasks can take a seemingly inordinate number of complicated steps. The `bio` package is meant to solve that tedium. 

## Usage examples

    # Fetch genbank data
    bio fetch NC_045512,MN996532 > genomes.gb

    # Convert the first then bases of the genomes to FASTA.
    bio fasta genomes.gb --end 10

    # Align the coding sequences for the S protein
    bio fasta genomes.gb --gene S --protein | bio align | head

    # Print the GFF record that corresponds to the coding sequence for gene S
    bio gff genomes.gb --gene S 

    # Show the descendants of taxid 117565
    bio taxon 117565 | head

    # Show the lineage of a taxonomic rank.
    bio taxon 117565 --lineage | head

    # Get metadata on a viral sample
    bio meta 11138 -H | head

    # Define a sequence ontology terms
    bio define exon

    # Define a gene ontology terms
    bio define food vacuole

## Documentation

Detailed documentation is maintained at

* https://www.bioinfo.help/

## Quick install
    
`bio` works on Linux and Mac computers and on Windows when using the Linux Subsystem. 

    pip install bio --upgrade
            
See more details in the [documentation][docs].

## `bio` is stream oriented

`bio` supports stream oriented programming where the output of one task may be chained into the second. Take the example above
but now start with a file `acc.txt` that contains just the accession numbers:

    NC_045512
    MN996532

we can run `bio` to find the first three codons for each coding sequence for gene `S`:

     cat acc.txt | bio fetch | bio fasta --gene S --end 9

to print:

    >YP_009724390.1 CDS surface glycoprotein [1:9]
    ATGTTTGTT
    >QHR63300.2 CDS spike glycoprotein [1:9]
    ATGTTTGTT

## Who is `bio` designed for?

The software was written to teach bioinformatics and is the companion software to the [Biostar Handbook][handbook] textbook. The targeted audience comprises:

- Students learning about bioinformatics.
- Bioinformatics educators who need a platform to demonstrate bioinformatics concepts. 
- Scientists working with large numbers of similar genomes (bacterial/viral strains).
- Scientists who need to investigate and understand the precise details of a genomic region closely.

The ideas and motivations fueling `bio` have been developed while educating the many cohorts of students who used the handbook in the classroom. `bio` is an opinionated take on how bioinformatics, particularly data representation and access, should be simplified and streamlined.

[handbook]: https://www.biostarhandbook.com/
[docs]: https://www.bioinfo.help/

## Development

If you clone the repository, we recommend that you install it as a development package with:

    python setup.py develop
    
## Testing

Testing uses the `pytest` framework:

    pip install pytest

To run all tests, use:

    make test
    
Tests are automatically built from a shell script that mimics real-life usage scenarios.

* https://github.com/ialbert/bio/blob/master/test/usage.sh

## Generating documentation

To generate the docs, you will need the `bookdown` package:

    conda install r-bookdown r-servr
    
To run the docs in a browse:
    
    make 
    
then visit http://localhost:8000

