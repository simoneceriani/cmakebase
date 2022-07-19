SET BASE_PATH=%~dp0
cd %BASE_PATH%

mkdir build-testUtils
cd build-testUtils
cmake ../testUtils

cd %BASE_PATH%
pause