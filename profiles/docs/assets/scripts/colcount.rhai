let database = params[0];
let col_count = 0;

for table in database.tables.values() {
    col_count += table.columns.values().len();
}

col_count