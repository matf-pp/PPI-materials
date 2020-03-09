import ui_4_05
from PyQt5 import QtCore, QtGui, QtWidgets
import sys
import re

__author__ = 'Milan Cugurovic & Ivan Ristovic, 2020.'

class CalculatorClass(ui_4_05.Ui_Calculator, QtWidgets.QMainWindow):
    def __init__(self):
        super(CalculatorClass, self).__init__()
        self.setupUi(self)

        # Dodajem akcije za press the number
        self.pushButton_d0.clicked.connect(lambda: self.display_screen('0'))
        self.pushButton_d1.clicked.connect(lambda: self.display_screen('1'))
        self.pushButton_d2.clicked.connect(lambda: self.display_screen('2'))
        self.pushButton_d3.clicked.connect(lambda: self.display_screen('3'))
        self.pushButton_d4.clicked.connect(lambda: self.display_screen('4'))
        self.pushButton_d5.clicked.connect(lambda: self.display_screen('5'))
        self.pushButton_d6.clicked.connect(lambda: self.display_screen('6'))
        self.pushButton_d7.clicked.connect(lambda: self.display_screen('7'))
        self.pushButton_d8.clicked.connect(lambda: self.display_screen('8'))
        self.pushButton_d9.clicked.connect(lambda: self.display_screen('9'))

        # Dodajem akciju za clear
        self.pushButton_clr.clicked.connect(self.lineEdit.clear)

        # Dodajem akciju za backspace
        self.pushButton_del.clicked.connect(self.lineEdit.backspace)

        # Dodajem akcije za operacije
        self.pushButton_add.clicked.connect(lambda: self.display_operator('+'))
        self.pushButton_sub.clicked.connect(lambda: self.display_operator('-'))
        self.pushButton_mul.clicked.connect(lambda: self.display_operator('*'))
        self.pushButton_div.clicked.connect(lambda: self.display_operator('/'))
        self.pushButton_mod.clicked.connect(lambda: self.display_operator('%'))

        # Dodajem finalno akciju za =
        self.pushButton_eq.clicked.connect(self.calculate)

    # Ispisujem broj value na ekran
    def display_screen(self, digit):
        self.lineEdit.insert(digit)

    def display_operator(self, operator):
        if len(self.lineEdit.text())>0 and self.lineEdit.text()[-1] not in ['+', '-', '*', '/']:
            self.lineEdit.insert(operator)

    def calculate(self):
        data = str(self.lineEdit.text())
        operands = re.split('\+|\-', data)
        operators = list(filter(lambda c: c in ['+', '-'], data))
        assert len(operators) + 1 == len(operands)
        operands = list(map(lambda expression: self.evaluate(expression), operands))
        
        result = int(operands[0])
        for i in range(0, len(operators)):
            nextOperand = operands[i+1]
            nextOperator = operators[i]

            if nextOperator=='+':
                result += int(nextOperand)
            else:
                result -= int(nextOperand)
        self.lineEdit.setText(str(result))

    def evaluate(self, data):
        operands = re.split('\*|/', data)
        if len(operands)==1:
            return data
        operators = list(filter(lambda c: c in ['*', '/'], data))
        assert len(operators) + 1 == len(operands)

        result = int(operands[0])
        for i in range(0, len(operators)):
            nextOperand = operands[i+1]
            nextOperator = operators[i]

            if nextOperator=='*':
                result *= int(nextOperand)
            else:
                result = int(result/float(nextOperand))
        return result

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    calculator = CalculatorClass()
    calculator.show()
    sys.exit(app.exec_())
    