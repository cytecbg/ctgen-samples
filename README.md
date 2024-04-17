# ctgen-samples

## About

A collection of sample configuration profiles aiming to demonstrate different aspects of the usage of `ctgen`.

More information about `ctgen` can be found [here](https://github.com/cytecbg/ctgen)

## Profiles

Currently available samples and their purpose:

- `docs`: Creates a Markdown document describing the database structure.
- `dump`: Creates a dump of the `ctgen` task context. Useful for debugging and exploration.
- `prompts`: Demonstrates commonly used prompts and their properties and effects.
- `rhai`: Demonstrates newly added rhai packages, like `chrono`, `fs`, `url` and `sci`.
- More to come...

## Usage

Assuming you already have `ctgen` installed<sup>[*0](#notes)</sup> (and the rest<sup>[*1](#notes)</sup>) and configured in your `$PATH`.

0. Go to the directory containing this **README**. 
```shell
cd ~/path/to/ctgen-samples
```

1. Use the following bash snippet to load all sample profiles into the `ctgen` profile registry:
```shell
for d in profiles/* ; do ctgen config add "$d"; done
```
or by manually adding the ones you're interested in using `ctgen config add [path-to-profile]`.

2. Verify that the profiles are properly registered by running `ctgen config ls`

3. Start an example MariaDB database server using docker by running:
```shell 
docker-compose up -d
```
The example docker setup launches a MariaDB<sup>[*2](#notes)</sup> instance running on port `3306` (might conflict with locally running instances) and phpMyAdmin on port `8888` for convenience<sup>[*3](#notes)</sup>.

4. Since the `.env` file for the sample profiles is in the same directory, you can run each profile you want to test from here.
- Run the `dump` example:
```shell
ctgen run --profile dump
```
After answering all prompts you should get a file `output/dump/dump.json`

- Run the `docs` example:
```shell
ctgen run --profile docs
```
After answering all prompts you should get a file `output/docs/db_example.md` and another one depending on the table you selected as a target table.

- Run the `prompts` example:
```shell
ctgen run --profile prompts
```
After answering all prompts you should get a file `output/prompts/prompts_<table name>.md` depending on the table you selected as a target table.

- Run the `rhai` example:
```shell
ctgen run --profile rhai books
```
No prompts are defined for this template. You should get a file `output/rhai/rhai.md`. The table you select does not matter.

- etc.

5. Remove the example profiles from the registry:
```shell
for d in profiles/* ; do ctgen config rm "$d"; done
```

6. Shutdown docker<sup>[*2](#notes)</sup>:
```shell
docker-compose down
```

7. Go and create your first `ctgen` profile:
```shell
cd ~/path/to/where/youd/keep/this/shhh
ctgen init [profile name to create]
```

## Notes
0. See how to install `ctgen` [here](https://github.com/cytecbg/ctgen#install)

1. To take full advantage of the provided samples you need `docker`, `docker-compose` and `jq` installed. If you don't use `docker` you can use the provided `.docker/init.sql` to import in your own MariaDB instance and reconfigure the provided `.env` file.

2. After shutting down the example docker containers you might want to clean up the leftover data volume by running:
```bash
docker volume rm ctgen-samples_database-data
```

3. To explore the database open [localhost:8888](http://localhost:8888)