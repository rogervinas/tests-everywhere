


https://dotnet.microsoft.com/download

https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-new

dotnet new sln --name HelloApp
dotnet new console --language "C#" --framework net8.0 --name HelloApp.Main
dotnet new nunit --language "C#" --framework net8.0 --name HelloApp.Test
dotnet add ./HelloApp.Test reference ./HelloApp.Main
dotnet sln HelloApp.sln add ./HelloApp.Main ./HelloApp.Test 

dotnet run --project HelloApp.Main

dotnet test -v quiet -l:"console;verbosity=normal"