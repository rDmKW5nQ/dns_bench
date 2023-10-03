import socket
import time

# Define an array of DNS servers
dns_servers = ["8.8.8.8", "8.8.4.4", "208.67.222.222", "208.67.220.220"]

# Define the domain to resolve
domain = "www.microsoft.com"

# Loop through each DNS server in the array
for dns_server in dns_servers:
    # Set the resolver's nameservers to the current DNS server
    socket.getaddrinfo(dns_server, None)

    # Measure the time it takes to resolve the domain name
    start_time = time.time()
    socket.gethostbyname(domain)
    end_time = time.time()

    # Output the DNS server and the total milliseconds it took to resolve
    print(f"DNS Server: {dns_server}, Time: {(end_time - start_time) * 1000} ms")
