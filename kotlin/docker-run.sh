docker run -it --rm \
  --name kotlin \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  eclipse-temurin:21-jdk