Write-Host "--- EventFilter ---"
Get-WMIObject -Namespace root\Subscription -Class __EventFilter
Write-Host "--- FilterToConsumerBinding ---"
Get-WMIObject -Namespace root\Subscription -Class __FilterToConsumerBinding
Write-Host "--- EventConsumer ---"
Get-WMIObject -Namespace root\Subscription -Class __EventConsumer
