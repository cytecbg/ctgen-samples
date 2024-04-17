let version = params[0];

/// when were the extra rhai packages introduced in ctgen
let minimal_supported_version = "0.1.4";

fn version_to_int(v) {
    if (type_of(v) != "string") {
        throw "Invalid version string provided. Expected string."
    }

    let segments = v.split(".", 3);

    if (segments.len() != 3) {
        throw "Invalid version string provided. Expected 3 segments."
    }

    parse_int(segments[0])*100 + parse_int(segments[1])*10 + parse_int(segments[2])
}

if (version_to_int(version) >= version_to_int(minimal_supported_version)) {
    true
} else {
    false
}