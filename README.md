# oracledb-issue

Minimum example to reproduce `SystemError` issue with oracledb v6.0.0

`createPool` function call fails with error `SystemError [ERR_SYSTEM_ERROR]: A system error occurred: uv_os_get_passwd returned ENOENT (no such file or directory)` when Node.js process is running with user that has no home directory.

Run command:

```
docker compose up --build
```

Result:

```
> docker compose up --build
[+] Building 0.4s (8/8) FINISHED
 => [oracledb internal] load build definition from Dockerfile
 => => transferring dockerfile: 110B
 => [oracledb internal] load .dockerignore
 => => transferring context: 2B
 => [oracledb internal] load metadata for docker.io/library/node:18.16.0-alpine3.16
 => [oracledb internal] load build context
 => => transferring context: 7.71kB
 => [oracledb 1/3] FROM docker.io/library/node:18.16.0-alpine3.16@sha256:1eabdb1aa3f6e68558c08501572731db560d10c2194a67d3417103b0a9868693
 => CACHED [oracledb 2/3] COPY . .
 => CACHED [oracledb 3/3] RUN npm i
 => [oracledb] exporting to image
 => => exporting layers
 => => writing image sha256:a763bdc07fd2ef456e74a39ee36c26c31efe48d68655788b25870f81644bef80
 => => naming to docker.io/library/oracledb-oracledb
[+] Running 0/0
[+] Running 2/1ledb_default  Creating
 ✔ Network oracledb_default       Created
 ✔ Container oracledb-oracledb-1  Created
Attaching to oracledb-oracledb-1
oracledb-oracledb-1  | node:internal/errors:490
oracledb-oracledb-1  |     ErrorCaptureStackTrace(err);
oracledb-oracledb-1  |     ^
oracledb-oracledb-1  |
oracledb-oracledb-1  | SystemError [ERR_SYSTEM_ERROR]: A system error occurred: uv_os_get_passwd returned ENOENT (no such file or directory)
oracledb-oracledb-1  |     at new SystemError (node:internal/errors:250:5)
oracledb-oracledb-1  |     at new NodeError (node:internal/errors:361:7)
oracledb-oracledb-1  |     at Object.userInfo (node:os:366:11)
oracledb-oracledb-1  |     at Object.<anonymous> (/node_modules/oracledb/lib/thin/sqlnet/navNodes.js:446:64)
oracledb-oracledb-1  |     at Module._compile (node:internal/modules/cjs/loader:1254:14)
oracledb-oracledb-1  |     at Module._extensions..js (node:internal/modules/cjs/loader:1308:10)
oracledb-oracledb-1  |     at Module.load (node:internal/modules/cjs/loader:1117:32)
oracledb-oracledb-1  |     at Module._load (node:internal/modules/cjs/loader:958:12)
oracledb-oracledb-1  |     at Module.require (node:internal/modules/cjs/loader:1141:19)
oracledb-oracledb-1  |     at require (node:internal/modules/cjs/helpers:110:18) {
oracledb-oracledb-1  |   code: 'ERR_SYSTEM_ERROR',
oracledb-oracledb-1  |   info: {
oracledb-oracledb-1  |     errno: -2,
oracledb-oracledb-1  |     code: 'ENOENT',
oracledb-oracledb-1  |     message: 'no such file or directory',
oracledb-oracledb-1  |     syscall: 'uv_os_get_passwd'
oracledb-oracledb-1  |   },
oracledb-oracledb-1  |   errno: [Getter/Setter],
oracledb-oracledb-1  |   syscall: [Getter/Setter]
oracledb-oracledb-1  | }
oracledb-oracledb-1  |
oracledb-oracledb-1  | Node.js v18.16.0
oracledb-oracledb-1 exited with code 1
```
