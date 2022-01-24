package windows;

import main.java.SearchEnginePracownika;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class PracownikLog {
    private Frame pracownikLogFrame;
    private Label headerLabelPracownikLog;
    private Panel pracownikLogPanel;

    public PracownikLog(){
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        pracownikLogFrame = new Frame("Okno logowania");
        pracownikLogFrame.setSize(700, 500);
        pracownikLogFrame.setLayout(new GridLayout(3, 1));
        pracownikLogFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelPracownikLog = new Label();
        headerLabelPracownikLog.setAlignment(Label.CENTER);
        headerLabelPracownikLog.setFont(font);

        pracownikLogPanel = new Panel();
        pracownikLogPanel.setLayout(new FlowLayout());

        pracownikLogFrame.add(headerLabelPracownikLog);
        pracownikLogFrame.add(pracownikLogPanel);
        pracownikLogFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelPracownikLog.setText("Podaj login i hasło");

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

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JButton enter = new JButton("Zaloguj");
        panel.add(enter, gbc);

        enter.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        SearchEnginePracownika sep = new SearchEnginePracownika();
                        sep.setGridBagLayout();
                        pracownikLogFrame.setVisible(false);
                    }
                }
        );

        pracownikLogPanel.add(panel);
        pracownikLogFrame.setVisible(true);

    }

}
