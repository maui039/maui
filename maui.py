#!/usr/bin/env python3
import gi, sys, time
gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
from gi.repository import Gtk, Adw, Gdk, GLib

APP_ID = "io.maui.typing"

class App(Adw.Application):
    def __init__(self):
        super().__init__(application_id=APP_ID)

    def do_activate(self):
        win = Adw.ApplicationWindow(application=self)
        win.set_title("MAUI")
        win.set_default_size(900, 540)

        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=12)
        box.set_valign(Gtk.Align.CENTER)
        box.set_halign(Gtk.Align.CENTER)

        title = Gtk.Label(label="MAUI")
        title.set_css_classes(["title-1"])

        subtitle = Gtk.Label(label="Type the Rhythm")
        prompt = Gtk.Label(label="Press Any Key")

        box.append(title)
        box.append(subtitle)
        box.append(prompt)
        win.set_content(box)

        ctrl = Gtk.EventControllerKey()
        ctrl.connect("key-pressed", lambda *a: prompt.set_label("✨ Flow ✨"))
        win.add_controller(ctrl)

        win.present()

def load_css():
    css = b"""
    window { background: #12001f; }
    label.title-1 { font-size: 64px; font-weight: 900; }
    """
    provider = Gtk.CssProvider()
    provider.load_from_data(css)
    Gtk.StyleContext.add_provider_for_display(
        Gdk.Display.get_default(),
        provider,
        Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION,
    )

if __name__ == "__main__":
    load_css()
    app = App()
    sys.exit(app.run(sys.argv))
