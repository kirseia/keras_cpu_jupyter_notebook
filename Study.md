### Docker 란 무엇인가
- 컨테이너 기반의 오픈소스 가상화 플랫폼 
- VM 환경 같은데 VM 같지 않은 것. 격리된 환경을 만들어주는 도구.
- 미리 만들어놓은 세트를 어떤 환경에도 배포 가능함. (꼭 그렇지는 않음, 하드웨어 dependency 있는 것들은 안됨)
- LXC (리눅스 컨테이너) 이용한 기술

- 도커 이미지를 컨테이너로 실행한다. 

- dockerhub 에 사람들이 미리 만들어놓은 이미지들이 존재함.

### 설치하기
- mac 은 brew 로 설치 가능
- 또는 https://www.docker.com/products/docker-desktop 설치 (추천)

### 사용하기
- Dockerfile 에서 기존 이미지 또는 새로 이미지를 생성할 수 있음
- 미리 만들어진 수많은 이미지를 바로 실행 가능 (어떤 환경에서도 실행 가능)
    - centos, ubuntu, mariadb, mysql, node, tensorflow, keras ...
- 컨테이너를 변경해도 이미지에는 영향 없음
- 컨테이너 변경 후 commit 작업해서 새로운 이미지를 만들어낼 수도 있음.

- **python 같은 경우는 환경 격리를 위해 docker 사용하는게 유용함**

- 컨테이너 끼리 서로 연결 가능
- 다른 물리적 서버에 있는 컨테이너와도 연결 가능
- 디스크 볼륨 같은걸 공유할 수도 있음

### 도커 명령어들
```
Usage:	docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/Users/naver/.docker")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/Users/naver/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/Users/naver/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/Users/naver/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes
```

- https://gist.github.com/junho85/ba9302eaee5a76b91aa3910cd73a8078
- http://leechwin.tistory.com/entry/Docker-%EA%B8%B0%EB%B3%B8-%EB%AA%85%EB%A0%B9%EC%96%B4

### Dockerfile
- 기존 이미지를 살짝 수정해서 사용하고 싶거나, 각종 명령어들을 추가하고 싶을 때.
- 새로운 이미지를 만드는 일련의 명령어를 저장한 파일

### Docker-compose
- 도커 이미지 여러개 또는 dockerfile 들의 연관 관계를 묶어서 한번에 실행 / 중단 할 수 있게 해주는 것
- nginx - node (tomcat) - mariadb - redis 동시에 실행, 연결 가능

- 참고 : http://miiingo.tistory.com/92



### Cloud Service 사용
- AWS ECS / Google AppEngine / Azure Docker 등 사용가능
- 배포 / 이미지 관리 / 모니터링 등 제공




### 참고 자료
1. https://blog.nacyot.com/articles/2014-01-27-easy-deploy-with-docker/  간단하게 살펴보기 좋음 
2. https://subicura.com/2017/01/19/docker-guide-for-beginners-1.html   상세함. 약간의 유머. 
3. https://www.slideshare.net/pyrasis/docker-fordummies-44424016 도커 책 쓰신 분 슬라이드 
4. https://medium.com/@umanking/docker-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD-%EB%A7%8C%EB%93%A4%EA%B8%B0-d2b2ff075fd6 추천
5. https://medium.com/@kam6512/%EB%AC%B4%EC%9E%91%EC%A0%95-%ED%95%B4%EB%B3%B4%EB%8A%94-docker-29fa19d8acbc 추천 
6. https://gist.github.com/nacyot/8366310 
