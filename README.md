Windowsinfo.bat: 윈도우 시스템 초기 분석 스크립트
Windowsinfo.bat는 Windows 시스템의 초기 분석 및 정보 수집을 자동화하기 위한 배치 스크립트입니다. 실행 시 시스템의 주요 구성 정보, 네트워크 상태, 사용자 및 프로세스 목록을 수집하여 텍스트 파일로 저장합니다.

📋 주요 기능
이 스크립트는 다음 정보를 수집하여 initial_check_result.txt 파일에 저장합니다.


점검 날짜 및 시간 


시스템 기본 정보: systeminfo 


IP 정보: ipconfig /all 


세션 정보: net session 


포트 정보 (전체): netstat -na 


로그온 사용자 정보: query user 


로컬 서비스 정보: net start 


프로세스 트리 정보: pslist -t 


로드된 DLL 정보: listdlls 


핸들 정보: handle 


공유 정보: net share 


사용자 정보: net user 


도메인 그룹 정보: net group 


로컬 그룹 정보: net localgroup 


로컬 관리자 그룹 구성원: net localgroup administrators 


프로세스 목록: tasklist 

⚠️ 요구 사항
이 스크립트를 완전히 실행하려면 다음 요구 사항이 충족되어야 합니다.

관리자 권한: net session, net start 및 기타 시스템 레벨의 정보를 수집하기 위해 스크립트를 관리자 권한으로 실행해야 합니다.


Sysinternals Suite: 스크립트가 pslist , listdlls , handle  명령어를 사용합니다. 이 도구들은 Windows 기본 명령어가 아니므로, Microsoft의 Sysinternals Suite를 다운로드해야 합니다.



다운로드한 파일들의 압축을 푼 후, 해당 실행 파일들(pslist.exe, listdlls.exe, handle.exe 등)이 있는 경로를 시스템 PATH 환경 변수에 추가하거나,

Windowsinfo.bat 스크립트와 동일한 폴더에 복사해 두어야 합니다.


PowerShell: 스크립트 시작 부분에서 PowerShell을 사용하여 출력 파일의 인코딩(UTF-8 BOM)을 설정합니다. 최신 Windows 시스템에는 기본적으로 설치되어 있습니다.

🚀 사용 방법
위의 요구 사항 섹션을 참고하여 Sysinternals 도구를 준비합니다.

Windowsinfo.bat 파일을 마우스 오른쪽 버튼으로 클릭한 후 **"관리자 권한으로 실행"**을 선택합니다.

스크립트가 실행되며 콘솔 창에 진행 상황이 표시됩니다.

정보 수집이 완료되면 스크립트가 있던 폴더에 initial_check_result.txt 파일이 생성됩니다.


스크립트가 자동으로 notepad를 실행하여 결과 파일을 열어줍니다.

📄 출력(Output)

파일 이름: initial_check_result.txt 


인코딩: UTF-8 (BOM 포함) 

내용: 주요 기능 섹션에 나열된 모든 명령어의 실행 결과가 순서대로 기록됩니다.
