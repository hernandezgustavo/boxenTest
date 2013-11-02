class apps::sublime {
  include sublime_text_3

  include apps::sublime::emmet
  include apps::sublime::linter
  include apps::sublime::repl
  include apps::sublime::typescript

}
