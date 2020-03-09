import ui_4_03
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog
import sys
import os

__author__ = 'Milan Cugurovic & Ivan Ristovic, 2020.'

class SimplePadClass(ui_4_03.Ui_MainWindow, QtWidgets.QMainWindow):
    def __init__(self):
        super(SimplePadClass, self).__init__()
        self.setupUi(self)

        # Putanja do trenurno otvorenog fajla
        self.path = None

        # Akcije
        self.actionNew.triggered.connect(lambda: self.OpenMe())
        self.actionSave.triggered.connect(lambda: self.SaveMe())
        self.actionSaveAs.triggered.connect(lambda: self.SaveAsMe())

    # Azuriram naslov prozora
    def __title(self):
        self.setWindowTitle("{} - SimplePad".format(os.path.basename(self.path) if self.path is not None else 'Untitled'))
        
    # Poruka za korisnika
    def __dialog(self, msg):
        box = QMessageBox(self)
        box.setText(msg)
        box.show()

    # Cuvam na fajl sistemu
    def __save_util(self, path):
        data = self.editor.toPlainText()
        try:
            with open(path, "w") as f:
                f.write(data)
        except Exception as e:
            self.__dialog(str(e))
        else:
            self.path = path
            self.__title()

    # ctr+O
    def OpenMe(self):
        path, _ = QFileDialog.getOpenFileName(self, "Open file", "", "All files (*.*);")
        if path:
            try:
                with open(path, "r") as f:
                    data = f.read()
            except Exception as e:
                self.__dialog(str(e))
            else:
                self.path = path
                self.editor.setPlainText(data)
                self.__title()

    # Ctr+S
    def SaveMe(self):
        if self.path is None:
            return self.SaveAsMe()
        self.__save_util(self.path)

    # Ctrl+Alt+S
    def SaveAsMe(self):
        path, _ = QFileDialog.getSaveFileName(self, "Save file", "", "All files (*.*);")
        if not path:
            return  # cancelled
        self.__save_util(path)
    

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    simplePad = SimplePadClass()
    simplePad.show()
    sys.exit(app.exec_())
    