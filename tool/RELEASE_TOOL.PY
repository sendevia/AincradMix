from os import getcwd, path, mkdir, system, _exit, chdir
from shutil import rmtree
from datetime import date
from tkinter import *


def init():
    global timestr, ver, sfx, cdir, rdir
    print("AincradMix Release Tool\n")
    # 获取当前时间
    timestr = date.today()
    cdir = getcwd()
    rdir = cdir + "\\release"
    # 判断目录是否正常
    if path.exists("core\\skin.ini"):
        # 删除临时文件
        if path.exists("tmp"):
            rmtree("tmp")
        else:
            print("- 无需删除临时文件\n")
    else:
        print("- {} 非正常目录\n".format(cdir))
        wait_input_to_do()
    # 判断是否存在release文件夹，不存在则修复
    if path.exists("release"):
        chdir(rdir)
    else:
        mkdir("release")
        chdir(rdir)
    print("- 发行目录 {} 正常\n".format(rdir))
    # 设置版本号
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
    global npt_name, spt_name, npt_loop
    npt_name = ["core", "animation", "sfx", "optimize", "extra"]
    spt_name = ["patch", "project"]
    for npt_loop in range(len(npt_name)):
        prog()


def prog():
    msg = "//// 开始打包 {} ////".format(npt_name[npt_loop])
    # 统一格式化为30字符
    if len(msg) != 100:
        msg = msg + (100 - len(msg)) * "/" + "\n"
    print(msg)
    # 正常部分正常执行
    #system("{0}\\bin\\7za.exe a -tzip -y {1}\\{3}\\AincradMix-{2}.zip {0}\\{2}\\*".format(
    #    cdir, rdir, npt_name[npt_loop], ver))
    # 结束
    msg = "{} 打包完成 -\n".format(npt_name[npt_loop])
    if len(msg) != 100:
        msg = "\n" + (100 - len(msg)) * " " + msg
    print(msg)


def wait_input_to_do():
    e = input("回车: 退出   “o”: 打开输出的文件夹   “r”: 重新开始\n")
    if e == "":
        _exit(0)
    elif e == "o":
        try:
            system("explorer {0}\\{1}".format(rdir,ver))
        except NameError:
            print("未能正确执行程序...\n")
            wait_input_to_do()
    elif e == "r":
        init()
    else:
        exit()


def msg():
    msg = "//// {} ////".format()
    if len(msg) != 100:
        msg = msg + (100 - len(msg)) * "/" + "\n"
    print(msg)


init()
