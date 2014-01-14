class apps::git::completion {
  file { "${home}/.git-completion.sh":
    ensure  => link,
    target  => "${$boxen::config::repodir}/modules/people/files/shared/git-completion.sh"
  }
}
