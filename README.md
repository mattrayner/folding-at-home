Docker container for running [Folding@Home](https://foldingathome.org/)

### Usage
```bash
docker build -t fold .

docker run --rm -p7396:7396 -d fold:latest --user=Anonymous --team=0  --gpu=false --smp=true --power=medium
```

The web console is available on port `7396`.

Forked from https://github.com/johnktims/folding-at-home and updated to current debian stable
with updated client download.
