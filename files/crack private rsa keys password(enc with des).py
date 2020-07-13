from subprocess import PIPE, Popen
import subprocess
import sys

def cmdline(command):
    proc = subprocess.Popen(str(command), stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=T$
    (out, err) = proc.communicate()
    return err

def main():
    words = [line.strip() for line in open('/opt/rockyou.txt')]
    print("\n")
    count=0

    for w in words:
        strcmd = "openssl rsa -in private.pem -out out.key -passin pass:"+w
        res=cmdline(strcmd)
        if res.startswith("writing"):
                print("\nThe key is: "+w)
                sys.exit()
        print(str(count)+"/"+str(w))
        count=count+1
    print("\n")
#see adventofcyber/day12 for a different version of this
if __name__ == '__main__':
    main()
