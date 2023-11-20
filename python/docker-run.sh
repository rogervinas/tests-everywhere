docker run -it --rm \
  --name python \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  python:3.12.0
