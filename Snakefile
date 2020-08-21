# Main Workflow - r-u-okay-twitter
# Contributors: @lachlandeer

import glob, os

# --- Build Rules --- #

## configure: sets up configuration for twarc
rule configure:
    shell:
        "twarc configure"

# --- SNAKEMAKE WORKFLOW GRAPHS --- #
## dag                : create the DAG as a pdf from the Snakefile
rule dag:
    input:
        "Snakefile"
    output:
        "dag.pdf"
    shell:
        "snakemake --dag --forceall | dot -Tpdf > {output}"

## filegraph          : create the file graph as pdf from the Snakefile 
##                     (i.e what files are used and produced per rule)
rule filegraph:
    input:
        "Snakefile"
    output:
        "filegraph.pdf"
    shell:
        "snakemake --filegraph --forceall | dot -Tpdf > {output}"

## rulegraph          : create the graph of how rules piece together 
rule rulegraph:
    input:
        "Snakefile"
    output:
        "rulegraph.pdf"
    shell:
        "snakemake --rulegraph --forceall | dot -Tpdf > {output}"