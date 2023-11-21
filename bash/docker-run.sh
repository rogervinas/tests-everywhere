docker run -it --rm \
  --name bash \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/local/bin/bash" \
  bash:5.2
