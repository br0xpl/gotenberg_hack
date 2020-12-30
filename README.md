

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

