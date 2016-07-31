class profile::tomcat (
  $war_source
) {
  include java8

  $war_name = inline_template('<%= File.basename(war_source) %>')

  tomcat::install { '/opt/tomcat8':
    source_url => 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz'
  } ->
  tomcat::instance { 'default':
    catalina_home => '/opt/tomcat8'
  } ->
  tomcat::war { $war_name:
    deployment_path => '/opt/tomcat8/webapps',
    war_source      => $war_source
  }
}
