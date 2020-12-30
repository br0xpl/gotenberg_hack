
# PoC code for exploiting Gotenberg 2020 vulnerabilities

Refer to CVE-2020-13449, CVE-2020-13450, CVE-2020-13451, CVE-2020-13452:
https://sploit.tech/2020/12/29/Gotenberg.html

Write-up:
<medium link soon>

# Instructions

1. Run gotenberg version 6.2.0 or earlier:
```bash
$ docker run --rm -p 3000:3000 --name gotenberg thecodingmachine/gotenberg:6.2.0
```
2. Execute the exploit with proper url:
```bash
$ ./go.sh http://localhsot:3000
```

3. Grab a coffee and wait.

4. When script prints "Executed!" message you can check the /tmp/hacked file, check if it's there:
```bash
$ docker exec gotenberg bash -c "cat /tmp/hacked"
```

