# Define an array of DNS servers
$dnsServers = @("8.8.8.8", "8.8.4.4", "208.67.222.222", "208.67.220.220")

# Define the domain to resolve
$domain = "www.microsoft.com"

# Loop through each DNS server in the array
foreach ($dnsServer in $dnsServers) {
    # Measure the time it takes to resolve the domain name
    $result = Measure-Command { Resolve-DnsName -Name $domain -Server $dnsServer }

    # Output the DNS server and the total milliseconds it took to resolve
    Write-Output "DNS Server: $dnsServer, Time: $($result.TotalMilliseconds) ms"
}
