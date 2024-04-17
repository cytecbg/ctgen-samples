let filename = params[0];

let file = open_file(filename);

let profile = file.read_string();

profile