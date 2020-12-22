##################################################################################################
###
###�@�W�u���̍�i�Î~��E�ꊇ�_�E�����[�g�c�[��
###�@�_�E�����[�h���F�@https://www.ghibli.jp/works/
###
###                                     Copyright 2020, Retar.jp
###                                     https://www.retar.jp/
###�@
###�@                                   2020/12/22�@�쐬
###
##################################################################################################
#
#�W�u���̍�i���̔z��
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
###�摜�ԍ��̊J�n�E�I��
$pictnumstart = 1
$pictnumend = 50

###�ۑ�Dir
$savedir = "save"

###URL�g�� 
function URLRet($namestr) 
{
    # �J�����g�f�B���N�g���ɕۑ�Dir�𐶐�
    $cur_path = (Convert-Path .)
    $svpath = $cur_path + "\" + $savedir
    if (-not (Test-Path  $svpath))
    {  
        New-Item $svpath -ItemType Directory
    }

    #URL���ς�����璼���Ă����Ă�������
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
