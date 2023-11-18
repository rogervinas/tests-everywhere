docker run -it --rm \
  --name go \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  golang:1
