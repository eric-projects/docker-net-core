# docker-net-core
一般制作docker镜像，都是基于网络同道精心打造的镜像。如果想自己构建一个基础的镜像可以通过此次示例来学习。

如果需要查看基于window容器 运行netcore webapi,可以查看[这里](https://www.cnblogs.com/ctfyfd/p/11654102.html)

# 学习之路

* [alpine-minirootfs-3.10.2-x86_64.tar.gz](https://alpinelinux.org/downloads/) alpine(linux环境)
* [aspnetcore-runtime-3.0.0-linux-musl-x64.tar.gz](https://dotnet.microsoft.com/download/dotnet-core) linux环境下的netcore runtime
* dockerfile [构建镜像的命令集](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

## 下载源码并构建docker镜像

![build.png](https://github.com/eric-projects/repositories-resource/blob/master/docker-net-core/build.png)

说明：
  * 需要切换到项目目录下执行构建命令 docker build -t webapi .  `不要忘记命令后的 . `
  * 构建命令中的 -t webapi 是给构建镜像起别名
  
## 查看制作镜像信息

``` powershell
PS C:\WINDOWS\system32> docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
webapi              latest              5462b957a3e2        About an hour ago   161MB
```

## 运行镜像

```
PS E:\My\docker> docker run -i -t --name webapi -p 6002:6001  webapi /bin/sh
/ #
```
说明：

   *  -it 开启容器shell终端
   *  --name 给容器起别名
   *  -p 主机与容器之间的端口映射
   *  /bin/sh 运行容器后进入的工作目录
    
## 运行netcore webapi

```
/ # ls  #查看容器目录
bin      etc      lib      mnt      opt      publish  run      srv      tmp      var
dev      home     media    netcore  proc     root     sbin     sys      usr
/ # cd publish   #webapi publish 目录
/publish # ls
Google.Protobuf.dll                             System.Data.SqlClient.dll
Microsoft.Data.Sqlite.dll                       System.Security.Cryptography.ProtectedData.dll
MySql.Data.dll                                  appsettings.Development.json
Newtonsoft.Json.dll                             appsettings.json
Npgsql.dll                                      runtimes
Oracle.ManagedDataAccess.dll                    web.config
SQLitePCLRaw.batteries_green.dll                webapi.deps.json
SQLitePCLRaw.batteries_v2.dll                   webapi.dll
SQLitePCLRaw.core.dll                           webapi.exe
SQLitePCLRaw.provider.e_sqlite3.dll             webapi.pdb
SqlSugar.dll                                    webapi.runtimeconfig.json
System.Configuration.ConfigurationManager.dll
```

![run.png](https://github.com/eric-projects/repositories-resource/blob/master/docker-net-core/run.png)

说明：

   *  端口映射后就可以通过主机 localhost:6001 服务webapi站点了
   *  此次webapi示例使用 默认的netcore webapi项目，只是修改了运行示例的接口路径为 api
