class role::webapp {
  include profile::tomcat
  include profile::postgres
}
