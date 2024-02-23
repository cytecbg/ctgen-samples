let constraints = params[0];
let column_name = params[1];

for constraint in constraints {
    if constraint.key_pairs[0].local.name == column_name {
        return constraint.key_pairs[0].foreign.table;
    }
}

return "";