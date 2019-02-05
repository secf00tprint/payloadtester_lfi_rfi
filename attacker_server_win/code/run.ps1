# add netcat to path
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\code\netcat\", [EnvironmentVariableTarget]::Machine)

# go to endless loop for container
while ($true)
{
    $i++
}
