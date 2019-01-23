# copies directory from Linux partition to Windows NTFS with rename via regexp
# modification of copytree from shutil

import sys, os, re, shutil
from pathlib import Path

def renamecopy( src, dst ):
    names = os.listdir(src)
    os.makedirs(dst)
    errors = []
    for name in names:
        srcname = os.path.join(src, name)
        subname = re.sub(r"[\<\>\:\"\?\*\\\/]", "_", name)
        dstname = os.path.join(dst, subname)
        try:
            if os.path.islink(srcname):
                linkto = os.readlink(srcname)
                os.symlink(linkto, dstname)
            elif os.path.isdir(srcname):
                renamecopy(srcname, dstname)
            else:
                shutil.copy2(srcname, dstname)
        except OSError as why:
            errors.append((srcname, dstname, str(why)))
        except Error as err:
            errors.extend(err.args[0])
    try:
        shutil.copystat(src, dst)
    except OSError as why:
        if why.winerror is None:
            errors.extend((src, dst, str(why)))
    if errors:
        raise shutil.Error(errors)

renamecopy( sys.argv[1], sys.argv[2] )
