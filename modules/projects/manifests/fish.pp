# Install fish
include fish

# Install fish, and set it as default!!!
class { 'fish':
  chsh => true,
}
