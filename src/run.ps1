#!/bin/bash

echo "Memulai kompilasi..."
javac -d ../bin *.java
echo "Kompilasi selesai."

Clear-Host

function Show-Spinner {
    $spins = "-\|/"
    $i = 0
    $startTime = Get-Date
    $loading = $true
    while ($loading) {
        $char = $spins[$i++ % $spins.Length]
        Write-Host -NoNewline "`r[char] Loading $char"
        Start-Sleep -Milliseconds 100
        $elapsedTime = (Get-Date) - $startTime
        if ($elapsedTime.TotalSeconds -ge 1) {
            $loading = $false
        }
    }
    Write-Host -NoNewline "`r" # Membersihkan baris terakhir
}

echo "Menjalankan program..."
Show-Spinner

java -classpath ../bin Main
echo "Program selesai dijalankan."