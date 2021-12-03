# Ignore errors and silently continue.
# The errors just mean it didn't find one of the WMI pieces which is fine.
$ErrorActionPreference = 'SilentlyContinue'

# --- Finding the WmiObjects ---
$EventConsumerToCleanup = Get-WmiObject -Namespace root/subscription -Class CommandLineEventConsumer -Filter "Name = 'AuthQuery'"
$EventFilterToCleanup = Get-WmiObject -Namespace root/subscription -Class __EventFilter -Filter "Name = 'AuthQuery'"
$FilterToConsumerBindingToCleanup = Get-WmiObject -Namespace root/subscription -Query "REFERENCES OF {$($EventConsumerToCleanup.__RELPATH)} WHERE ResultClass = __FilterToConsumerBinding"

# --- Removing the WmiObjects ---
$FilterConsumerBindingToCleanup | Remove-WmiObject
$EventConsumerToCleanup | Remove-WmiObject
$EventFilterToCleanup | Remove-WmiObject

echo "All three specified WmiObjects removed!"
