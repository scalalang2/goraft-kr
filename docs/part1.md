## Protobuf 정의하기
이 구현체에서는 서버간 통신에 gRPC를 이용합니다. 그래서 우리는 먼저, 서버가 어떤 메시지를 서로 교환해야 하는지를 정의하고 시작합니다.

gRPC는 Protocol Buffer라는 메시지 직렬화 프레임워크를 기반으로 동작하는 `리모트 함수 호출(Remote Procedure Call)` 도구입니다.
Protocol Buffer를 작성하기 위해서는 `*.proto` 확장자를 가진 메시지를 정의해야 하는데요. 
이 메시지는 [./proto](../proto) 디렉토리에 정의되어 있습니다.

### 리더 선출을 위한 메시지 정의
Raft 에서 모든 서버는 투표를 요청하는 `RequestVote`와 복제된 로그를 저장하는 `AppendLogEntries`라는 두 RPC를 구현해야 합니다.