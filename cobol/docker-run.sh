IMAGE=tests-everywhere-cobol
docker build -t $IMAGE . && docker run -it --rm \
  --name cobol \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  $IMAGE
