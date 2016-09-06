# passgen
Simple password generator for services purpose

This password generator is made to handle multiple services authentication.
It aims at generating and retrieving a strong password for each service you use.
This generator is a solution to leaks problem. 

Features :
----------

[+] Generates and retrieves very complex passwords from a master key and a service name

[+] Thanks to the cryptography functions used (sha256), both 
the service and the master key cannot be retrieve from the generated password

[+] The service name acts as a salt in the sha256 function

[+] In order to add some entropy the final generated password is a base64 of the 
obtained hash. 

[+] To conclude, given a service name like "facebook" & a master key, you obtain :

- an non brute-forcable password 
- even if the service's database leaks, your master password and every password of 
the other services remain protected
- the program doesn't need to keep your master password to work

############################## USAGE ############################## 
init your master key : 
----------------------
passgen init_digest

 run it :
---------
passgen \<service_name\>

