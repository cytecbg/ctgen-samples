let table_data = params[0];

if type_of(table_data) != "map" || !table_data.contains("columns") {
    print(`Invalid table data provided: ${table_data}`);

    return "";
}

let result = false;

for column in table_data.columns.values() {
    if type_of(column.datatype) == "map" && column.datatype.contains("text") && column.datatype.text > 0 {
        result = true;
        break;
    }
}

return result;