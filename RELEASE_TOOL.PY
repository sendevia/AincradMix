from os import getcwd, path, mkdir, system, chdir
from shutil import rmtree
from datetime import date


def init():
    global timestr, ver, sound, cdir, rdir
    message("AincradMix Release Tool", "", 0)
    timestr = date.today()
    cdir = getcwd()
    rdir = cdir + "\\release"
    if path.exists("core\\skin.ini"):
        if path.exists("tmp"):
            rmtree("tmp")
        else:
            message("无需删除临时文件", "Success", 1)
    else:
        message("{} 非正常目录".format(cdir), "Fail", 1)
        wait_input_to_do()
    if path.exists("release"):
        chdir(rdir)
    else:
        mkdir("release")
        chdir(rdir)
    message("发行目录 {} 正常".format(rdir), "Success", 1)
    ver_input = input("设置版本:\n")
    try:
        def dir():
            global ver, ver_today
            if ver_input == "":
                ver_today = timestr.strftime("%y%m%d")
                mkdir(rdir + "\\" + ver_today)
                message("已默认设置为当前日期: {}".format(ver_today), "Success", 1)
                ver = ver_today
            else:
                mkdir(rdir + "\\" + ver_input)
                ver = ver_input
        dir()
    except FileExistsError:
        message("已删除旧的文件", "Success", 1)
        if ver_input == "":
            rmtree(rdir + "\\" + ver_today)
        else:
            rmtree(rdir + "\\" + ver_input)
        dir()

    message("目前已有音效 style_lazer_old(0) , style_lazer(1)", "", 0)
    a = False
    while a != "0" or a != "1":
        a = input("输入预装的音效（数字）:\n")
        if a == "0":
            sound = "style_lazer_old"
            break
        elif a == "1":
            sound = "style_lazer"
            break
        else:
            message("不正确的输入", "Fail", 1)
    pt_list()
    wait_input_to_do()


def pt_list():
    global pt_name, pt_loop
    pt_name = ["core", "animation", "sound",
               "optimization", "addition", "source", "patch"]
    for pt_loop in range(len(pt_name)):
        prog(0)


def prog(target):
    message("开始打包", pt_name[pt_loop], 0)
    if target == 0:
        system("{0}\\tool\\7z.exe a -tzip -y {1}\\{3}\\AincradMix-{2}.zip {0}\\{2}\\*".format(
            cdir, rdir, pt_name[pt_loop], ver))
    message(pt_name[pt_loop], "打包完成", 1)


def message(title, info, style):
    if info == "":
        msg = " {0} ".format(title)
    elif info == "Fail":
        msg = " {0} ✗ ".format(title)
    elif info == "Success":
        msg = " {0} ✔ ".format(title)
    else:
        msg = " {0} {1} ".format(title, info)
    if style == 0:
        output = "/////" + msg + "\n"
    elif style == 1:
        output = "-----" + msg + "\n"
    print(output)


def wait_input_to_do():
    message("回车 退出 ---- O 打开文件夹打开文件夹 ---- R 重新开始", "Success", 1)
    e = input()
    if e == "":
        quit()
    elif e == "o" or e == "O":
        try:
            system("explorer {0}\\{1}".format(rdir, ver))
        except NameError:
            message("未能正确执行程序...", "Fail", 1)
            wait_input_to_do()
    elif e == "r" or e == "R":
        init()
    else:
        quit()


init()
