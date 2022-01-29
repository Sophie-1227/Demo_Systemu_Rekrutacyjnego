package windows;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class PreferencjeKandydata {
    private Frame preferencjeKandydatFrame;
    private Label headerLabelPreferencjekandydata;
    private JTabbedPane preferencjeKandydataPane;
    private Panel Preferencje; //ewentualna zmiana na component w zaleznosci od reakcji javy
    private Panel Dane;
    private Panel Matura;

    public PreferencjeKandydata(){
        prepareGUI();
    }

    public void prepareGUI(){
        preferencjeKandydatFrame = new Frame("Wybór preferencji");
        preferencjeKandydatFrame.setSize(700, 500);
        preferencjeKandydatFrame.setLayout(new GridLayout(3, 1));
        preferencjeKandydatFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", Font.BOLD&Font.ITALIC, 30);
        headerLabelPreferencjekandydata = new Label();
        headerLabelPreferencjekandydata.setAlignment((int) Label.TOP_ALIGNMENT);
        headerLabelPreferencjekandydata.setFont(font);

        preferencjeKandydataPane = new JTabbedPane(SwingConstants.LEFT);
        preferencjeKandydataPane.setLayout(new FlowLayout());

        Dane = new Panel();
        Preferencje = new Panel();
        Matura = new Panel();

        preferencjeKandydataPane.addTab("Dane Osobowe", Dane);
        preferencjeKandydataPane.addTab("Preferencje", Preferencje);
        preferencjeKandydataPane.addTab("Wyniki Matur", Matura);

        preferencjeKandydatFrame.add(headerLabelPreferencjekandydata);
        preferencjeKandydatFrame.add(preferencjeKandydataPane);
        preferencjeKandydatFrame.setVisible(true);

    }

    public void setGridBagDaneLayout(){
        //Wyświetlanie danych z wykorzystaniem prepared statment
        headerLabelPreferencjekandydata.setText("Twoje dane osobowe");

        Panel panel = new Panel();
        panel.setSize(500, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JTextField login = new JTextField("Imię");
        login.setPreferredSize(new Dimension(300, 40));
        panel.add(login, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JTextField pass = new JTextField("Nazwisko");
        panel.add(pass, gbc);

        Dane.add(panel);
        preferencjeKandydatFrame.setVisible(true);

    }

    public void setGridBagPreferencjeLayout(){
        //Wybór preferencji kandydata
        headerLabelPreferencjekandydata.setText("Wybierz kierunki, którymi jesteś zainteresowany");

        Panel panel = new Panel();
        panel.setSize(500, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        //Do dodania Jlist dual http://www.java2s.com/Tutorials/Java/Swing/JList/Create_a_dual_JList_component_in_Java.htm

        Preferencje.add(panel);
        preferencjeKandydatFrame.setVisible(true);

    }

    public void setGridBagMaturyLayout(){
        //Uzupełnienie wyników matur
        headerLabelPreferencjekandydata.setText("Uzupełnij wyniki matur");

        Panel panel = new Panel();
        panel.setSize(500, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        //Do dodania pola tekstowe + label do każdego przedmiotu

        Matura.add(panel);
        preferencjeKandydatFrame.setVisible(true);

    }
}
