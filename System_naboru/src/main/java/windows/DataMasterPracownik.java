package windows;

import datebase.DatebaseInterface;
import datebase.StatementCreator;


import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class DataMasterPracownik {
    final int smallYspacing = 20;
    final int smallXspacing = 50;

    private JFrame pracownikDataFrame;
    private Label headerLabelPracownikData;
    private Panel pracownikDataPanel;
    DatebaseInterface datebase;
    StatementCreator creator;
    int idKand;

    public DataMasterPracownik(DatebaseInterface datebase, StatementCreator creator, int idKand){
        this.datebase = datebase;
        this.creator = creator;
        this.idKand = idKand;
        prepareGUI();
        setGridBagDataLayout();
        setGridBagMaturyLayout();
        setGridBagPreferencjeLayout();
    }

    private void prepareGUI(){
        pracownikDataFrame = new JFrame("Dane kandydata");
        pracownikDataFrame.setSize(700, 500);
        //pracownikDataFrame.setLayout(new GridLayout(3, 1));
        pracownikDataFrame.setLayout(new BorderLayout());
        pracownikDataFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
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

        String[] candData = creator.getUserInfo(idKand);

        Panel panel = new Panel();
        panel.setSize(700, 100);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel name = new JLabel("Imię: ");
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.ipadx = smallXspacing;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JLabel sname = new JLabel("Nazwisko: ");
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.ipadx = smallXspacing;
        gbc.gridx = 2;
        gbc.gridy = 0;
        JLabel pesel = new JLabel("PESEL: ");
        panel.add(pesel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.ipadx = smallXspacing;
        gbc.gridx = 3;
        gbc.gridy = 0;
        JLabel status = new JLabel("Status: ");
        panel.add(status, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.ipadx = smallXspacing;
        gbc.gridx = 4;
        gbc.gridy = 0;
        JLabel olimp = new JLabel("Czy Olimpijczyk: ");
        panel.add(olimp, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JTextField nameData = new JTextField(candData[1]);
        panel.add(nameData, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JTextField snameData = new JTextField(candData[2]);
        panel.add(snameData, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 2;
        gbc.gridy = 1;
        JTextField peselData = new JTextField(candData[3]);
        panel.add(peselData, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 3;
        gbc.gridy = 1;
        Choice statusData = new Choice();
        statusData.add("Oczekuje na oplate");
        statusData.add("Zlozono dokumenty");
        statusData.add("Przyjety");
        statusData.add("Odrzucony");
        statusData.add("Nieprzyjety");
        statusData.add("Wniesiono oplate");
        statusData.add("Zakwalifikowany do przyjecia");
        statusData.select(candData[4]);
        //type.setPreferredSize(new Dimension(70, 40));
        panel.add(statusData, gbc);

        /*gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 4;
        gbc.gridy = 0;
        JTextField ewidencja data = new JTextField("Ewidencja");
        listPanel.add(ewidencja, gbc);*/

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 4;
        gbc.gridy = 1;
        Choice olimpData = new Choice();
        olimpData.add("TAK");
        olimpData.add("NIE");
        if(candData[6].equals("1")) olimpData.select("TAK");
        else olimpData.select("NIE");
        panel.add(olimpData, gbc);

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

        String[] maturaResults = creator.getMaturaResults(idKandydata, 11);

        //Do dodania pola tekstowe + label do każdego przedmiotu
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady=smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel polski = new JLabel("J.Polski Podstawowy");
        panel.add(polski, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField polskiWynik = new JTextField(maturaResults[1]);
        panel.add(polskiWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JLabel matPodstawa = new JLabel("Matematyka Podstawowa");
        panel.add(matPodstawa, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JTextField matPodstWynik = new JTextField(maturaResults[2]);
        panel.add(matPodstWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JLabel matRozszerzenie = new JLabel("Matematyka Rozszerzenie");
        panel.add(matRozszerzenie, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 2;
        JTextField matRozWynik = new JTextField(maturaResults[3]);
        panel.add(matRozWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 3;
        JLabel jezykPodstawa = new JLabel("J.Obcy Podstawowy");
        panel.add(jezykPodstawa, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 3;
        JTextField jezykPodstWynik = new JTextField(maturaResults[4]);
        panel.add(jezykPodstWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 4;
        JLabel jezykRozszerzenie = new JLabel("J.Obcy Rozszerzenie");
        panel.add(jezykRozszerzenie, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 4;
        JTextField jezykRozWynik = new JTextField(maturaResults[5]);
        panel.add(jezykRozWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 5;
        JLabel fizyka = new JLabel("Fizyka");
        panel.add(fizyka, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 5;
        JTextField fizykaWynik = new JTextField(maturaResults[6]);
        panel.add(fizykaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 6;
        JLabel chemia = new JLabel("Chemia");
        panel.add(chemia, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 6;
        JTextField chemiaWynik = new JTextField(maturaResults[7]);
        panel.add(chemiaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 7;
        JLabel biologia = new JLabel("Biologia");
        panel.add(biologia, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 7;
        JTextField biologiaWynik = new JTextField(maturaResults[8]);
        panel.add(biologiaWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 8;
        JLabel inf = new JLabel("Informatyka");
        panel.add(inf, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 8;
        JTextField infWynik = new JTextField(maturaResults[9]);
        panel.add(infWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 9;
        JLabel geo = new JLabel("Geografia");
        panel.add(geo, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 9;
        JTextField geoWynik = new JTextField(maturaResults[10]);
        panel.add(geoWynik, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallPaddingY;
        gbc.gridx = 0;
        gbc.gridy = 10;
        JLabel egzamin = new JLabel("Egzamin z Rysunku");
        panel.add(egzamin, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 1;
        gbc.gridy = 10;
        JTextField egzaminWynik = new JTextField(maturaResults[11]);
        panel.add(egzaminWynik, gbc);

        gbc.fill = GridBagConstraints.SOUTH;
        gbc.ipady = smallPaddingY;
        gbc.gridy = 11;
        JButton confirm = new JButton("Zatwierdz");
        confirm.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        //Przeslanie wpisanych wartosci do bazy danych
                        int[] results = new int[10];
                        results[0] = Integer.parseInt(polskiWynik.getText());
                        results[1] = Integer.parseInt(matPodstWynik.getText());
                        results[2] = Integer.parseInt(matRozWynik.getText());
                        results[3] = Integer.parseInt(jezykPodstWynik.getText());
                        results[4] = Integer.parseInt(jezykRozWynik.getText());
                        results[5] = Integer.parseInt(fizykaWynik.getText());
                        results[6] = Integer.parseInt(chemiaWynik.getText());
                        results[7] = Integer.parseInt(biologiaWynik.getText());
                        results[8] = Integer.parseInt(infWynik.getText());
                        results[9] = Integer.parseInt(geoWynik.getText());
                        results[10] = Integer.parseInt(egzaminWynik.getText());
                        if(creator.updateMaturaResults(results, idKandydata)){
                            showMessageDialog(preferencjeKandydatFrame, "Poprawnie zaktualizowano wyniki matur");
                        } else{
                            showMessageDialog(preferencjeKandydatFrame, "Wystąpił błąd podczas aktualizacji wyników matur");
                        }
                    }
                }
        );

        panel.add(confirm, gbc);
        pracownikDataPanel.add(panel);
        pracownikDataFrame.setVisible(true);
    }


}
