@echo off
:: cmd 창을 윈도우 기본 한글(CP949) 상태로 고정합니다.
chcp 949 > nul

set "OUTPUT=initial_check_result.txt"
set "TEMP_FILE=temp_output.txt"

echo [!] 시스템 정보 수집을 시작합니다. 2분 정도 소요됩니다.

:: 1. 기존 파일이 있다면 삭제하여 초기화
if exist "%TEMP_FILE%" del "%TEMP_FILE%"
if exist "%OUTPUT%" del "%OUTPUT%"

:: 2. 윈도우 기본 인코딩(CP949) 상태로 임시 파일에 데이터 순차 수집
echo [===== 시스템 초기 분석 점검 결과 =====] >> "%TEMP_FILE%"
echo. >> "%TEMP_FILE%"

echo ========= 초기 분석 점검 날짜 및 시간 ========= >> "%TEMP_FILE%"
echo %date% %time% >> "%TEMP_FILE%"
echo. >> "%TEMP_FILE%"

echo ========= 시스템 기본 정보 (systeminfo) ========= >> "%TEMP_FILE%"
systeminfo >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= IP 정보 (ipconfig /all) ========= >> "%TEMP_FILE%"
ipconfig /all >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= 세션 정보 (net session) ========= >> "%TEMP_FILE%"
net session >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= 포트 정보 (netstat -na) ========= >> "%TEMP_FILE%"
netstat -na >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= 로그온 사용자 정보 (query user) ========= >> "%TEMP_FILE%"
query user >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= 프로세스 정보 (pslist -t) ========= >> "%TEMP_FILE%"
pslist -t -accepteula >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= DLL 정보 (listdlls) ========= >> "%TEMP_FILE%"
listdlls -accepteula >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= 핸들 정보 (handle) ========= >> "%TEMP_FILE%"
handle -accepteula >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= 공유 정보 (net share) ========= >> "%TEMP_FILE%"
net share >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= 사용자 정보 (net user) ========= >> "%TEMP_FILE%"
net user >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo ========= tasklist ========= >> "%TEMP_FILE%"
tasklist >> "%TEMP_FILE%" 2>&1
echo. >> "%TEMP_FILE%"

echo [!!] 초기 점검 정보 수집이 완료되었습니다. >> "%TEMP_FILE%"

:: 3. 수집이 끝난 임시 파일(CP949)을 PowerShell을 이용해 완벽한 UTF-8 최종 파일로 변환
powershell -Command "Get-Content -Path '%TEMP_FILE%' | Set-Content -Path '%OUTPUT%' -Encoding UTF8"

:: 4. 찌꺼기 임시 파일 삭제
del "%TEMP_FILE%"

echo [!!!] 수집 및 UTF-8 변환 완료! 결과 파일을 엽니다.
start "" "%OUTPUT%"