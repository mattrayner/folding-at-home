Docker container for running [Folding@Home](https://foldingathome.org/)

### Usage
```bash
docker run --rm -it -p7396:7396 johnktims/folding-at-home:latest \
    --user=Anonymous--team=0 --gpu=false --smp=true
```

The web console is available on port `7396`.

Forked from https://github.com/johnktims/folding-at-home and updated to current debian stable
with updated client download.
