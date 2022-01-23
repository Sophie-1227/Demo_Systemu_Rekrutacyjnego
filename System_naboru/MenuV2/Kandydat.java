package main.java;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class Log {
    private Frame LogFrame;
    private Label headerLabelLog;
    private Panel LogPanel;

    public Log(){
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        LogFrame = new Frame("Okno logowania");
        LogFrame.setSize(700, 500);
        LogFrame.setLayout(new GridLayout(3, 1));
        LogFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelLog = new Label();
        headerLabelLog.setAlignment(Label.CENTER);
        headerLabelLog.setFont(font);

        LogPanel = new Panel();
        LogPanel.setLayout(new FlowLayout());

        LogFrame.add(headerLabelLog);
        LogFrame.add(LogPanel);
        LogFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelLog.setText("Podaj login i hasło");

        Panel panel = new Panel();
        panel.setSize(500, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JTextField login = new JTextField("Login");
        login.setPreferredSize(new Dimension(300, 40));
        panel.add(login, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JTextField pass = new JTextField("Password");
        panel.add(pass, gbc);

        LogPanel.add(panel);
        LogFrame.setVisible(true);


    }

}
