const allowed_types = ["map", "array", "string"];

let container = params[0];
let elem = params[1];

let input_type = type_of(container);

if (!allowed_types.contains(input_type)) {
    return false;
}

return container.contains(elem);