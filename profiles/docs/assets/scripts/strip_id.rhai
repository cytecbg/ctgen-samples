let field = params[0];

if type_of(field) != "string" {
    return "";
}

if !field.ends_with("_id") {
    return field;
}

return field.sub_string(0, (field.len()-3));