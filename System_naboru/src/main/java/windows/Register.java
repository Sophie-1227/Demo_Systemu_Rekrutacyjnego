package main.java;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class Register {
    private Frame registerFrame;
    private Label headerLabelRegister;
    private Panel registerPanel;

    public Register(){
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        registerFrame = new Frame("Okno rejestracji");
        registerFrame.setSize(700, 500);
        registerFrame.setLayout(new GridLayout(2, 1));
        registerFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelRegister = new Label();
        headerLabelRegister.setAlignment(Label.CENTER);
        headerLabelRegister.setFont(font);

        registerPanel = new Panel();
        registerPanel.setLayout(new FlowLayout());

        registerFrame.add(headerLabelRegister);
        registerFrame.add(registerPanel);
        registerFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelRegister.setText("Wpisz dane nowego użytkownika");

        Panel panel = new Panel();
        panel.setSize(500, 500);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JTextField name = new JTextField("Imię");
        name.setPreferredSize(new Dimension(300, 40));
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JTextField sname = new JTextField("Nazwisko");
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JTextField pesel = new JTextField("PESEL");
        panel.add(pesel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 3;
        JTextField login = new JTextField("Login");
        panel.add(login, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 4;
        JTextField pass = new JTextField("Hasło");
        panel.add(pass, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 5;
        JTextField pass2 = new JTextField("Powtórz hasło");
        panel.add(pass2, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 6;
        JButton register = new JButton("Zatwierdź");
        panel.add(register, gbc);

        registerPanel.add(panel);
        registerFrame.setVisible(true);

    }

}
