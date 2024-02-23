let table_data = params[0];
let add_unwrap = if params.len() > 1 { params[1] } else { false };

if type_of(table_data) != "map" || !table_data.contains("columns") {
    print(`Invalid table data provided: ${table_data}`);

    return "";
}

let selected_column = table_data.columns.values()[0];
let column_name = selected_column.name;

for column in table_data.columns.values() {
    if type_of(column.datatype) == "map" && column.datatype.contains("varchar") && column.datatype.varchar > 0 {
        selected_column = column;
        column_name = column.name;

        if column.datatype.varchar == 255 {
            break;
        }
    }
}

if add_unwrap && selected_column?.metadata?.nullable == "1" {
    return column_name + ".unwrap_or(String::new())";
}

return column_name;