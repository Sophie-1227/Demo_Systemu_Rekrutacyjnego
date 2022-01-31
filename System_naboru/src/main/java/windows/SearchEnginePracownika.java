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
    private Frame pracownikSearchFrame;
    private Label headerLabelPracownikSearch;
    private Panel pracownikSearchPanel;
    public String[] listaKandydatow;
    DatebaseInterface datebase;
    StatementCreator creator;

    //deklaracje JTextFieldów
    JTextField pesel, name, sname, nrRej;
    JList list;
    JPanel panel;

    public SearchEnginePracownika(DatebaseInterface datebase, StatementCreator creator){
        this.datebase = datebase;
        this.creator = creator;
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        pracownikSearchFrame = new Frame("Search Engine");
        pracownikSearchFrame.setSize(700, 500);
        pracownikSearchFrame.setLayout(new GridLayout(3, 1));
        pracownikSearchFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelPracownikSearch = new Label();
        headerLabelPracownikSearch.setAlignment(Label.CENTER);
        headerLabelPracownikSearch.setFont(font);

        pracownikSearchPanel = new Panel();
        pracownikSearchPanel.setLayout(new FlowLayout());

        createPanelList();

        pracownikSearchFrame.add(headerLabelPracownikSearch);
        pracownikSearchFrame.add(pracownikSearchPanel);
        pracownikSearchFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelPracownikSearch.setText("Wpisz dane kandydata do wyszukania");

        Panel panel = new Panel();
        panel.setSize(700, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 0;

        JLabel nrRejLabel = new JLabel("Numer Rejestracyjny: ");
        panel.add(nrRejLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JLabel nameLabel = new JLabel("Imię: ");
        panel.add(pesel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 2;
        gbc.gridy = 0;
        JLabel snameLabel = new JLabel("Nazwisko: ");
        panel.add(snameLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 3;
        gbc.gridy = 0;
        JLabel peselLabel = new JLabel("Numer PESEL: ");
        panel.add(peselLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 0;
        gbc.gridy = 1;
        JTextField nrRej = new JTextField();
        nrRej.setPreferredSize(new Dimension(120, 40));
        panel.add(nrRej, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JTextField name = new JTextField();
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 2;
        gbc.gridy = 1;
        JTextField sname = new JTextField();
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 3;
        gbc.gridy = 1;
        JTextField pesel = new JTextField();

        panel.add(pesel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
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
        panel = new JPanel();
        panel.setSize(500, 300);
        panel.setLayout(new BorderLayout(1, 1));

        panel.add(new JLabel("Wyniki wyszukiwania: "), BorderLayout.NORTH);
    }

    public void updateList(){
        System.out.println("Updating list");
        panel.removeAll();
        listaKandydatow = creator.getMatchingCandidates(nrRej.getText(), name.getText(), sname.getText(), pesel.getText());
        list = new JList(listaKandydatow);
        panel.add(list, BorderLayout.CENTER);
        JList list = new JList(listaKandydatow);
        panel.add( list, BorderLayout.CENTER);
        pracownikSearchPanel.add(panel, BorderLayout.CENTER);
    }

    @Override
    public void valueChanged(ListSelectionEvent e) {
        String selected = list.getSelectedValue().toString();
        int idKand = Integer.parseInt(selected.split(" ")[0]);
        System.out.println(idKand);
    }
}
