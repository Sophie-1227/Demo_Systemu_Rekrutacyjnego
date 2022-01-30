package windows;

import datebase.DatebaseInterface;
import datebase.StatementCreator;

import javax.swing.*;
import javax.swing.plaf.nimbus.State;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;

import static javax.swing.JOptionPane.showMessageDialog;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class Register {
    private Frame registerFrame;
    private Label headerLabelRegister;
    private Panel registerPanel;
    DatebaseInterface datebase;
    StatementCreator creator;

    public Register(DatebaseInterface datebase, StatementCreator creator){
        this.datebase = datebase;
        this.creator = creator;
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        try {
            datebase.startConnection("candidate");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        registerFrame = new Frame("Okno rejestracji");
        registerFrame.setSize(700, 800);
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
        JTextField czyOlim = new JTextField("Wpisz TAK, jeśli jesteś laureatem lub finalistą olimpiady");
        panel.add(czyOlim, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 5;
        JTextField pass = new JTextField("Hasło");
        panel.add(pass, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 6;
        JTextField pass2 = new JTextField("Powtórz hasło");
        panel.add(pass2, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 7;
        JButton register = new JButton("Zatwierdź");
        panel.add(register, gbc);

        registerPanel.add(panel);
        registerFrame.setVisible(true);

        register.addActionListener(new ActionListener() {
            int isOlim;
            @Override
            public void actionPerformed(ActionEvent e) {
                if(czyOlim.getText().equals("TAK")) isOlim = 1;
                else isOlim = 0;

                if(pass.getText().equals(pass2.getText())){
                    if(creator.userRegister(login.getText(), name.getText(), sname.getText(), pass.getText(), pesel.getText(), isOlim) ){
                        showMessageDialog(registerFrame, "Rejestracja przebiegła pomyślnie");
                        try {
                            datebase.startConnection("candidate");
                            new PreferencjeKandydata(datebase, creator);
                            registerFrame.setVisible(false);
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    } else {
                        showMessageDialog(registerFrame,"Nie można zarejestrować kandydata");
                    }
                } else{
                    showMessageDialog(registerFrame, "Podane hasła nie są jednakowe");
                }

            }
        });

    }

}
