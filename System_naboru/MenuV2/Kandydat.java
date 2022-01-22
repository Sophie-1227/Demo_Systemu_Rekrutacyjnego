package main.java;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class Kandydat {
    private Frame kandydatFrame;
    private Label headerLabelKandydat;
    private Panel kandydatPanel;

    public Kandydat(){
        prepareKandydatGUI();
    }

    private void prepareKandydatGUI(){
        kandydatFrame = new Frame("Okno logowania Kandydata");
        kandydatFrame.setSize(700, 500);
        kandydatFrame.setLayout(new GridLayout(3, 1));
        kandydatFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelKandydat = new Label();
        headerLabelKandydat.setAlignment(Label.CENTER);
        headerLabelKandydat.setFont(font);

        kandydatPanel = new Panel();
        kandydatPanel.setLayout(new FlowLayout());

        kandydatFrame.add(headerLabelKandydat);
        kandydatFrame.add(kandydatPanel);
        kandydatFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelKandydat.setText("Podaj login i hasło");

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

        kandydatPanel.add(panel);
        kandydatFrame.setVisible(true);


    }

}
