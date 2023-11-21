docker run -it --rm \
  --name dotnet \
  --volume $PWD:/project \
  --workdir /project \
  --entrypoint "/usr/bin/bash" \
  mcr.microsoft.com/dotnet/sdk:8.0
