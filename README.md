# keras_cpu_jupyter_notebook

## 준비물
- docker 설치 
    - Ref: https://subicura.com/2017/01/19/docker-guide-for-beginners-2.html

## 빌드
- docker build -t ${docker image name} .

## 도커 실행하기
- docker run -it --rm=true -p 8888:8888 -v $PWD/notebooks:/notebooks ${docker image name}

```
[I 08:58:49.223 NotebookApp] http://(7874f843cb63 or 127.0.0.1):8888/?token=${token}
```

## 주피터 노트북 실행하기
- 브라우저 열고,
- localhost:8888/?token=${token} 을 입력한다.
