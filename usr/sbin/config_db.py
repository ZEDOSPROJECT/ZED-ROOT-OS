#!/usr/bin/env python
import ctypes  # An included library with Python install.
def Mbox(title, text, style):
    ctypes.windll.user32.MessageBoxA(0, text, title, style)
Mbox('Your title', 'Your text', 1)
