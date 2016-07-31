import 'role/webapp.pp'
import 'profile/tomcat.pp'
import 'profile/postgres.pp'

node default {
  include role::webapp
}
