##################################################################################################
###
###　ジブリの作品静止画・一括ダウンロートツール
###　ダウンロード元：　https://www.ghibli.jp/works/
###
###                                     Copyright 2020, Retar.jp
###                                     https://www.retar.jp/
###　
###　                                   2020/12/22　作成
###
##################################################################################################
#
#ジブリの作品名の配列
$names=@(
"nausicaa"
,"laputa"
,"totoro"
,"majo"
,"omoide"
,"porco"
,"umi"
,"tanuki"
,"onyourmark"
,"mimi"
,"mononoke"
,"yamada"
,"chihiro"
,"ghiblies"
,"baron"
,"howl"
,"ged"
,"ponyo"
,"karigurashi"
,"kokurikozaka"
,"kazetachinu"
,"kaguyahime"
,"marnie"
,"redturtle"
)
###画像番号の開始・終了
$pictnumstart = 1
$pictnumend = 50

###保存Dir
$savedir = "save"

###URL組立 
function URLRet($namestr) 
{
    # カレントディレクトリに保存Dirを生成
    $cur_path = (Convert-Path .)
    $svpath = $cur_path + "\" + $savedir
    if (-not (Test-Path  $svpath))
    {  
        New-Item $svpath -ItemType Directory
    }

    #URLが変わったら直してあげてください
    $ret = "https://www.ghibli.jp/gallery/"
    $ret += $namestr
    $ret += ".jpg "
    $ret += $svpath
    $ret += "\"
    $ret += $namestr
    $ret += ".jpg"
    #Write-Host $ret
    
    #return
    return $ret
}

###Main
foreach ($name in $names) {
    Write-Output ("DownLoad: *** "+ $name +" ***")
    for ($i=$pictnumstart; $i -le $pictnumend; $i++)
    {
        $str1 = $name 
        $str1 += "{0:D3}" -f $i 
        $url = URLRet($str1)

        Write-Output ("*** Get From: bitsadmin /TRANSFER FILEGET "+ $url +" ***")
        Start-Process -FilePath bitsadmin.exe -ArgumentList "/TRANSFER FILEGET $url" -Wait
    }
}
