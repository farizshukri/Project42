import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CalculatorGUI extends JFrame implements ActionListener {

    private JTextField displayField;
    private JButton[] buttons;

    private String[] buttonLabels = {
            "7", "8", "9", "/",
            "4", "5", "6", "*",
            "1", "2", "3", "-",
            "0", ".", "=", "+"
    };

    private JPanel buttonPanel;

    private double num1, num2;
    private String operator;

    public CalculatorGUI() {
        setTitle("Simple Calculator");
        setSize(300, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null); // Center the window

        displayField = new JTextField(20);
        displayField.setEditable(false);
        add(displayField, BorderLayout.NORTH);

        buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(4, 4, 5, 5));
        buttons = new JButton[buttonLabels.length];

        for (int i = 0; i < buttonLabels.length; i++) {
            buttons[i] = new JButton(buttonLabels[i]);
            buttons[i].addActionListener(this);
            buttonPanel.add(buttons[i]);
        }

        add(buttonPanel, BorderLayout.CENTER);

        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String command = e.getActionCommand();

        switch (command) {
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "." -> {
                String currentText = displayField.getText();
                displayField.setText(currentText + command);
            }
            case "+", "-", "*", "/" -> {
                num1 = Double.parseDouble(displayField.getText());
                operator = command;
                displayField.setText("");
            }
            case "=" -> {
                num2 = Double.parseDouble(displayField.getText());
                calculate();
            }
            default -> displayField.setText("Invalid input");
        }
    }

    private void calculate() {
        double result = 0;
        switch (operator) {
            case "+" -> result = num1 + num2;
            case "-" -> result = num1 - num2;
            case "*" -> result = num1 * num2;
            case "/" -> {
                if (num2 != 0) {
                    result = num1 / num2;
                } else {
                    displayField.setText("Error: Divide by zero");
                    return;
                }
            }
        }
        displayField.setText(String.valueOf(result));
    }

    public static void main(String[] args) {
        new CalculatorGUI();
    }
}
