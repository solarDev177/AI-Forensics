# 11/11/2024
# Data Structures Project - AI Detection

from CV2 import ComputerVisionModule
from tkinterdnd2 import TkinterDnD

def main():
    root = TkinterDnD.Tk()  # Use TkinterDnD.Tk() instead of tk.Tk()
    ComputerVisionModule(root)
    root.mainloop()


if __name__ == '__main__':
    main()
