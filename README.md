# passgen
Simple password generator for services purpose

This password generator is made for services handling purpose.
It aims at generating, retrieving a strong and independant password for each service you use.
This generator is a solution to leaks problem. 

Features :
----------

[+] Generate and retrieve very complex passwords from one master password and a service name

[+] Thanks to the cryptography functions used (sha256), either 
the service and the master password cannot be retrieve from the generated one

[+] The service name acts as a salt in the sha256 function

[+] In order to add some entropy the final generated password is a base64 of the 
hash obtained. 

[+] To conclude, given a service name like "facebook" & a master password, you obtain :

- an non brute-forcable password 
- even if the service's database leaks, your master password and every password of 
the other services remain protected
- the program doesn't need to keep your master password to work

############################## USAGE ############################## 
init your master password : 
---------------------------
passgen init_digest

to run :
--------
passgen <service_name>

