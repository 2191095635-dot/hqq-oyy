# 高德地图 API Key 配置脚本
# 使用方式: 在 PowerShell 中运行此脚本

$htmlPath = "C:\Users\CNBJLAP\besties-site\index.html"

Write-Host "`n======================================`n  闺蜜网站 - 高德地图 API Key 配置`n======================================`n" -ForegroundColor Cyan

Write-Host "获取 API Key 步骤:`n" -ForegroundColor Yellow
Write-Host "1. 打开浏览器访问: https://lbs.amap.com/"
Write-Host "2. 登录/注册账号 (支持支付宝、钉钉、邮箱)"
Write-Host "3. 进入 '控制台' - '应用管理' - '我的应用'"
Write-Host "4. 点击 '创建新应用' (填写应用名称，如'闺蜜网站')"
Write-Host "5. 创建后点击 '添加 Key'"
Write-Host "6. 服务平台选择 'Web 端(JS API)'"
Write-Host "7. 复制获得的 Web API Key`n"

$apikey = Read-Host "请输入你的高德地图 Web API Key"

if ($apikey -eq "") {
    Write-Host "`n❌ API Key 不能为空！`n" -ForegroundColor Red
    exit
}

Write-Host "`n⏳ 正在配置...`n"

try {
    # 读取文件
    $content = Get-Content $htmlPath -Raw -Encoding UTF8

    # 替换 API Key
    $newContent = $content -replace "key=YOUR_AMAP_KEY", "key=$apikey"

    # 写回文件
    Set-Content $htmlPath -Value $newContent -Encoding UTF8 -Force

    Write-Host "✅ 配置完成！`n" -ForegroundColor Green
    Write-Host "API Key 已成功保存到 index.html`n"
    Write-Host "现在可以打开浏览器访问你的网站了！`n" -ForegroundColor Green
}
catch {
    Write-Host "`n❌ 配置失败: $_`n" -ForegroundColor Red
    exit
}
