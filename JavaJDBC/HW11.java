/*
 * Michael Gordon HW11 Due April 16st, 2018 Section:7776
 */

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.*;
import java.util.ArrayList;
public class HW11
{
    public static void main(String[] args) {
      MainMenu frame = new MainMenu();
      frame.setVisible(true);
   }
}

class DBConnection {

  private static final String JDBC_DRIVER = "org.mysql.jdbc.Driver";
  private static final String LOCAL_HOST = "jdbc:mariadb://localhost:3306/";

  private String db;
  private String username;
  private String password;
  // private Statement statement;
  private PreparedStatement preparedStatement;
  private Connection connection;

  public DBConnection() {
    this.db = "festive";
    this.username = "root";
    this.password = "root";
  }
  
   public DBConnection(String database) {
    this.db = database;
    this.username = "root";
    this.password = "root";
  }

  public DBConnection( String db, String username, String password ) {
    this.db = db;
    this.username = username;
    this.password = password;
  }

    
  public boolean openConnection( ) {
      boolean result = false;

    try {
      connection = DriverManager.getConnection( LOCAL_HOST + db, username, password );
      System.out.println( db + " connected." );
      System.out.println();
      
      // statement = connection.createStatement();
      
      result = true;
    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();
    }
    
    return result;
  }
  
  public DatabaseMetaData getMetaData() throws SQLException
  {
     DatabaseMetaData data = null;
     try {
      data = connection.getMetaData();
    }catch ( SQLException sqle ) { sqle.printStackTrace();
    }
    return data;
    }
    
  public ResultSet query( String sql, String args[] ) throws SQLException {
    ResultSet rs = null;
    int i;

    try {
      // rs = statement.executeQuery( sql );
      
      preparedStatement = connection.prepareStatement( sql );
      
      if ( args != null ) {
        for ( i = 0; i < args.length; i++ ) {
          preparedStatement.setString( ( i + 1 ), args[i] );
        }
      }
      
      rs = preparedStatement.executeQuery();
    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();

    }

    return rs;
  }
 
  public int update( String sql ) {
    int result = 0;

    try {
      // result = statement.executeUpdate( sql );
      
      preparedStatement = connection.prepareStatement( sql );
      result = preparedStatement.executeUpdate();
    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();
      
    }

    return result;
  }
  public void closeConnection() {
    try {
      if ( connection != null ) {
        connection.close();
      }
    }
    catch ( SQLException sqle ) {
      sqle.printStackTrace();
    }
  }
}


class MainMenu extends JFrame
{
    private JButton buttonRelations, buttonValues, buttonDelete, buttonUpdate, buttonCommand, buttonExit;
    private JPanel panel2, panel3, panel4, panel5, panel6, panelForm, panelForm2;
    DBConnection dbc = new DBConnection("Mall");
    private String currSql = "";
    private ResultSet rs;
    private ArrayList<String> columns = new ArrayList<String>();
    private ArrayList<String> relations = new ArrayList<String>();
    private ArrayList<HintTextField> fields = new ArrayList<HintTextField>();

    /**
     * Constructor for objects of class MainMenu
     */
    public MainMenu()
    {
        createView();
        setTitle("Mall Database");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(new Dimension(1200,800));
        setLocationRelativeTo(null);
        setResizable(false);
        pack();
        addWindowListener(new WindowAdapter()
            {
                public void windowClosing(WindowEvent e)
                {
                    exit();//preforms exit to ensure db connection closes
                }
            });
    }

    private void createView()
    {
        JPanel panel = new JPanel();
        panel2 = new JPanel(new GridBagLayout());
        panel3 = new JPanel();
        panel4 = new JPanel(new GridBagLayout());
        panel5 = new JPanel(new GridBagLayout());
        panel6 = new JPanel();
        panelForm = new JPanel();
        panelForm2 = new JPanel(new GridBagLayout());
        GridBagConstraints c = new GridBagConstraints();
        c.gridx = 0;
        c.gridy = 0;
        panelForm.add(panel2);
        panelForm.add(panel5);
        panelForm2.add(panel6,c);
        c.gridy++;
        panelForm2.add(panel4,c);
        getContentPane().add(panelForm, BorderLayout.WEST);
        getContentPane().add(panel,BorderLayout.NORTH);
        getContentPane().add(panelForm2,BorderLayout.CENTER);
        getContentPane().add(panel3,BorderLayout.SOUTH);

        dbc.openConnection();
        buttonRelations = new JButton("Show/Hide Tables");
        buttonRelations.addActionListener(new ButtonRelationsActionListener("Show"));
        buttonDelete = new JButton("Delete values");
        buttonDelete.addActionListener(new ButtonRelationsActionListener("Delete"));
        buttonValues = new JButton("Insert values");
        buttonValues.addActionListener(new ButtonRelationsActionListener("Insert"));
        buttonUpdate = new JButton("Update values");
        buttonUpdate.addActionListener(new ButtonRelationsActionListener("Update"));
        buttonCommand = new JButton("Enter SQL Command");
        buttonCommand.addActionListener(new ButtonCommandActionListener());
        buttonExit = new JButton("Exit program(closes DB connection)");
        buttonExit.addActionListener(new ButtonExitActionListener());
        panel.add(buttonRelations);
        panel.add(buttonDelete);
        panel.add(buttonValues);
        panel.add(buttonUpdate);
        panel.add(buttonCommand);
        panel.add(buttonExit);

    }

    private void exit()
    {
        dbc.closeConnection();
        System.exit(0);
    }

    private void printQuery(String sql)
    {
        if(panel4 != null)
        {
            panel4.removeAll();
        }

        JLabel sqlPrint = new JLabel("SQL query: " + sql);
        GridBagConstraints c = new GridBagConstraints();//sets up assignment gui appearance
        c.gridx = 0;
        c.gridy = 0;
        panel4.add(sqlPrint,c);
        c.gridy++;
        String[] colNames; //array to hold the names of the columns
        String[][] data;// holds all the data from each row
        try {
            rs = dbc.query(sql, null );
            ResultSetMetaData rsmd = rs.getMetaData();//needed for column size
            int columnsNumber = rsmd.getColumnCount();//col size
            colNames = new String[columnsNumber];
            for(int i = 1; i <= columnsNumber; i++)
                colNames[i-1] = rsmd.getColumnName(i);//gets all the column names
            rs.last();//goes to last element
            int numRows = rs.getRow();//gets row size
            int j = 0;//intilalized for cols of 2d array
            data = new String[numRows][columnsNumber];
            rs.beforeFirst();//goes back to start off  resultSet
            while (rs.next()) {

                for(int i = 1; i <= columnsNumber; i++)
                    data[j][i-1] = rs.getString(i);//putting all the data in the 2d array
                j++;
            }
            JTable jt = new JTable(data, colNames);//creating table for gui
            JLabel label = new JLabel("Query Results:");
            panel4.add(label,c);
            c.gridy++;

            jt.setPreferredScrollableViewportSize(new Dimension(450,450));
            jt.setFillsViewportHeight(true);
            JScrollPane jps = new JScrollPane(jt, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
            jt.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
            //jps.setHorizontalScrollEnabled(true);
            panel4.add(jps,c);
        } catch (SQLException sqle ) {
            sqle.printStackTrace(System.out);
            System.out.println(sqle.getMessage());
        }

        revalidate();
        repaint();//data displayed
        pack();

    }
    
    private  String constructSql(ArrayList<HintTextField> tempFields, String first, String second, boolean test)
    {
        String sql3 = "";
        if(!tempFields.isEmpty())
        {
            boolean notFirst2 = false;
            for(HintTextField h : tempFields)
            {
                if(h.getText().isEmpty() || h.getFieldVar() == null){
                    if(!test)
                    {
                        JOptionPane.showMessageDialog(null, "Error you left a field blank!!!!");
                        return "error";
                    }
                    continue;
                }

                if(notFirst2){
                    sql3 += first;
                } else {
                    sql3 += second;
                    notFirst2 = true;
                }
                if(h.getType() == 12 || h.getType() == 91 )
                {
                    if(test)
                        sql3 += h.getFieldVar() + h.getQualifer() + "'" + h.getText() + "'";//delete,update
                    else
                        sql3 += "'" + h.getText() + "'"; 

                }
                else if(h.getType() == 8 || h.getType() == 4 || h.getType() == 3)
                {
                    try
                    {
                        Float.parseFloat(h.getText());
                    } 
                    catch (NumberFormatException d)
                    {
                        JOptionPane.showMessageDialog(null, "Error! A value you enter is not the proper type!");
                        return "error";
                    }
                    if(test)
                        sql3 += h.getFieldVar() + h.getQualifer() + "" + h.getText() + "";
                    else
                        sql3 += h.getText(); 
                }
            }

        }
        return sql3;
    }


    private void createField(int type, boolean search, GridBagConstraints c2, String fieldName)
    {
        ArrayList<HintTextField> tempFields = new ArrayList<HintTextField>();
        if(type == 12)
        {
            HintTextField stringField = new HintTextField("Enter string",type, "=");
            stringField.setPreferredSize(new Dimension(105,20));
            tempFields.add(stringField);
            panel5.add(stringField,c2);
            c2.gridx = 0;
        }else if(type == 91)
        {
            HintTextField stringField = new HintTextField("Enter YYYY-MM-DD",type, "=");
            stringField.setPreferredSize(new Dimension(105,20));
            tempFields.add(stringField);
            panel5.add(stringField,c2);
            c2.gridx = 0;
        }
        else if (type == 4 || type == 8 || type == 3)
        {
            if(search)
            {
                HintTextField minField = new HintTextField("Min",type, ">");
                minField.setPreferredSize(new Dimension(55,20));
                fields.add(minField);
                tempFields.add(minField);
                panel5.add(minField,c2);
                c2.gridx++;
                HintTextField maxField = new HintTextField("Max",type, "<");
                maxField.setPreferredSize(new Dimension(55,20));
                tempFields.add(maxField);
                panel5.add(maxField,c2);
                c2.gridx++;
                HintTextField exactField = new HintTextField("Exact",type, "=");
                exactField.setPreferredSize(new Dimension(55,20));
                tempFields.add(exactField);
                panel5.add(exactField,c2);
                c2.gridx = 0;
            } else
            {
                HintTextField minField = new HintTextField("Enter Value",type, "");
                minField.setPreferredSize(new Dimension(105,20));
                fields.add(minField);
                tempFields.add(minField);
                panel5.add(minField,c2);
                c2.gridx++; 
                c2.gridx = 0;
            }
        }

        for(HintTextField h : tempFields)
        {
            h.setFieldVar(fieldName);
            if(!fields.contains(h))
                fields.add(h);

        }

    }

    private class ButtonExitActionListener implements ActionListener
    {
        public void actionPerformed(ActionEvent e)

        {
            exit();
        }
    }

    private class ButtonRelationsActionListener implements ActionListener
    {
        private String actionType;
        public ButtonRelationsActionListener(String actionType)
        {
            this.actionType = actionType;
        }

        public void actionPerformed(ActionEvent e)

        {
            if(panel3 != null)
            {
                panel3.removeAll();

            }
            if(panel4 != null)
            {
                panel4.removeAll();

            }
            if(panel5 != null)
            {
                panel5.removeAll();
            }
            if(panel6 != null)
            {
                panel6.removeAll();
            }
            if(actionType.equals("Show"))
                            {
                                panel6.add(new JLabel("Only checked columns will be listed in the results but conditions on columns will still be applied if entered. \n Selecting multiple tables will display the entries from both tables where common columns are matched."));
                            } 
                            else if(actionType.equals("Insert"))
                            {
                                panel6.add(new JLabel("Only one table may be selected when inserting. Please enter fill out all fields."));
                            }else if(actionType.equals("Update"))
                            {
                                panel6.add(new JLabel("Only one table may be selected when updating. You will be prompted to enter the values to set to after presssing submit. \n If no conditions are entered, all tuples in the table will be updated."));
                            }else if(actionType.equals("Delete"))
                            {
                                panel6.add(new JLabel("Only one table may be selected when deleting! Deletion is permant so be careful! If no conditions  are applied, then all tuples will be deleted from a table!!"));
                            }
                            
            if(panel2.getComponentCount() == 0){
                GridBagConstraints c1 = new GridBagConstraints();
                c1.gridx = 0;
                c1.gridy = 0;
                panel2.add(new JLabel(actionType + " From Tables:"),c1);
                c1.gridy++;
                try {
                    rs = dbc.getMetaData().getTables(null, null, "%", new String[]{"TABLE"});//grabs relations from database
                    while (rs.next()) {
                        String result = rs.getString("TABLE_NAME");//gets relation mae
                        JCheckBox curr = new JCheckBox(result);//creates a checkbox for user to select
                        panel2.add(curr,c1);
                        c1.gridy++;
                        if(actionType.equals("Show"))
                        {
                            
                                
                                curr.addActionListener(new ActionListener() {  //if(type.equals("Show"))
                                    public void actionPerformed(ActionEvent e)//Creating action for when user clicks checkbox

                                    {
                                        if(curr.isSelected() == true){//checks if checkbox was just selcted
                                            if(relations.size() < 3)
                                            {
                                                relations.add(result + " " + ((char)(relations.size()+65)));// adds relation name to reference array  appended with a character name for query use
                                                columns.clear();//clears columns array as it will need to be updated based on the new relations selected.
                                                fields.clear();
                                                currSql = "";
                                            } else  {
                                                JOptionPane.showMessageDialog(null, "Sorry due to memory contraints you cannot select more than 3 table at a time.");
                                                curr.setSelected(false);
                                            } 
                                        } else{
                                            for(int k = 0 ; k < relations.size(); k++)//removes relation from reference array
                                            {
                                                if(relations.get(k).substring(0,relations.get(k).length() - 2).equals(result))
                                                {
                                                    relations.remove(k);
                                                    break;
                                                }
                                            }

                                            for(int k = 0 ; k < relations.size(); k++)// Renames relations for query usage. Since size < 3 names will be appended with A or B
                                            {
                                                relations.set(k, (relations.get(k).substring(0,relations.get(k).length() - 2) + " " + ((char)(k+65))));
                                            }

                                            columns.clear();//clear columns
                                            fields.clear();
                                            currSql = "";
                                            if(relations.isEmpty())//fixs gui to remove columns panel if all relations deslected.
                                            {
                                                panel5.removeAll();
                                                revalidate();
                                                repaint();
                                                return;
                                            }
                                        }
                                        //fixing gui
                                        if(panel4 != null)
                                        {
                                            panel4.removeAll();
                                        }
                                        if(panel5 != null)
                                        {
                                            panel5.removeAll();
                                        }

                                        GridBagConstraints c2 = new GridBagConstraints();//for gui layout
                                        c2.gridx = 0;
                                        c2.gridy = 0;
                                        panel5.add(new JLabel("Columns:"),c2);//gui label
                                        c2.gridy++;
                                        ArrayList<JCheckBox> buttons = new ArrayList<JCheckBox>();
                                        JCheckBox curr2 = new JCheckBox("All Columns");//gui option for selecting all columns
                                        panel5.add(curr2,c2);
                                        c2.gridy++;

                                        String sql = "SELECT * FROM ";//start off upcoming sql queury
                                        boolean notFirst = false;
                                        String table = "";
                                        for(String r : relations)//adding to querry
                                        {
                                            if(notFirst)
                                            {
                                                table +=" NATURAL JOIN " + r;
                                            }else
                                            {
                                                table += r;
                                                notFirst = true;
                                            }
                                        }
                                        final String table2 = table;// must be final
                                        sql += " " + table2 + ";";// finshing off query
                                        try {
                                            rs = dbc.query(sql, null );//processing query to get all possible column selections for the user
                                            ResultSetMetaData rsmd = rs.getMetaData();//needed to do ^^
                                            int columnsNumber = rsmd.getColumnCount();
                                            for(int i = 1; i <= columnsNumber; i++)
                                            {
                                                String temp = rsmd.getColumnName(i);
                                                String g1 = "";
                                                for(String t : relations)//finding appended character for column
                                                {
                                                    if(t.substring(0,t.length()-2).equals(rsmd.getTableName(i)))
                                                    {
                                                        g1 = t.substring(t.length()-1);
                                                        break;
                                                    }
                                                } 
                                                final String g2 = g1;
                                                String fieldName = g2 + "." + temp;
                                                //gui creation again
                                                JCheckBox curr3 = new JCheckBox(temp);
                                                buttons.add(curr3);
                                                panel5.add(curr3,c2);
                                                c2.gridy++;
                                                createField(rsmd.getColumnType(i), true, c2,fieldName);//helper gui creation method for field boxes
                                                c2.gridy++;
                                                curr3.addActionListener(new ActionListener(){//Column now selected query will be generated based on selected columns
                                                        public void actionPerformed(ActionEvent e)

                                                        {
                                                            //finding proper character for column to pair with the correct relation for query usage.

                                                            if(curr3.isSelected() == true)
                                                            {
                                                                columns.add(fieldName);//appending character for query usage and adding element to cols reference array
                                                            }
                                                            else
                                                            {
                                                                curr2.setSelected(false);//updating All columns checkbox to be deselected
                                                                columns.remove(fieldName);//removing deselected column from reference aray
                                                                if(columns.isEmpty())//removing query output box if no columns are selected.
                                                                {
                                                                    currSql = "";
                                                                    panel4.removeAll();
                                                                    revalidate();
                                                                    repaint();
                                                                    return;
                                                                }
                                                            }
                                                            boolean notFirst1 = false;
                                                            String sql2 = "SELECT ";

                                                            for(String c : columns)//adding columns to  query
                                                            {
                                                                if(notFirst1)
                                                                {
                                                                    sql2 +=", " + c;
                                                                }else
                                                                {
                                                                    sql2 += c;
                                                                    notFirst1 = true;
                                                                }
                                                            }

                                                            sql2 += " FROM " + table2 + ";";
                                                            currSql = sql2;//used for later query creation

                                                        }});

                                            }
                                        }catch (SQLException d) {
                                            d.printStackTrace();
                                        }
                                        curr2.addActionListener(new ActionListener() {//adds action for the case where all columns are selected.
                                                public void actionPerformed(ActionEvent e)

                                                {
                                                    columns.clear();
                                                    if(curr2.isSelected())
                                                    {
                                                        String sql2 = "SELECT * FROM " + table2 + ";";

                                                        try{
                                                            rs = dbc.query(sql2, null );
                                                            ResultSetMetaData rsmd = rs.getMetaData();
                                                            int columnsNumber = rsmd.getColumnCount();
                                                            for(int i = 1; i <= columnsNumber; i++)
                                                            {
                                                                int k = 0;
                                                                while(k < relations.size())
                                                                {
                                                                    if(rsmd.getTableName(i).equals(relations.get(k).substring(0,relations.get(k).length()-2)))
                                                                    {
                                                                        columns.add(((char)(65+k)) + "." + rsmd.getColumnName(i));
                                                                        break;
                                                                    } else
                                                                    {
                                                                        k++;
                                                                    }
                                                                }
                                                                buttons.get(i-1).setSelected(true);//sets button to show as selected
                                                            }

                                                        } catch (SQLException d) {
                                                            d.printStackTrace();
                                                        }

                                                        currSql = sql2;
                                                    }else
                                                    {
                                                        for(JCheckBox b : buttons)
                                                        {
                                                            b.setSelected(false);
                                                        }
                                                        currSql = "";
                                                        panel4.removeAll();
                                                        revalidate();
                                                        repaint();
                                                    }

                                                }});
                                        JButton buttonClear = new JButton("Clear");
                                        buttonClear.addActionListener(new ActionListener() {
                                                public void actionPerformed(ActionEvent e){
                                                    for(HintTextField h : fields)
                                                    {
                                                        h.setText("");
                                                        h.showHint();
                                                    }

                                                }});
                                        JButton buttonSubmit = new JButton("Submit");
                                        buttonSubmit.addActionListener(new ActionListener() {
                                                public void actionPerformed(ActionEvent e){
                                                    String sql3 = constructSql(fields," AND ", " WHERE ", true) + ";";
                                                    if(currSql.indexOf(" WHERE ") != -1)
                                                        currSql = currSql.substring(0,currSql.indexOf(" WHERE ")) + sql3;
                                                    else if(currSql.indexOf(";") != -1)
                                                        currSql = currSql.substring(0,currSql.indexOf(";")) + sql3;

                                                    if(currSql.isEmpty())
                                                    { 
                                                        JOptionPane.showMessageDialog(null, "Error! No columns selected!");
                                                    }
                                                    else if (!sql3.equals("error;")){
                                                        printQuery(currSql);//Excuting sql statement structured from GUI selection.
                                                    }

                                                }});

                                        panel5.add(buttonClear,c2);
                                        c2.gridx++;
                                        panel5.add(buttonSubmit,c2);
                                        pack();
                                        panelForm.add(panel5);
                                        revalidate();
                                        repaint();

                                    }});
                        }
                        else
                        {
                            //panel6.add(new JLabel("Note you can only delete from one table at a time. \nWARNING! If you enter no values into the column's search conditions, all the tuples in a relation will be deleted."));
                            curr.addActionListener(new ActionListener() {  
                                    public void actionPerformed(ActionEvent e) {
                                        if(curr.isSelected() == true)//checks if checkbox was just selcted.
                                        {

                                            if(relations.size() < 1)
                                            {
                                                relations.add(result);// adds relation name to reference array  appended with a character name for query use
                                                columns.clear();//clears columns array as it will need to be updated based on the new relations selected.
                                                fields.clear();
                                                currSql = "";
                                            } else
                                            {
                                                JOptionPane.showMessageDialog(null, "When doing an delete, insert or update you can only select one table.");
                                                curr.setSelected(false);

                                            } 
                                        }
                                        else
                                        {
                                            relations.remove(0);
                                            columns.clear();//clear columns
                                            fields.clear();
                                            currSql = "";
                                            panel5.removeAll();
                                            revalidate();
                                            repaint();
                                            return;
                                        }

                                        if(panel4 != null)
                                        {
                                            panel4.removeAll();
                                        }
                                        if(panel5 != null)
                                        {
                                            panel5.removeAll();
                                        }

                                        try {
                                            GridBagConstraints c2 = new GridBagConstraints();//fpr gui layout
                                            c2.gridx = 0;
                                            c2.gridy = 0;
                                            panel5.add(new JLabel("Columns:"),c2);//gui label
                                            c2.gridy++; 
                                            String sql = "SELECT * FROM " + relations.get(0) + ";";

                                            rs = dbc.query(sql, null );//processing query to get all possible column selections for the user
                                            ResultSetMetaData rsmd = rs.getMetaData();//needed to do ^^                                        
                                            int columnsNumber = rsmd.getColumnCount();                                          
                                            for(int i = 1; i <= columnsNumber; i++) {
                                                String fieldName = rsmd.getColumnName(i);
                                                JLabel curr3 = new JLabel(fieldName);
                                                panel5.add(curr3,c2);
                                                c2.gridy++;
                                                if(actionType.equals("Insert"))
                                                    createField(rsmd.getColumnType(i), false , c2, fieldName);
                                                else
                                                    createField(rsmd.getColumnType(i), true , c2, fieldName);

                                                c2.gridy++;

                                            }

                                            JButton buttonClear = new JButton("Clear");
                                            buttonClear.addActionListener(new ActionListener() {
                                                    public void actionPerformed(ActionEvent e){
                                                        for(HintTextField h : fields)
                                                        {
                                                            h.setText("");
                                                            h.showHint();
                                                        }

                                                    }});
                                            JButton buttonSubmit = new JButton("Submit");
                                            if(actionType.equals("Delete")){

                                                buttonSubmit.addActionListener(new ActionListener() {
                                                        public void actionPerformed(ActionEvent e){
                                                            String sql3 = constructSql(fields," AND ", " WHERE ", true) + ";";
                                                            currSql = "DELETE FROM " + relations.get(0) + ";";
                                                            if(currSql.indexOf(" WHERE ") != -1)
                                                                currSql = currSql.substring(0,currSql.indexOf(" WHERE ")) + sql3;
                                                            else
                                                                currSql = currSql.substring(0,currSql.indexOf(";")) + sql3;

                                                            if(!sql3.equals("error;"))
                                                            {
                                                            int n = JOptionPane.showConfirmDialog(
                                                                    null,
                                                                    "WARNING. You are about to delete tuples from the database. Are you sure you want to preform the current operation?",
                                                                    "WARNING",
                                                                    JOptionPane.YES_NO_OPTION);

                                                            if(n == JOptionPane.YES_OPTION)
                                                            {
                                                                int x = dbc.update(currSql);
                                                                JOptionPane.showMessageDialog(null, "Deletion attempted: " + x + "rows affected");
                                                            }
                                                        }

                                                        }});
                                            }else if (actionType.equals("Insert"))
                                            { 
                                                buttonSubmit.addActionListener(new ActionListener() {
                                                        public void actionPerformed(ActionEvent e){
                                                            String sql3 = constructSql(fields,", ", " Values(", false) + ");";
                                                            currSql = "INSERT INTO " + relations.get(0) + sql3;
                                                            if(!sql3.equals("error);"))
                                                            {
                                                                int x = dbc.update(currSql);
                                                                if(x == 0)
                                                                    JOptionPane.showMessageDialog(null, "The values could not be entered into the database. \n Please make sure your values are correct.");
                                                                else
                                                                    JOptionPane.showMessageDialog(null, "Values entered into database.");

                                                            }

                                                        }});
                                            } else if (actionType.equals("Update"))
                                            { 
                                                buttonSubmit.addActionListener(new ActionListener() {
                                                        public void actionPerformed(ActionEvent e){
                                                            String sql3 = constructSql(fields, " AND ", " WHERE ", true) + ";";
                                                            String valueSet = "";
                                                            if(!sql3.equals("error;"))
                                                            {
                                                                JPanel myPanel = new JPanel();
                                                                JLabel message = new JLabel("Please enter values to update selection to. \n Only Enter values for fields you wish to change.");
                                                                myPanel.add(message);
                                                                ArrayList<HintTextField> tempFields = new ArrayList<HintTextField>();
                                                                try{
                                                                    rs = dbc.query("SELECT * FROM " + relations.get(0) + ";",null);
                                                                    ResultSetMetaData rsmd = rs.getMetaData();                                       
                                                                    int columnsNumber = rsmd.getColumnCount();  
                                                                    for(int i = 1; i <= columnsNumber; i++) {
                                                                        String temp = rsmd.getColumnName(i);
                                                                        myPanel.add(new JLabel(temp));
                                                                        HintTextField field = new HintTextField("Enter Value",rsmd.getColumnType(i), "=");
                                                                        field.setFieldVar(temp);
                                                                        tempFields.add(field);
                                                                        myPanel.add(field);
                                                                        myPanel.add(Box.createHorizontalStrut(15)); 
                                                                    }
                                                                } catch (SQLException d)
                                                                { d.printStackTrace();}

                                                                int result = JOptionPane.showConfirmDialog(null, myPanel, 
                                                                        "Enter Values", JOptionPane.OK_CANCEL_OPTION);
                                                                if (result == JOptionPane.OK_OPTION) {
                                                                    valueSet = constructSql(tempFields,", ","", true);
                                                                    currSql = "UPDATE " + relations.get(0) + " SET " + valueSet + " " + sql3;
                                                                    
                                                                    if(!valueSet.equals("error"))
                                                                    { 
                                                                        int x = dbc.update(currSql);
                                                                    if(x == 0)
                                                                        JOptionPane.showMessageDialog(null, "The tuples could not be updated to those values. \n Please make sure your values are correct.");
                                                                    else
                                                                        JOptionPane.showMessageDialog(null, "Update successful! " + x + " rows affected");
                                                                    } else {
                                                                        JOptionPane.showMessageDialog(null, "Either you didn't enter any value or a value was the incorrect type!");
                                                                        currSql = "";
                                                                    }

                                                                }
                                                            }
                                                            currSql = "";

                                                        }});

                                            }
                                            panel5.add(buttonClear,c2);
                                            c2.gridx++;
                                            panel5.add(buttonSubmit,c2);
                                            pack();
                                            panelForm.add(panel5);
                                            revalidate();
                                            repaint();

                                            //fixing gui
                                        } catch(SQLException d){}
                                    }});
                        }
                    }
                }
                catch (SQLException d) {
                    d.printStackTrace();
                }

                panelForm.add(panel2);
                pack();
                revalidate();
                repaint();
            }else
            {
                relations.clear();
                columns.clear();
                fields.clear();
                panel4.removeAll();
                panel2.removeAll();
                revalidate();
                repaint();
                pack();
                if(!actionType.equals("Show"))
                    actionPerformed(e);

            }

        }

    }
    class HintTextField extends JTextField implements FocusListener {
        private final String hint;
        private int type;
        private boolean showingHint;
        private String qualifer, fieldVar;

        public HintTextField(final String hint, int type, String qualifer) {
            super(hint);
            this.hint = hint;
            this.type = type;
            this.qualifer = qualifer;
            this.showingHint = true;
            super.addFocusListener(this);
        }

        public int getType()
        {
            return type;
        }

        String getQualifer()
        {
            return qualifer;
        }

        public String getFieldVar()
        {
            return fieldVar;
        }

        public void setFieldVar(String temp)
        {
            fieldVar = temp;
        }

        @Override
        public void focusGained(FocusEvent e) {
            if(this.getText().isEmpty()) {
                super.setText("");
                showingHint = false;
            }
        }

        @Override
        public void focusLost(FocusEvent e) {
            if(this.getText().isEmpty()) {
                super.setText(hint);
                showingHint = true;
            }
        }

        public void showHint()
        {
            super.setText(hint);
            showingHint = true;
        }

        @Override
        public String getText() {
            return showingHint ? "" : super.getText();
        }
    }

    private class ButtonCommandActionListener implements ActionListener
    {
        public void actionPerformed(ActionEvent e)

        {
            //resets panels for gui
            relations.clear();
            columns.clear();
            fields.clear();
            if(panel3 != null)
            {
                panel3.removeAll();
            }
            if(panel2 != null)
            {
                panel2.removeAll();
            }
            if(panel5 != null)
            {
                panel5.removeAll();
            }
            if(panel6 != null)
            {
                panel6.removeAll();
            }
            if(panel4 != null)
            {
                panel4.removeAll();
            }
            JTextArea textArea = new JTextArea();//Setting up textbox for entering sql
            textArea.setEditable(true);
            textArea.setLineWrap(true);
            textArea.setWrapStyleWord(true);
            JLabel label  = new JLabel("Enter the SQL Command: ");//prompting sql
            panel3.add(label);
            textArea.setPreferredSize(new Dimension(350, 90));
            JScrollPane scrollPane = new JScrollPane(textArea);
            panel3.add(scrollPane);

            JButton buttonSubmit = new JButton("Submit");
            panel3.add(buttonSubmit);
            revalidate();
            repaint();
            pack();
            buttonSubmit.addActionListener(new ActionListener() { //below will execute when sql code is submitted
                    public void actionPerformed(ActionEvent e) {
                        String sql = textArea.getText();//gets sql queury from textbox
                        //dbc.preparestatement();
                        textArea.setText("");//empties text box used to enter queries
                        printQuery(sql);//calls method for displaying query results
                    } 
                });

        }
    }

}




