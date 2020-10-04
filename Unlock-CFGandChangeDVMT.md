**DELL Vostro 5370**解锁**CFG** & 修改DVMT（本仓库标题其他机型一样适用）

⚠️以下教程的cfg lock更改地址提取自DELL Vostro 5370，需要的自行提取bios并自行分析，核对转换地址。
如因以下教程修改导致的一切后果，本人不予承担责任，下载本repo中任何一个文件认为同意以上条款。

然后找偏移地址就不用做了，我已找好就告诉你吧，DELL Vostro 5370的偏移地址就是0x527

【⚠️千万不要用oc添加启动项efi/shell/bootx64.efi去引导 ！！]懂得人自然懂，收起那个想法，老老实实按我下面写的来
⚠️以下教程的cfg lock更改地址提取自DELL Vostro 5370，需要的自行提取bios并自行分析，核对转换地址。
如因以下教程修改导致的一切后果，本人不予承担责任，下载本repo中任何一个文件认为同意以上条款。

## U盘准备阶段：（大小无所谓）
1.先准备一个u盘，打开磁盘工具-选定你的U盘-抹掉，弹出抹掉界面，[格式]选(MS-DOS(FAT)，[方案]选(主引导记录)，最后点抹掉就可以了。
2.在U盘中建立如下结构的文件夹：EFI\BOOT\
3.在BOOT下放入用于修改BIOS的grub启动文件：[modGRUBShell.efi](https://github.com/datasone/grub-mod-setup_var/releases)
4.把modGRUBShell.efi更改文件名为bootx64.efi
这样一个可用于启动到修改BIOS环境的U盘就制作好了
重启开机按F12使用这个U盘去引导，然后进入修改BIOS的环境下了
![Screenshot](img/Fat.png)
## 以下为修改解锁CFG-bios实质阶段：

1：先输入setup_var 0x527 //查询CFG状态

2：如果看到offset 0x527 is 0x01 //0x01表示开启,0x00表示关闭

3：输入setup_var 0x527 0x00 //将0x527地址值改为0x00

4：即可解锁CFG 

5：最后再输入一遍setup_var 0x527 ，检查是否改成了0x00 


## 以下为修改解锁DVMT-bios实质阶段：

1：先输入setup_var 0x7E8 //查询DVMT状态

2：如果看到offset 0x7E8 is 0x01 //0x01表示32M,0x02表示64M

3：输入setup_var 0x7E8 0x02 //将0x5C3地址值改为0x02

4：即可修改DVMT 

5：最后再输入一遍setup_var 0x7E8 ，检查是否改成了0x02
此方法通过shell修改DVMT大小可有效解决因为dvmt不足而引起安装卡显卡的问题。

输入exit退出

