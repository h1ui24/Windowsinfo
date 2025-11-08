@echo off
chcp 65001 > nul

set OUTPUT=initial_check_result.txt

:: UTF-8 BOM 출력 (EF BB BF)
> %OUTPUT% (
    cmd /c "echo(>> %OUTPUT%"
    powershell -Command "[System.IO.File]::WriteAllBytes('%OUTPUT%', (0xEF,0xBB,0xBF) + [System.Text.Encoding]::UTF8.GetBytes(''))"
)

echo [===== 시스템 초기 분석 점검 결과 =====] >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 초기 분석 점검 날짜 ========= >> %OUTPUT%
date /t >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 초기 분석 점검 시간 ========= >> %OUTPUT%
time /t >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 시스템 기본 정보 (systeminfo) ========= >> %OUTPUT%
systeminfo >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= IP 정보 (ipconfig /all) ========= >> %OUTPUT%
ipconfig /all >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 세션 정보 (net session) ========= >> %OUTPUT%
net session >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 포트 정보 (netstat -na) ========= >> %OUTPUT%
netstat -na >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 로그온 사용자 정보 (query user) ========= >> %OUTPUT%
query user >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 로컬 서비스 정보 (net start) ========= >> %OUTPUT%
net start >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 프로세스 정보 (pslist -t) ========= >> %OUTPUT%
pslist -t >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= DLL 정보 (listdlls) ========= >> %OUTPUT%
listdlls >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 핸들 정보 (handle) ========= >> %OUTPUT%
handle >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 공유 정보 (net share) ========= >> %OUTPUT%
net share >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 사용자 정보 (net user) ========= >> %OUTPUT%
net user >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 도메인 그룹 정보 (net group) ========= >> %OUTPUT%
net group >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 로컬 그룹 정보 (net localgroup) ========= >> %OUTPUT%
net localgroup >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= 관리자 그룹 정보 ========= >> %OUTPUT%
net localgroup administrators >> %OUTPUT%
echo. >> %OUTPUT%

echo ========= tasklist ========= >> %OUTPUT%
tasklist >> %OUTPUT%
echo. >> %OUTPUT%

echo [✓] 초기 점검 정보 수집이 완료되었습니다. >> %OUTPUT%
echo 결과 파일: %cd%\%OUTPUT%
start notepad %OUTPUT%
