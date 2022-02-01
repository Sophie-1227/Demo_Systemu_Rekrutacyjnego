package windows;

public class ListAdmin {
    DatabaseInterface database;
    StatmentCreator creator;

    private JFrame listAdminFrame;
    private JLabel listaAdminLabel;
    private JPanel listaAdminPanel;
    private JPanel mainListaPanel;
    public String[] listaKandydatow;

    JTextField fieldCode, facultyCode;
    Choice type;
    JPanel listPanel;

    public ListaAdmin(){
        this.database = database;
        this.creator = creator;
        prepareGUI();
    }

    private void prepareGUI(){
        listAdminFrame = new  JFrame("Tworzenie List");
        listaAdminFrame.setSize(700, 600);
        listaAdminFrame.setLayout(new GridLayout(3, 1));
        listaAdminFrame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent windowEvent){
                System.exit(0);
            }
        });
        Font font = new Font("Modern Love", BOLD & ITALIC, 30);
        listaAdminLabel = new JLabel();
        listaAdminLabel.setSize(700,200);
        listaAdminLabel.setAlignment(Label.CENTER);
        listaAdminLabel.setFont(font);

        listaAdminPanel = new JPanel();
        listaAdminPanel.setLayout(new FlowLayout());
        mainListaPanel = new JPanel();
        mainListaPanel.setLayout(new FlowLayout());
        createPanelList();

        listaAdminFrame.add(listaAdminLabel);
        listaAdminFrame.add(listaAdminPanel);
        listaAdminFrame.add(mainListaPanel);
        listaAdminFrame.setVisible(true);
    }

    public void setGridBagLayout(){
        listaAdminlabel.setText("Wpisz nazwe kierunku do stworzenia listy i typ listy");

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
        gbc.gridx = 1;
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
        panel.add(type, gbc)
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
        listaKandydatow = creator;

        list = new JList<>(listaKandydatow);
        list.addListSelectionListener(this);
        listPanel.add(new JScrollPane(list), BorderLayout.CENTER);
        mainListaPanel.add(listPanel, BorderLayout.CENTER);
        //hackermove
        pracownikSearchFrame.setSize(pracownikSearchFrame.getWidth()+1, pracownikSearchFrame.getHeight());
        pracownikSearchFrame.setSize(pracownikSearchFrame.getWidth()-1, pracownikSearchFrame.getHeight());
    }
}
