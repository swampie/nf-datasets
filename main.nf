params.input = "$baseDir/assets/test_data.csv"
workflow {
     Channel.fromPath(params.input) \
        | splitCsv(header:true) \
        | map { row-> tuple(row.id, row.first_name, row.last_name, row.gender) } \
        | view

}