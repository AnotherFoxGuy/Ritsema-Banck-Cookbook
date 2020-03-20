normal['openldap']['basedn'] = 'dc=ritsema-banck, dc=frl'
normal['openldap']['server'] = 'ritsema-banck.frl'

normal['openldap']['ldaps_enabled'] = true
normal['openldap']['tls_enabled'] = true
normal['openldap']['tls_cert'] = '/usr/var/ssl/certs/server.crt'
normal['openldap']['tls_key'] = '/usr/var/ssl/certs/server.key'
normal['openldap']['tls_cafile'] = '/usr/var/ssl/certs/server.key.org'

normal['openldap']['rootpw'] = '{SSHA}6BjlvtSbVCL88li8IorkqMSofkLio58/'
normal['openldap']['rootpwplain'] = 'secretsauce' # required for the shitty ldapadd tool


default['selfsigned_certificate']['destination'] = "/usr/var/ssl/certs/"
default['selfsigned_certificate']['sslpassphrase'] = "KaasKnabbels"
default['selfsigned_certificate']['country'] = "NL"
default['selfsigned_certificate']['state'] = "FR"
default['selfsigned_certificate']['city'] = "LWD"
default['selfsigned_certificate']['organisation'] = "Ritsema Banck"
default['selfsigned_certificate']['depart'] = "Security"
default['selfsigned_certificate']['cn'] = "localhost"
default['selfsigned_certificate']['email'] = "Edgar@AnotherFoxGuy.com"
