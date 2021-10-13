for ($i = 0; $i -lt 1000; $i++) {
  New-LocalUser -Name "bob$i" -Password "Password1!" 
}
