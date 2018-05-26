## dotnet-sonar

This is a repo to hold a Dockerfile for image [https://hub.docker.com/r/andrecastrogarcia/dotnet-sonar/](https://hub.docker.com/r/andrecastrogarcia/dotnet-sonar/).

If you need to build an .Net project and desired to check quality through Sonar, try
this image and add the following steps to your build file:

**.Net Core Sample**
```
dotnet /sonar/SonarScanner.MSBuild.dll begin /k:"<project-key>" /d:sonar.organization="<sonar-org> /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="<login>" /d:sonar.cs.opencover.reportsPaths="<path_to_coverage_file>"
dotnet build
dotnet test your-test-project.csproj
dotnet /sonar/SonarScanner.MSBuild.dll end /d:sonar.login="<login>"
```

**Sample BitBucket Pipelines File**  
```yml
image: andrecastrogarcia/dotnet-sonar:latest

pipelines:
  branches:
    master:
      - step:
          caches:
            - dotnetcore
          script:
            - dotnet restore
            - dotnet sonar/SonarScanner.MSBuild.dll begin /k:"<project-key>" /d:sonar.organization="<sonar-org> /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="<login>" /d:sonar.cs.opencover.reportsPaths="<path_to_coverage_file>"
            - dotnet build
            - dotnet test your-test-project.csproj
            - dotnet sonar/SonarScanner.MSBuild.dll end /d:sonar.login="<login>"
```

Works with .Net Core and .Net Full Framework Solutions.

Tested with [Sonar Cloud](https://sonarcloud.io).

Badges for my test project:  
![Coverage](https://sonarcloud.io/api/project_badges/measure?project=ducktales&metric=coverage)
![DuplicateLines](https://sonarcloud.io/api/project_badges/measure?project=ducktales&metric=duplicated_lines_density)
![CodeSmells](https://sonarcloud.io/api/project_badges/measure?project=ducktales&metric=code_smells)