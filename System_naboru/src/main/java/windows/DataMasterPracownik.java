package main.java;

import datebase.DatebaseInterface;
import datebase.StatementCreator;


import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class DataMasterPracownik {
    private Frame pracownikDataFrame;
    private Label headerLabelPracownikData;
    private Panel pracownikDataPanel;
    DatebaseInterface datebase;
    StatementCreator creator;

    public DataMasterPracownik(DatebaseInterface datebase){
        prepareGUI();
        this.datebase = datebase;
    }

    private void prepareGUI(){
        pracownikDataFrame = new Frame("Dane kandydata");
        pracownikDataFrame.setSize(700, 500);
        //pracownikDataFrame.setLayout(new GridLayout(3, 1));
        pracownikDataFrame.setLayout(new BorderLayout());
        pracownikDataFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelPracownikData = new Label();
        headerLabelPracownikData.setAlignment(Label.CENTER);
        headerLabelPracownikData.setFont(font);
        headerLabelPracownikData.setSize(700, 200);

        pracownikDataPanel = new Panel();
        pracownikDataPanel.setLayout(new BorderLayout());
        pracownikDataPanel.setSize(700, 500);

        pracownikDataFrame.add(headerLabelPracownikData, BorderLayout.NORTH);
        pracownikDataFrame.add(pracownikDataPanel, BorderLayout.CENTER);
        pracownikDataFrame.setVisible(true);
    }

    public void setGridBagDataLayout(){
        headerLabelPracownikData.setText("Tutaj możesz dokonać zmian w danych kandydata");

        Panel panel = new Panel();
        panel.setSize(700, 100);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JTextField name = new JTextField("Imię");
        //name.setPreferredSize(new Dimension(120, 20));
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField sname = new JTextField("Nazwisko");
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 0;
        Choice status = new Choice();
        status.add("Oczekuje na oplate");
        status.add("Zlozono dokumenty");
        status.add("Przyjety");
        status.add("Odrzucony");
        status.add("Nieprzyjety");
        status.add("Wniesiono oplate");
        status.add("Zakwalifikowany do przyjecia");
        //type.setPreferredSize(new Dimension(70, 40));
        panel.add(status, gbc);

        /*gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 4;
        gbc.gridy = 0;
        JTextField ewidencja data = new JTextField("Ewidencja");
        panel.add(ewidencja, gbc);*/

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 3;
        gbc.gridy = 0;
        Choice olimp = new Choice();
        olimp.add("TAK");
        olimp.add("NIE");
        panel.add(olimp, gbc);


        pracownikDataPanel.add(panel, BorderLayout.NORTH);
        pracownikDataFrame.setVisible(true);

    }

    public void setGridBagPreferencjeLayout(){
        Panel panel = new Panel();
        panel.setSize(350, 400);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel pref1 = new JLabel("1");
        panel.add(pref1, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JLabel pref1Wskaznik = new JLabel();
        panel.add(pref1Wskaznik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 0;
        JTextField pref1Data = new JTextField(); //Wrzucamy w środek kod kierunku i kod wydziału, bo na pełne nazwy nie ma miejsca
        panel.add(pref1Data, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JLabel pref2 = new JLabel("2");
        panel.add(pref2, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JLabel pref2Wskaznik = new JLabel();
        panel.add(pref2Wskaznik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 1;
        JTextField pref2Data = new JTextField();
        panel.add(pref2Data, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JLabel pref3 = new JLabel("3");
        panel.add(pref3, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 2;
        JLabel pref3Wskaznik = new JLabel();
        panel.add(pref3Wskaznik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 2;
        JTextField pref3Data = new JTextField();
        panel.add(pref3Data, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 3;
        JLabel pref4 = new JLabel("4");
        panel.add(pref4, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 3;
        JLabel pref4Wskaznik = new JLabel();
        panel.add(pref4Wskaznik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 3;
        JTextField pref4Data = new JTextField();
        panel.add(pref4Data, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 4;
        JLabel pref5 = new JLabel("5");
        panel.add(pref5, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 4;
        JLabel pref5Wskaznik = new JLabel();
        panel.add(pref5Wskaznik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 4;
        JTextField pref5Data = new JTextField();
        panel.add(pref5Data, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 5;
        JLabel pref6 = new JLabel("6");
        panel.add(pref6, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 5;
        JLabel pref6Wskaznik = new JLabel();
        panel.add(pref6Wskaznik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 2;
        gbc.gridy = 5;
        JTextField pref6Data = new JTextField();
        panel.add(pref6Data, gbc);

        pracownikDataPanel.add(panel, BorderLayout.WEST);
        pracownikDataFrame.setVisible(true);
    }

    public void setGridBagMaturyLayout(){
        //Robimy dokładnie to samo co w GridBagPreferencjeLayout w PreferencjeKandydata
        //Tylko dokładamy wynik z egzaminu
        Panel panel = new Panel();
        panel.setSize(350, 400);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel polski = new JLabel("Język Polski: ");
        panel.add(polski, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField polskiWynik = new JTextField();
        panel.add(polskiWynik, gbc);
    }

}
