package windows;

import datebase.DatebaseInterface;
import datebase.StatementCreator;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.plaf.nimbus.State;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class SearchEngineAdmin implements ListSelectionListener {

    DatebaseInterface datebase;
    StatementCreator creator;

    private Frame adminSearchFrame;
    private Label headerLabelAdminSearch;
    private Panel adminSearchPanel;
    private Panel mainListPanel;

    int smallYspacing = 20;
    int smallXspacing = 50;
    JTextField name, sname, Id, office;
    JPanel listPanel;
    String[] listaPracownikow;
    JList<String> list;

    public SearchEngineAdmin(DatebaseInterface datebase, StatementCreator creator) {
        this.datebase = datebase;
        this.creator = creator;
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        adminSearchFrame = new Frame("Search Engine");
        adminSearchFrame.setSize(700, 500);
        adminSearchFrame.setLayout(new GridLayout(3, 1));
        adminSearchFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                adminSearchFrame.dispose();
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabelAdminSearch = new Label();
        headerLabelAdminSearch.setAlignment(Label.CENTER);
        headerLabelAdminSearch.setFont(font);

        adminSearchPanel = new Panel();
        adminSearchPanel.setLayout(new FlowLayout());

        adminSearchFrame.add(headerLabelAdminSearch);
        adminSearchFrame.add(adminSearchPanel);

        JTextField data = new JTextField();
        data.setAlignmentX(350);
        adminSearchFrame.add(data);

        adminSearchFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        headerLabelAdminSearch.setText("Wpisz dane do wyszukania");

        Panel panel = new Panel();
        panel.setSize(700, 300);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

            //Search for Pracownik
            gbc.fill = GridBagConstraints.HORIZONTAL;
            gbc.ipady = smallYspacing;
            gbc.ipadx = smallXspacing;
            gbc.gridx = 0;
            gbc.gridy = 0;
            JLabel IdWorkerLabel = new JLabel("Id Pracownika: ");
            panel.add(IdWorkerLabel, gbc);

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
            JLabel officeLabel = new JLabel("Jednostka: ");
            panel.add(officeLabel, gbc);

            gbc.fill = GridBagConstraints.HORIZONTAL;
            gbc.ipady = smallYspacing;
            gbc.gridx = 0;
            gbc.gridy = 1;
            Id = new JTextField();
            panel.add(Id, gbc);

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
            office = new JTextField();
            panel.add(office, gbc);

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

                    }
                }
        );

        adminSearchPanel.add(panel);
        adminSearchFrame.setVisible(true);

    }

    public void createPaneList(){
        listPanel = new JPanel();
        listPanel.setSize(600, 500);
        listPanel.setLayout(new BorderLayout(1, 1));
        listPanel.add(new JLabel("Wyniki wyszukiwania: "), BorderLayout.NORTH);
    }

    public void updateWorkerList(String[] contents){
        listPanel.removeAll();

        list = new JList<>(listaPracownikow);
        list.addListSelectionListener(this);
        listPanel.add(new JScrollPane(list), BorderLayout.CENTER);
        mainListPanel.add(listPanel, BorderLayout.CENTER);

        adminSearchFrame.setSize(adminSearchFrame.getWidth()+1, adminSearchFrame.getHeight());
        adminSearchFrame.setSize(adminSearchFrame.getWidth()-1, adminSearchFrame.getHeight());
    }

    @Override
    public void valueChanged(ListSelectionEvent e) {

    }
}
