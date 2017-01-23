# passgen
Simple password generator for multiple authentication

This generator is a solution to database's leaks problem. 

Features :
----------

[+] Generates and retrieves complex passwords from a master key and a service name

[+] Thanks to the cryptography functions used (sha256), both 
the service and the master key cannot be retrieve from the generated password

[+] In order to add some entropy the final generated password is a base64 of the 
obtained hash. 

[+] To conclude, given a service name like "facebook" & a master key, you obtain :

- an non brute-forcable password 
- even if the service's database leaks, your master password and every password of 
the other services remains protected
- the program doesn't need to keep your master password to work

############################## USAGE ############################## 
init your master key : 
----------------------
passgen init_digest

 run it :
---------
passgen \<service_name\>

