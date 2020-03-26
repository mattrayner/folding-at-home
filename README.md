Docker container for running [Folding@Home](https://foldingathome.org/)

### Usage
```bash
docker build -t fold .

docker run --rm -p7396:7396 -p 36330:36330 -d fold:latest --command-allow-no-pass=0/0
```

The web console is available on port `7396` and remote control is available `36330`.

Forked from https://github.com/johnktims/folding-at-home and updated to current debian stable
with updated client download.
