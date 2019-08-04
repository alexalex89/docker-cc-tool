# cc-tool

Dockerized cc-tool (provides support for Texas Instruments CC Debugger)

## Usage

`docker run -it --privileged -v "/absolute_path_to/file_to_be_flashed:/input" --rm cc-tool:latest`

`--privileged` is necessary to make the Debugger device available to the container

## TODO

* Fix bug "Flash image size exceeding flash physical size"
* Determine current cc-tool-version automatically
