


https://dotnet.microsoft.com/download

https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new

dotnet new sln --name Hello
dotnet new console --language "C#" --framework net8.0 --name Hello.Main
dotnet new nunit --language "C#" --framework net8.0 --name Hello.Test
dotnet add ./Hello.Test reference ./Hello.Main
dotnet sln Hello.sln add ./Hello.Main ./Hello.Test 

dotnet add ./Hello.Test package Moq --version 4.20.69

dotnet run --project Hello.Main

dotnet test -v quiet -l:"console;verbosity=normal"