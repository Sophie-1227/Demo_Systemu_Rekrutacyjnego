package windows;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class SearchEngineAdmin {
    private Frame adminSearchFrame;
    private Label headerLabelAdminSearch;
    private Panel adminSearchPanel;

    public SearchEngineAdmin(){
        prepareLogGUI();
    }

    private void prepareLogGUI(){
        adminSearchFrame = new Frame("Search Engine");
        adminSearchFrame.setSize(700, 500);
        adminSearchFrame.setLayout(new GridLayout(3, 1));
        adminSearchFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
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

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        Choice type = new Choice();
        type.add("Pracownik");
        type.add("Kandydat");
        //type.setPreferredSize(new Dimension(70, 40));
        panel.add(type, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 1;
        gbc.gridy = 0;
        JTextField nrRej = new JTextField("Id");
        nrRej.setPreferredSize(new Dimension(120, 40));
        panel.add(nrRej, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 2;
        gbc.gridy = 0;
        JTextField name = new JTextField("Imię      ");
        name.setPreferredSize(new Dimension(120, 40));
        panel.add(name, gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 3;
        gbc.gridy = 0;
        JTextField sname = new JTextField("Nazwisko");
        sname.setPreferredSize(new Dimension(120, 40));
        panel.add(sname, gbc);

        /*gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 3;
        gbc.gridy = 0;
        JTextField pesel = new JTextField("PESEL");
        panel.add(pesel, gbc);*/

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.gridx = 4;
        gbc.gridy = 0;
        JButton exec = new JButton("Wykonaj");
        panel.add(exec, gbc);

        exec.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        //Wykonanie kweredny sql do wyszukiwania danych kandydata
                        adminSearchFrame.setVisible(false);
                    }
                }
        );

        /*gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.ipady = 20;
        gbc.ipadx = 700;
        gbc.gridx = 0;
        gbc.gridy = 2;
        JTextField data = new JTextField("");
        //data.setPreferredSize(new Dimension(700, 300));
        panel.add(data);*/

        adminSearchPanel.add(panel);
        adminSearchFrame.setVisible(true);

    }

}
