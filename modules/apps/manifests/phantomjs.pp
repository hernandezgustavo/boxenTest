class apps::phantomjs {
    # Installs Phantomenv for PhantomJS version management
    include phantomjs

    # Install PhantomJS version 1.9.8
    phantomjs::version { '1.9.8': }
}
