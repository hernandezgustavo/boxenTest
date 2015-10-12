class apps::git::difftools::diffmerge {
  include ::diffmerge

  git::config::global {
    'diff.tool': value => 'diffmerge';
    'difftool "diffmerge".cmd': value => '/usr/local/bin/diffmerge "$LOCAL" "$REMOTE"';
    'merge.tool': value => 'diffmerge';
    'mergetool "diffmerge".trustExitCode': value => 'true';
    'mergetool "diffmerge".cmd': value => '/usr/local/bin/diffmerge --merge --result="$MERGED" "$LOCAL" "$BASE" "$REMOTE"';
    'mergetool.prompt': value => 'false';
    'mergetool.keepBackup': value => 'false';
  }
}
