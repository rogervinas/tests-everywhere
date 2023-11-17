docker run -it --rm \
  --name java \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  eclipse-temurin:21-jdk