params.input = "$baseDir/assets/test_data.csv"

process tuplator {
    input:
    tuple val(id), val(first_name), val(last_name), val(email), val(gender), val(ip)

    script:
    "echo process job $id" 
}

workflow {
     Channel.fromPath(params.input) \
        | splitCsv(header:true) \
        | tuplator


}