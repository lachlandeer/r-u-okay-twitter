# Main Workflow - r-u-okay-twitter
# Contributors: @lachlandeer

import glob, os

# --- Build Rules --- #

## full_search
rule full_search:
    output:
        "out/tweets.json"
    shell:
        "twarc search '#ruokay OR #ruok OR #RUOK OR ruokday OR ruok OR #theresmoretosay OR #RUOkay OR saneaustralia OR SuicidePrevAU OR beyondblue OR LifelineAust OR blackdoginst OR from:ruokday OR from:SaneAustralia' OR from:SuicidePrevAU OR from:beyondblue OR from:LifelineAust OR from:blackdoginst > {output}"

## test_search
rule test_search:
    output:
        "out/test_search.json"
    shell:
        "twarc search '#ruokay OR saneaustralia' > {output}"

## test_search_user
rule test_search_user:
    output:
        "out/test_search_user.json"
    shell:
        "twarc search 'from:ruokday' > {output}"

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