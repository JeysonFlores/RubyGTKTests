require "gir_ffi-gtk3"

Gtk.init

class CustomWindow < Gtk::Window

    @@counter = 0
    
    def get_counter
        @@counter
    end

    def increase_counter
        @@counter  = @@counter + 1
    end
end


win = CustomWindow.new(:toplevel)
win.set_title ("CustomWindow counter example")

win.signal_connect "delete-event" do
  Gtk.main_quit
end

win.signal_connect("destroy") { Gtk.main_quit }

button = Gtk::Button.new
button.set_label "Counter is #{win.get_counter}"
button.signal_connect "clicked" do
    win.increase_counter
    button.set_label "Counter is #{win.get_counter}"
end

win.add button
win.resize 400, 300
win.show_all

Gtk.main
