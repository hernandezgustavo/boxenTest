# Usage
#   To use the default license path at
#   modules/people/files/githubUser/license-sublime:

#     include apps::sublime
#
#
#   To specify a custom license path, add the path in your
#   hiera.json using "apps::sublime::licensePath" for the key.
#   Or, declare the class with resource-like behavior:
#
#     class { 'apps::sublime': licensePath => '/path/to/license' }
#
class apps::sublime ($licensePath = undef) {
  require sublime_text

  include apps::sublime::emmet
  include apps::sublime::linter
  include apps::sublime::repl
#  include apps::sublime::typescript
  include apps::sublime::less

  if $licensePath {
    $sublimeLicensePath = $licensePath
  }
  else {
    $sublimeLicensePath = "${boxen::config::repodir}/modules/people/files/${boxen::config::login}/license-sublime"
  }

  # this File.exist check only works because boxen runs locally (server-less puppet)
  $licenseExists = inline_template("<% if File.exist?('${sublimeLicensePath}') %>true<% end %>")
  if $licenseExists {
      $licenseFolder = "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Local"
      file { $licenseFolder:
        ensure => directory
      }
      file { "${licenseFolder}/License.sublime_license":
        ensure => file,
        source => $sublimeLicensePath,
        require => File[$licenseFolder]
      }
  }
}
