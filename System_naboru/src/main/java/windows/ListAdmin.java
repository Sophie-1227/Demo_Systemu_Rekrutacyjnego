package windows;


import datebase.DatebaseInterface;
import datebase.StatementCreator;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class ListAdmin {
    DatebaseInterface database;
    StatementCreator creator;

    final int smallYspacing = 20;

    private JFrame listAdminFrame;

    private JLabel listaAdminLabel;
    private JPanel listaAdminPanel;
    private JPanel mainListaPanel;

    public String[] listaKandydatow;

    JTextField fieldCode, facultyCode, fieldId;
    Choice type;
    JPanel listPanel;
    JList list;

    public ListAdmin(DatebaseInterface database, StatementCreator creator){
        this.database = database;
        this.creator = creator;
        prepareGUI();
    }

    private void prepareGUI(){
        listAdminFrame = new JFrame("Tworzenie List");
        listAdminFrame.setSize(700, 1000);
        listAdminFrame.setLayout(new GridLayout(3, 1));
        listAdminFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                listAdminFrame.dispose();
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        listaAdminLabel = new JLabel("Wpisz nazwe kierunku do stworzenia listy i typ listy");
        listaAdminLabel.setSize(700,200);
        listaAdminLabel.setAlignmentX(Label.CENTER);
        listaAdminLabel.setFont(font);
        listAdminFrame.add(listaAdminLabel);

        listaAdminPanel = new JPanel();
        listaAdminPanel.setLayout(new FlowLayout());
        setGridBagLayout();
        listAdminFrame.add(listaAdminPanel);

        mainListaPanel = new JPanel();
        mainListaPanel.setLayout(new FlowLayout());
        mainListaPanel.setSize(600, 500);
        mainListaPanel.setLayout(new BorderLayout(1, 1));
        mainListaPanel.add(new JLabel("Wyniki wyszukiwania: "), BorderLayout.NORTH);
        listAdminFrame.add(mainListaPanel);

        listAdminFrame.setVisible(true);
    }

    public void setGridBagLayout(){

        Panel panel = new Panel();
        panel.setSize(700, 100);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 0;
        gbc.gridy = 0;
        JLabel fieldCodeLabel = new JLabel("Kod kierunku: ");
        panel.add(fieldCodeLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 0;
        gbc.gridy = 1;
        fieldCode = new JTextField();
        panel.add(fieldCode, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JLabel facultyCodeLabel = new JLabel("Kod wydziału: ");
        panel.add(facultyCodeLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 1;
        gbc.gridy = 1;
        facultyCode = new JTextField();
        panel.add(facultyCode, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 2;
        gbc.gridy = 0;
        JLabel typeLabel = new JLabel("Typ listy: ");
        panel.add(typeLabel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 2;
        gbc.gridy = 1;
        type = new Choice();
        type.add("Alfabetyczna");
        type.add("Wskaznikiem");
        panel.add(type, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 3;
        gbc.gridy = 0;
        JLabel fieldIdLab = new JLabel("Id kierunku: ");
        panel.add(fieldIdLab, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 3;
        gbc.gridy = 1;
        fieldId = new JTextField();
        panel.add(fieldId, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = smallYspacing;
        gbc.gridx = 4;
        gbc.gridy = 1;
        JButton execute = new JButton("Stwórz");
        panel.add(execute, gbc);

        listaAdminPanel.add(panel);

        execute.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                updateList();
            }
        });
    }

    public void updateList(){
        //System.out.println("Updating list");
        mainListaPanel.removeAll();
        boolean ranked = type.getSelectedItem().equals("Wskaznikiem");
        listaKandydatow = creator.generateCandidateList(Integer.parseInt(fieldId.getText()), ranked);
        list = new JList<>(listaKandydatow);
        mainListaPanel.add(new JScrollPane(list), BorderLayout.CENTER);
        //hackermove
        listAdminFrame.setSize(listAdminFrame.getWidth()+1, listAdminFrame.getHeight());
        listAdminFrame.setSize(listAdminFrame.getWidth()-1, listAdminFrame.getHeight());
    }
}
