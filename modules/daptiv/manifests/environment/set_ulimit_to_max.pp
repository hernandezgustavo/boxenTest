# Prevent Nodejs from throwing encountering ulimit errors
# Even though it's set to unlimited, that is ignored.
class daptiv::environment::set_ulimit_to_max {

  file_line { 'increaseUlimit':
    # 3000 is the maximum allowed or the value is ignored
    line => 'ulimit -n 3000',
    path => '/etc/profile',
  }
}
