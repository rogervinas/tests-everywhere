docker run -it --rm \
  --name swift \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  swift:5.9
