BackupName=/system_backup.tar.gz # 备份文件路径

while getopts "brh" opt
do
    case $opt in
        b)
            tar -cvpz  \
            -f $BackupName / `# 压缩路径：根目录`\
            --exclude=/proc \
            --exclude=/lost+found \
            --exclude=$BackupName `# 排除本身压缩包的路径，避免出现一些奇怪的问题` \
            --exclude=/mnt \
            --exclude=/sys
            break
            ;;
        r)
            tar -xvpz -f $BackupName -C /

            # 创建排除的文件夹
            mkdir proc
            mkdir lost+found
            mkdir mut
            mkdir sys
            break
            ;;
        h)
            echo "bkr--BacKup and Recover"
            echo "Move this script to the root path"
            echo "-b Backup system"
            echo "-r Recover system"
            break
            ;;
    esac
done
