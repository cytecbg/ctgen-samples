let timestamp = params[0];

let datetime;

if (type_of(timestamp) == "string") {
    datetime = datetime_rfc3339(timestamp);
} else {
    datetime = datetime_now();
}


datetime.format("%Y-%m-%d %H:%M:%S")