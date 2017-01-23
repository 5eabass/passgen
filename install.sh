#!/bin/sh

VERT="\\033[1;32m"
BLANC="\\033[0;39m"

taskDone() {
	echo -e "$VERT""Done""$BLANC"
}

echo "** INSTALLING PASSGEN **\n\n"

echo "[+] Creating directory\n"
mkdir $HOME/.passGen/

echo "[+] Creating services file\n"
touch $HOME/.passGen/services

echo "[+] Creating launcher\n"

## case linux

# touch /usr/local/bin/passgen
# cat >> /usr/local/bin/passgen <<EOF
# #!/bin/sh
# # just launch the program
# python $HOME/.passGen/passgen.py \$1
# EOF
# chmod +x /usr/local/bin/passgen

## case mac os

touch /usr/local/opt/passgen
cat >> /usr/local/opt/passgen <<EOF
#!/bin/sh
# just launch the program
python $HOME/.passGen/passgen.py \$1
EOF
chmod +x /usr/local/opt/passgen
taskDone

echo "[+] Creating passgen.py\n"
touch $HOME/.passGen/passgen.py
cat >> $HOME/.passGen/passgen.py <<EOF
import sys
import os
import hashlib
import getpass
import base64

# to adapt
# run : passgen init_digest to view your 2 first digit
master_digest = "a5"

home_folder = os.getenv('HOME')
path = home_folder+"/.passGen/services"

def exist(service):
    result = 0
    f = open(path,'r')
    for l in f.readlines():
        l=l.strip()
        if l == service :
            result = 1
    f.close()
    return result

# main : 
if len(sys.argv) < 2 :
    print "[-] Usage : passgen <service_name>"
    print "[-] Usage to init the master password : passgen init_digest"
    
else :
    service = sys.argv[1]

    if service == "init_digest" :
        master_init = getpass.getpass()
        master_digest_init = hashlib.sha256(master_init).hexdigest()[:2]
        print master_digest_init
        print "[+] replace \"XXXXXX\" with these 6 digits in .passGen/passgen.py line 9"
        sys.exit(1)
    else :
        found = exist(service)
        if found == 1 :
            print "[+] service already stored"
        else : 
            print "[+] unknown service"
            add = raw_input("[+] add \"" +service+ "\"? [y/n]")
            if add == "y" :
                print "[+] add OK"
                g = open(path,'a')
                g.write("\n"+service)
                g.close()
            else :
                sys.exit(1)
        master = getpass.getpass()

        # test if the 2 first digit of the digest are corresponding
        if hashlib.sha256(master).hexdigest()[:2] == master_digest : 
            # password to use
            print "long : " + str(base64.b64encode(hashlib.sha256(service+master).hexdigest())[30:])
            print "short : " + str(base64.b64encode(hashlib.sha256(service+master).hexdigest())[-12:])
        else :
            print "[-] Wrong password !"
EOF
chmod +x $HOME/.passGen/passgen.py
taskDone

echo "[+] Modifying PATH\n"

## case linux

# export PATH=/usr/local/bin/:$PATH

## case MAC OS
# change PATH in .profile and change .bashrc = ..profile


echo "$VERT""[+] install completed""$BLANC"

