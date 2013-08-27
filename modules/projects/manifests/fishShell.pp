class projects::fishShell {
    # Install fish
    include fish

    # Install fish,set it as the default shell
    class { 'fish':
      chsh => true,
    }
}
