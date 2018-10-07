# Initialize android environment

if ((-not $env:JAVA_HOME) -or (-not (Test-Path $env:JAVA_HOME))) {
    $androidStudioJrePathGuess = 'C:\Program Files\Android\Android Studio\jre'
    if (Test-Path $androidStudioJrePathGuess) {
        $env:JAVA_HOME = $androidStudioJrePathGuess
    }
    else {
        Write-Error 'Cannot find JRE path, please set it in environment variable JAVA_HOME'
        exit -1
    }
}

if (-not (Test-Path '.\local.properties')) {
    Write-Error 'Please create a local.properties file which sets sdk path like "sdk.dir=C\:\\Users\\marki\\AppData\\Local\\Android\\Sdk"'
    exit -1
}

Start-Process -FilePath 'cmd.exe' -ArgumentList @('/c gradlew.bat') -PassThru -NoNewWindow -Wait | Out-Null
