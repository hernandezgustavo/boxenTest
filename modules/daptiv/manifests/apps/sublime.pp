class daptiv::apps::sublime {
  include sublime_text_3

  include daptiv::apps::sublime::emmet
  include daptiv::apps::sublime::linter
  include daptiv::apps::sublime::repl
  include daptiv::apps::sublime::typescript

}
