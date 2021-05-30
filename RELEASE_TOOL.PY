from os import getcwd, path, mkdir, system, _exit, chdir
from shutil import rmtree
from datetime import date


def init():
    global timestr, ver, sfx, cdir, rdir
    print("AincradMix Release Tool\n")
    timestr = date.today()
    cdir = getcwd()
    rdir = cdir + "\\release"
    if path.exists("core\\skin.ini"):
        if path.exists("tmp"):
            rmtree("tmp")
        else:
            print("- 无需删除临时文件\n")
    else:
        print("- {} 非正常目录\n".format(cdir))
        wait_input_to_do()
    if path.exists("release"):
        chdir(rdir)
    else:
        mkdir("release")
        chdir(rdir)
    print("- 发行目录 {} 正常\n".format(rdir))
    ver_input = input("- 设置版本:\n")
    try:
        def dir():
            global ver, ver_today
            if ver_input == "":
                ver_today = timestr.strftime("%y%m%d")
                mkdir(rdir + "\\" + ver_today)
                print("- 已默认设置为当前日期: {}\n".format(ver_today))
                ver = ver_today
            else:
                mkdir(rdir + "\\" + ver_input)
                ver = ver_input
        dir()
    except FileExistsError:
        print("- 删除旧的文件\n")
        if ver_input == "":
            rmtree(rdir + "\\" + ver_today)
        else:
            rmtree(rdir + "\\" + ver_input)
        dir()

    print("- 目前已有音效 style_lazer_old(1) , style_lazer(2)\n")
    a = False
    while a != "1" or a != "2":
        a = input("- 输入预装的音效（数字）:\n")
        if a == "1":
            sfx = "style_lazer_old"
            break
        elif a == "2":
            sfx = "style_lazer"
            break
        else:
            print("- 不正确的输入\n")
    pt_list()
    wait_input_to_do()


def pt_list():
    global pt_name, pt_loop, sp_name, sp_loop
    pt_name = ["core", "animation", "sound",
               "optimization", "addition", "source"]
    sp_name = ["patch"]
    for pt_loop in range(len(pt_name)):
        prog(0)
    for sp_loop in range(len(sp_name)):
        prog(1)


def prog(target):
    message("开始打包", pt_name[pt_loop], 1)
    if target == 0:
        system("{0}\\tool\\7z.exe a -tzip -y {1}\\{3}\\AincradMix-{2}.zip {0}\\{2}\\*".format(
            cdir, rdir, pt_name[pt_loop], ver))
    if target == 1:
        system("{0}\\tool\\7z.exe a -tzip -y {1}\\{3}\\AincradMix-{2}.zip {0}\\{2}\\*.dll".format(
            cdir, rdir, sp_name[sp_loop], ver))
    message(pt_name[pt_loop], "打包完成", 2)


def message(title, info, style):
    if style == 1:
        msg = "//// {0} {1} ////".format(title, info)
        if len(msg) != 100:
            msg = msg + (100 - len(msg)) * "/" + "\n"
        print(msg)
    elif style == 2:
        msg = "---- {0} {1} ----".format(title, info)
        if len(msg) != 100:
            msg = (100 - len(msg)) * "-" + msg + "\n"
        print(msg)


def wait_input_to_do():
    e = input("回车: 退出\no: 打开输出的文件夹\nr: 重新开始\n")
    if e == "":
        quit()
    elif e == "o":
        try:
            system("explorer {0}\\{1}".format(rdir, ver))
        except NameError:
            print("未能正确执行程序...\n")
            wait_input_to_do()
    elif e == "r":
        init()
    else:
        quit()


init()
