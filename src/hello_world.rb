require "gir_ffi-gtk3"

GirFFI.setup :Granite, "1.0"
GirFFI.setup :Handy, "0.0"

Gtk.init
Handy.init

win = Gtk::Window.new(:toplevel)

win.signal_connect "delete-event" do
  puts "delete event occured"
  Gtk.main_quit
end

win.signal_connect("destroy") { Gtk.main_quit }

but = Granite::AccelLabel.new(label="Hello World")

titlebar = Handy::TitleBar.new
headerbar = Handy::HeaderBar.new

headerbar.set_title("Ruby GTK Handy")
titlebar.add headerbar

win.add but
win.set_titlebar titlebar
win.resize 400, 300

win.show_all

Gtk.main
