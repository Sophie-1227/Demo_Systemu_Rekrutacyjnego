package windows;

import datebase.DatebaseInterface;
import datebase.StatementCreator;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class SearchEnginePracownika implements ListSelectionListener {

    final int smallYspacing = 20;
    final int smallXspacing = 50;

    private Frame pracownikSearchFrame;
    private Label headerLabelPracownikSearch;
    private Panel pracownikSearchPanel;
    private Panel mainListaPanel;
    public String[] listaKandydatow;
    DatebaseInterface datebase;
    StatementCreator creator;

    //deklaracje JTextFieldów
    JTextField pesel, name, sname, nrRej;
    JList<String> list;
    JPanel listPanel;

    int idKand = -1;

    public SearchEnginePracownika(DatebaseInterface datebase, StatementCreator creator){
        this.datebase = datebase;
        this.creator = creator;
        prepareLogGUI();
        setGridBagLayout();
    }

    private void prepareLogGUI(){
        pracownikSearchFrame = new Frame("Search Engine");
        pracownikSearchFrame.setSize(700, 600);
        pracownikSearchFrame.setLayout(new GridLayout(3, 1));
        pracownikSearchFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelPracownikSearch = new Label();
        headerLabelPracownikSearch.setSize(700,200);
        headerLabelPracownikSearch.setAlignment(Label.CENTER);
        headerLabelPracownikSearch.setFont(font);

        pracownikSearchPanel = new Panel();
        pracownikSearchPanel.setLayout(new FlowLayout());
        mainListaPanel = new Panel();
        mainListaPanel.setLayout(new FlowLayout());
        createPanelList();

        pracownikSearchFrame.add(headerLabelPracownikSearch);
        pracownikSearchFrame.add(pracownikSearchPanel);
        pracownikSearchFrame.add(mainListaPanel);
        pracownikSearchFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelPracownikSearch.setText("Wpisz dane kandydata do wyszukania");

        Panel panel = new Panel();
        panel.setSize(700, 100);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel nrRejLabel = new JLabel("Numer Rejestracyjny: ");
        panel.add(nrRejLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.ipadx = smallXspacing;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JLabel nameLabel = new JLabel("Imię: ");
        panel.add(nameLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.ipadx = smallXspacing;
        gbc.gridx = 2;
        gbc.gridy = 0;
        JLabel snameLabel = new JLabel("Nazwisko: ");
        panel.add(snameLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.ipadx = smallXspacing;
        gbc.gridx = 3;
        gbc.gridy = 0;
        JLabel peselLabel = new JLabel("Numer PESEL: ");
        panel.add(peselLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 0;
        gbc.gridy = 1;
        nrRej = new JTextField();
        panel.add(nrRej, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 1;
        gbc.gridy = 1;
        name = new JTextField();
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 2;
        gbc.gridy = 1;
        sname = new JTextField();
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 3;
        gbc.gridy = 1;
        pesel = new JTextField();
        panel.add(pesel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 4;
        gbc.gridy = 1;
        JButton exec = new JButton("Wykonaj");
        panel.add(exec, gbc);

        exec.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        //Wykonanie kweredny sql do wyszukiwania danych kandydata
                        updateList();
                    }
                }
        );
        pracownikSearchPanel.add(panel);
        pracownikSearchFrame.setVisible(true);
    }

    public void createPanelList(){
        listPanel = new JPanel();
        listPanel.setSize(600, 500);
        listPanel.setLayout(new BorderLayout(1, 1));
        listPanel.add(new JLabel("Wyniki wyszukiwania: "), BorderLayout.NORTH);
    }

    public void updateList(){
        System.out.println("Updating list");
        listPanel.removeAll();
        listaKandydatow = creator.getMatchingCandidates(nrRej.getText(), name.getText(), sname.getText(), pesel.getText());

        list = new JList<>(listaKandydatow);
        list.addListSelectionListener(this);
        listPanel.add(new JScrollPane(list), BorderLayout.CENTER);
        mainListaPanel.add(listPanel, BorderLayout.CENTER);
        //hackermove
        pracownikSearchFrame.setSize(pracownikSearchFrame.getWidth()+1, pracownikSearchFrame.getHeight());
        pracownikSearchFrame.setSize(pracownikSearchFrame.getWidth()-1, pracownikSearchFrame.getHeight());
    }

    @Override
    public void valueChanged(ListSelectionEvent e) {
        String selected = list.getSelectedValue().toString();
        int temp = Integer.parseInt(selected.split(" ")[0]);
        if(idKand != temp) {
            idKand = temp;
            new DataMasterPracownik(datebase, creator, idKand);
        }

        //System.out.println(idKand);
    }
}
