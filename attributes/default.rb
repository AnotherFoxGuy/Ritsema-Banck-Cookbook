# frozen_string_literal: true

normal['openldap']['basedn'] = 'dc=ritsema-banck, dc=frl'
normal['openldap']['server'] = 'ritsema-banck.frl'

normal['openldap']['rootpw'] = '{SSHA}6BjlvtSbVCL88li8IorkqMSofkLio58/'
normal['openldap']['rootpwplain'] = 'secretsauce' # required for the shitty ldapadd tool

default['selfsigned_certificate']['destination'] = '/usr/var/ssl/certs/'
default['selfsigned_certificate']['sslpassphrase'] = 'KaasKnabbels'
default['selfsigned_certificate']['country'] = 'NL'
default['selfsigned_certificate']['state'] = 'FR'
default['selfsigned_certificate']['city'] = 'LWD'
default['selfsigned_certificate']['organisation'] = 'Ritsema Banck'
default['selfsigned_certificate']['depart'] = 'Security'
default['selfsigned_certificate']['cn'] = 'localhost'
default['selfsigned_certificate']['email'] = 'Edgar@AnotherFoxGuy.com'

default['firewall']['allow_ssh'] = true
