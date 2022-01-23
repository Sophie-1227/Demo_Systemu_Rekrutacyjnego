package windows;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class AdminLog {
    private Frame adminLogFrame;
    private Label headerLabelAdminLog;
    private Panel adminLogPanel;

    public AdminLog(){
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        adminLogFrame = new Frame("Okno logowania");
        adminLogFrame.setSize(700, 500);
        adminLogFrame.setLayout(new GridLayout(3, 1));
        adminLogFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelAdminLog = new Label();
        headerLabelAdminLog.setAlignment(Label.CENTER);
        headerLabelAdminLog.setFont(font);

        adminLogPanel = new Panel();
        adminLogPanel.setLayout(new FlowLayout());

        adminLogFrame.add(headerLabelAdminLog);
        adminLogFrame.add(adminLogPanel);
        adminLogFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelAdminLog.setText("Podaj login i hasło");

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

        adminLogPanel.add(panel);
        adminLogFrame.setVisible(true);

    }

}
