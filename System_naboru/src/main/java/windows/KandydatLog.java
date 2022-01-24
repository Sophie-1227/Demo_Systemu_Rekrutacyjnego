package windows;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.GregorianCalendar;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class KandydatLog {
    private Frame kandydatLogFrame;
    private Label headerLabelKandydatLog;
    private Panel kandydatLogPanel;

    public KandydatLog(){
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        kandydatLogFrame = new Frame("Okno logowania");
        kandydatLogFrame.setSize(700, 500);
        kandydatLogFrame.setLayout(new GridLayout(3, 1));
        kandydatLogFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelKandydatLog = new Label();
        headerLabelKandydatLog.setAlignment(Label.CENTER);
        headerLabelKandydatLog.setFont(font);

        kandydatLogPanel = new Panel();
        kandydatLogPanel.setLayout(new FlowLayout());

        kandydatLogFrame.add(headerLabelKandydatLog);
        kandydatLogFrame.add(kandydatLogPanel);
        kandydatLogFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelKandydatLog.setText("Podaj login i hasło");

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
        JButton log = new JButton("Zaloguj");
        log.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        //Panel z panelami do wpisania danych szczegółowych
                        kandydatLogFrame.setVisible(false);
                    }
                }
        );

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 3;
        JButton register = new JButton("Rejestracja");
        register.addActionListener(
                new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //Otwieranie okna do logowania pracownika
                Register register1 = new Register();
                register1.setGridBagLayout();
                kandydatLogFrame.setVisible(false);
            }
        }
        );
        panel.add(register, gbc);

        kandydatLogPanel.add(panel);
        kandydatLogFrame.setVisible(true);

    }

}
