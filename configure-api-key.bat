@echo off
setlocal enabledelayedexpansion

echo.
echo ======================================
echo   闺蜜网站 - 高德地图 API Key 配置
echo ======================================
echo.
echo 1. 打开浏览器访问: https://lbs.amap.com/
echo 2. 登录/注册账号
echo 3. 进入"控制台" - "应用管理" - "我的应用"
echo 4. 点击"创建新应用"
echo 5. 创建后点击"添加 Key"，选择 "Web 端(JS API)"
echo 6. 复制获得的 Key
echo.
set /p apikey="请输入你的高德地图 Web API Key: "

echo.
echo 正在配置...
echo.

REM 读取原文件
for /f "tokens=*" %%i in ('type C:\Users\CNBJLAP\besties-site\index.html') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    if "!line:YOUR_AMAP_KEY=!" neq "!line!" (
        set "line=!line:YOUR_AMAP_KEY=%apikey%!"
    )
    echo !line! >> temp.html
    endlocal
)

REM 备份原文件并替换
move /y C:\Users\CNBJLAP\besties-site\index.html C:\Users\CNBJLAP\besties-site\index.html.bak > nul
move /y temp.html C:\Users\CNBJLAP\besties-site\index.html > nul

echo 配置完成！
echo API Key 已保存到 index.html
echo.
echo 现在可以打开浏览器访问你的网站了！
pause
