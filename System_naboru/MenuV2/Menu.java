package main.java;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

import static java.awt.Font.BOLD;
import static java.awt.Font.ITALIC;

public class Menu {
    private Frame mainFrame;
    private Label headerLabel;
    private Panel controlPanel;

    public Menu(){
        prepareGUI();
    }

    public static void main(String[] args){
        Menu menu = new Menu();
        menu.showGridBagLayout();
    }

    private void prepareGUI(){
        mainFrame = new Frame("Rekrutacja DEMO");
        mainFrame.setSize(700,500);
        mainFrame.setLayout(new GridLayout(3, 1));
        mainFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        headerLabel = new Label();
        headerLabel.setAlignment(Label.CENTER);
        headerLabel.setFont(font);

        controlPanel = new Panel();
        controlPanel.setLayout(new FlowLayout());

        mainFrame.add(headerLabel);
        mainFrame.add(controlPanel);
        mainFrame.setVisible(true);
    }

    private void showGridBagLayout(){
        headerLabel.setText("Choose access level to log in");

        Panel panel = new Panel();
        //panel.setBackground(Color.RED);
        panel.setSize(300,100);
        GridBagLayout layout = new GridBagLayout();

        panel.setLayout(layout);
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridheight = 20;
        JButton kandydat = new JButton(new ImageIcon("C:\\Users\\zstyp\\Downloads\\kandydat.png"));
        kandydat.setPreferredSize(new Dimension(100, 100));
        panel.add(kandydat, gbc);
        //panel.add(new Button("KANDYDAT"),gbc);

        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.gridheight = 2;
        JButton pracownik = new JButton(new ImageIcon("C:\\Users\\zstyp\\Downloads\\pracownik.png"));
        pracownik.setPreferredSize(new Dimension(100, 100));
        panel.add(pracownik, gbc);
        //panel.add(new Button("PRACOWNIK"),gbc);

        gbc.fill = GridBagConstraints.HORIZONTAL;
        //gbc.ipady = 20;
        gbc.gridx = 2;
        gbc.gridy = 0;
        gbc.gridheight = 2;
        JButton admin = new JButton(new ImageIcon("C:\\Users\\zstyp\\Downloads\\adminn.png"));
        admin.setPreferredSize(new Dimension(100, 100));
        panel.add(admin, gbc);
        //panel.add(new Button("ADMINISTRATOR"),gbc);

        kandydat.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        //Otwieranie okna do logowania kandydata
                        Log kandydat = new Log();
                        kandydat.setGridBagLayout();
                        mainFrame.setVisible(false);
                    }
                }
        );

        pracownik.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        //Otwieranie okna do logowania pracownika
                        Log pracownik = new Log();
                        pracownik.setGridBagLayout();
                        mainFrame.setVisible(false);
                    }
                }
        );

        admin.addActionListener(
                new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        //Otwieranie okna do logowania admina
                        Log admin = new Log();
                        admin.setGridBagLayout();
                        mainFrame.setVisible(false);
                    }
                }
        );

        controlPanel.add(panel);

        mainFrame.setVisible(true);
    }
}
