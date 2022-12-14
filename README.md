## Raft 알고리즘 Go언어로 구현하기
Raft는 2014년에 나온 합의알고리즘으로 Paxos를 대체하기 위해 탄생했습니다. 
Raft의 등장 이전에는 분산 시스템의 거장 Lesile Lamport에 의해 만들어진 Paxos가 대세를 이루었는데 스탠포드 대학교의 학생들이 Paxos를 이해하는데
굉장히 많은 시간을 할애해야 했기 때문에 비교적 쉬운 Raft 알고리즘이 탄생했습니다.

```
요즘 나오는 분산 합의 시스템들은 Raft를 기본 알고리즘으로 채택하는 경향이 있습니다.
대표적인 오픈소스에는 쿠버네티스 컨트롤러에서 쓰이는 etcd가 있습니다.
```

아니, 그래서 쉬운 합의 알고리즘을 하나 만들었다는데, 사실 직접 만들어보지 않고서는 얼마나 쉬운지 모르는 것 아니겠습니까?
그래서 이 레포지토리에서는 이걸 Go언어로 직접 구현해보고자 합니다.

### 거인의 어깨 위에 서다
거인의 어깨 위에 올라탄 작은 난쟁이는 더 넓은 세상을 본다는 말이 있습니다. 

여기서도 저는 새로운 코드를 작성하는 것 보다는 [이 블로그](https://eli.thegreenplace.net/2020/implementing-raft-part-0-introduction/)에서 많은 내용을 참고해서 만들고자 합니다.

그럼 시작해볼까요?

## Raft 알고리즘
Raft 알고리즘에 대한 설명은 제 [블로그 글[1]](https://medium.com/curg/raft-consensus-%EC%9D%B4%ED%95%B4-%EA%B0%80%EB%8A%A5%ED%95%9C-%ED%95%A9%EC%9D%98-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%EC%9D%84-%EC%9C%84%ED%95%9C-%EC%97%AC%EC%A0%95-f7ecb9f450ab) 에서 나름 잘 설명하려고 노력했습니다.

이 레포에서는 Raft 알고리즘을 구현하는 과정에 대해 나는 어떻게 했는가를 설명하고자 합니다.

아래에 설명하는 각 목차는 제가 개발을 진행했던 흐름대로 작성했습니다. 

이 흐름을 그대로 따라오시면, 코드를 작성한 사람의 의도와 맥락을 더 잘 파악할 수 있을 거라고 기대합니다 😊

* [Part 1. Protobuf 정의하기](./docs/part1.md)