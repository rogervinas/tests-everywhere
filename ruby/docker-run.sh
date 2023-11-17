docker run -it --rm \
  --name ruby \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  ruby:3
