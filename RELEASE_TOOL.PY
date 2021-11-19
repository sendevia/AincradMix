from os import getcwd, path, mkdir, rename, system, chdir
from shutil import rmtree
from datetime import date
from time import sleep
import winreg


def init():
    global current_time, release_ver, type_set_sfx, current_dir, release_dir
    print_msg("AincradMix Release Tool", "", 0)
    if get_osu_path() == False:
        print_msg("未找到 osu! 目录", 0, 1)
    else:
        print_msg("找到 osu! 目录: " + get_osu_path(), 1, 1)
    current_time = date.today()
    current_dir = getcwd()
    release_dir = current_dir + "\\release"
    state = 0
    while state == 0:
        if path.exists("core\\skin.ini") and path.exists("release"):
            print_msg("整理工程文件夹", "", 1)
            if path.exists("tmp"):
                rmtree("tmp")
            state = 1
        elif path.exists("core\\skin.ini"):
            mkdir("release")
        else:
            print_msg("{} 非正常目录".format(current_dir), 0, 1)
            pause()
    print_msg("发行目录 {} 正常".format(release_dir), 1, 1)
    print_msg("设置版本: ", 2, 1)
    input_ver = input()
    try:
        def dir():
            global release_ver, release_day
            if input_ver == "":
                release_day = current_time.strftime("%y%m%d")
                mkdir(release_dir + "\\" + release_day)
                print_msg("已默认设置为当前日期: {}".format(release_day), 1, 1)
                release_ver = release_day
            else:
                mkdir(release_dir + "\\" + input_ver)
                release_ver = input_ver
        dir()
    except FileExistsError:
        print_msg("已删除旧的文件", 1, 1)
        if input_ver == "":
            rmtree(release_dir + "\\" + release_day)
        else:
            rmtree(release_dir + "\\" + input_ver)
        dir()
    print_msg("目前已有音效 style_lazer_old(0) , style_lazer(1)", "", 0)
    a = False
    while a != "0" or a != "1":
        print_msg("输入预装的音效（数字）:", 2, 1)
        a = input()
        if a == "0":
            type_set_sfx = "style_lazer_old"
            break
        elif a == "1":
            type_set_sfx = "style_lazer"
            break
        else:
            print_msg("不正确的输入", 0, 1)
    progress_total()
    pause()


def progress_total():
    global progress_name, progress_loop
    progress_name = ["core", "animation", "sound",
                     "optimization", "addition", "source", "patch"]
    for progress_loop in range(len(progress_name)):
        progress_exec(0)


def progress_exec(target):
    print_msg("开始打包", progress_name[progress_loop], 0)
    if target == 0:
        system("{0}\\tool\\7z.exe a -tzip -y {1}\\{3}\\AincradMix-{2}-{3}.zip {0}\\{2}\\*".format(
            current_dir, release_dir, progress_name[progress_loop], release_ver))
    print_msg(progress_name[progress_loop], "打包完成", 1)


def print_msg(content, state, style):
    if state == "":
        if style == 1:
            message = "----- {0}\n".format(content)
        else:
            message = " {0} ".format(content)
    elif state == 0:
        message = " × -- {0}\n".format(content)
    elif state == 1:
        message = " √ -- {0}\n".format(content)
    elif state == 2:
        message = " ? -- {0}".format(content)
    else:
        message = " {0} {1} ".format(content, state)
    if style == 0:
        output = "\n///// {0} /////\n".format(message)
    elif style == 1:
        output = "--{0}".format(message)
    print(output)
    sleep(0.1)


def pause():
    print_msg("[回车] 退出   [o] 打开文件夹打开文件夹   [r] 重新开始   [p] 打开 osu!", 2, 1)
    b = input()
    try:
        if b == "":
            exit_countdown(1)
        elif b == "o" or b == "O":
            try:
                system("explorer {0}\\{1}".format(release_dir, release_ver))
            except NameError:
                print_msg("未能正确执行程序...", 0, 1)
                pause()
        elif b == "r" or b == "R":
            init()
        elif b == "p" or b == "P":
            system(full_osu_path)
        else:
            exit_countdown(1)
    except NameError:
        quit()

def get_osu_path():
    global full_osu_path
    try:
        key = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,
                             r"SOFTWARE\Classes\osu\DefaultIcon")
    except FileNotFoundError:
        return False
    value, none = winreg.QueryValueEx(key, "")
    full_osu_path = value.split(",")[0].strip('"')
    [osu_path, none] = path.split(full_osu_path)
    return osu_path


def exit_countdown(second):
    for c in range(second):
        print("\r" + str(second - c) + " 秒退出程序...", end="", flush=True)
        sleep(second / second)
    quit()


if __name__ == "__main__":
    try:
        init()
    except KeyboardInterrupt:
        print_msg("用户终止", "", 0)
        try:
            if path.exists(release_dir + "\\" + release_ver):
                print_msg("正在清理...", "", 1)
                rmtree(release_dir + "\\" + release_ver)
                pause()
        except:
            quit()
