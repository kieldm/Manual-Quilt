# quilt1

`quilt1` is a generative type program built with the processing engine.

## Installation

`quilt1` may be built with the Processing IDE, or via the command line
with `processing-java`. 

Install Processing with:

```bash
brew install processing
```

Or download the installer at [Processing Download](https://processing.org/download).

`quilt1` requires `ffmpeg` and will look for it in the path `/opt/homebrew/bin/ffmpeg`.

```bash
brew install ffmpeg
```

If `ffmpeg` is installed in a different path, `quilt` will prompt for the path the first
time an mp4 is rendered. Check to see where `ffmpeg` is installed by running:

```bash
brew --prefix ffmpeg
```

Update `ffmpeg_path` in `quilt1/settings.json` if it is different than the default or use
the prompt that appears when an mp4 is rendered.

Optional: To build `quilt1` via the cli, you must first install `processing-java` by opening a 
sketch (any sketch or example will work) and clicking the following menu option:

![install processing-java](./assets/processing-java.png)

## Build

`quilt1` can be run and built via the Processing IDE. Alternatively, a Makefile has been included for convenience. 

To run `quilt1` via the CLI:
```bash
$ make run
```

To build `quilt1` as an executable:
```bash
$ make
rm -rf /Users/alanm/github/Manual-Quilt/quilt1/build
processing-java --sketch=/Users/alanm/github/Manual-Quilt/quilt1 --output=/Users/alanm/github/Manual-Quilt/quilt1/build --force --export
Finished.
```

## License

tbd
