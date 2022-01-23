package main.java;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class SearchEnginePracownika {
    private Frame pracownikSearchFrame;
    private Label headerLabelPracownikSearch;
    private Panel pracownikSearchPanel;

    public SearchEnginePracownika(){
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        pracownikSearchFrame = new Frame("Search Engine");
        pracownikSearchFrame.setSize(700, 500);
        pracownikSearchFrame.setLayout(new GridLayout(2, 1));
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
        gbc.gridx = 0;
        gbc.gridy = 0;
        JTextField nrRej = new JTextField("Numer Rejestracyjny");
        nrRej.setPreferredSize(new Dimension(120, 40));
        panel.add(nrRej, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField name = new JTextField("Imię      ");
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 2;
        gbc.gridy = 0;
        JTextField sname = new JTextField("Nazwisko");
        panel.add(sname, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 3;
        gbc.gridy = 0;
        JTextField pesel = new JTextField("PESEL");
        panel.add(pesel, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 1;
        gbc.gridy = 1;
        JButton exec = new JButton("Wykonaj");
        panel.add(exec, gbc);

        exec.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        //Wykonanie kweredny sql do wyszukiwania danych kandydata
                        pracownikSearchFrame.setVisible(false);
                    }
                }
        );

        pracownikSearchPanel.add(panel);
        pracownikSearchFrame.setVisible(true);

    }

}
