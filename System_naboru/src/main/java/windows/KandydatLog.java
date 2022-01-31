package windows;

import datebase.ConcreteDatebase;
import datebase.DatebaseInterface;
import datebase.StatementCreator;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;
import static javax.swing.JOptionPane.showMessageDialog;

public class KandydatLog {
    private Frame kandydatLogFrame;
    private Label headerLabelKandydatLog;
    private Panel kandydatLogPanel;
    DatebaseInterface datebase;
    StatementCreator creator;

    public KandydatLog(DatebaseInterface datebase){
        prepareLogGUI();
        this.datebase = datebase;
        try {
            datebase.startConnection("login");
            creator = new StatementCreator(datebase);
        } catch (SQLException e) {
            e.printStackTrace();
            showMessageDialog(kandydatLogFrame, "Couldn't access database");

        }
    }

    private void prepareLogGUI(){
        kandydatLogFrame = new Frame("Okno logowania");
        kandydatLogFrame.setSize(700, 700);
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
                        if(creator.userCheck(login.getText(), pass.getText(), StatementCreator.UserType.CANDIDATE)){
                            try {
                                datebase.startConnection("candidate");
                                int idKandydata = creator.getUserId(login.getText());
                                new PreferencjeKandydata(datebase, creator, idKandydata);
                                kandydatLogFrame.setVisible(false);
                            } catch (SQLException ex) {
                                showMessageDialog(kandydatLogFrame, "Nie udało się uzyskać dostępu do bazy danych jako kandydat");
                            }
                        } else {
                            showMessageDialog(kandydatLogFrame, "Niepoprawne dane logowania");
                            login.setText("");
                            pass.setText("");
                        }
                    }
                }
        );
        panel.add(log, gbc);

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
                Register register1 = new Register(datebase, creator);
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
