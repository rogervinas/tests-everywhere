docker run -it --rm \
  --name rust \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  rust:1.74.0
