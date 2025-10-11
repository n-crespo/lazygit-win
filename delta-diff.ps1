#!/usr/bin/env pwsh

$width = $env:LAZYGIT_COLUMNS

if ([string]::IsNullOrWhiteSpace($width))
{
  $width = (Get-Host).UI.RawUI.WindowSize.Width - 70
}

$old = $args[1].Replace('\', '/')
$new = $args[4].Replace('\', '/')
$path = $args[0]

git diff --no-index --no-ext-diff $old $new | ForEach-Object {
  $_.Replace($old, $path).Replace($new, $path)
} | delta --width=$width
