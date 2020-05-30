/***********
 *
 *  MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
 *
 * download and place on your java classpath:
 * mariadb-java-client-2.2.3.jar
 *
 * Statements:
 * (1) Parse SQL Query
 * (2) Compile SQL Query
 * (3) Plan/optimize data acquisition path
 * (4) Execute query and return result set
 *
 * Prepared Statements:
 * (1) - (3) combined
 * (4) follows
 *
************/

import java.sql.*;
import java.util.Scanner;



class CommunicateWithDBServer {
  public static void main(String[] args) {
    DBConnection dbc = new DBConnection();
    String sql, list[];
    ResultSet rs;

    dbc.openConnection();
    Scanner sc = new Scanner(System.in);
    boolean quit = false, experienced = false;

    while(!quit){
      System.out.println("Are you an experienced SQL user? (Y/n)");
      String choice = sc.nextLine();
      if(choice.equalsIgnoreCase("Y")){
        quit = true; experienced = true;
      } else if(choice.equalsIgnoreCase("n")) {
        quit = true;
      }
    }

    quit = false;
    if(experienced){
      while(!quit){
        System.out.println("\nEnter a syntaxically correct SQL query: (or quit to exit)");
        sql = sc.nextLine();
        if(sql.equalsIgnoreCase("quit")) {
          quit = true; break;
        }
        rs = dbc.query(sql);
        printResults(rs);
      }
    } else{
      while(!quit){
        printTables(dbc);
        System.out.println("\nSelect one table from above: (or quit to exit)");
        String selection = sc.nextLine();
        if(selection.equalsIgnoreCase("quit")) {
          quit = true; break;
        }
        if(!printColumns(dbc, selection)){ continue; }
        System.out.println("\nSelect one or more column(s) from above, (separated by spaces):");
        sql = sc.nextLine();
        String[] cols = sql.trim().split(" ");
        if(cols.length>0){
          sql = "Select " + cols[0];
          for(int i=1; i<cols.length; i++){
            sql += ", " + cols[i];
          }
          sql += " From " + selection;
          rs = dbc.query(sql);
          printResults(rs);
        }
      }
    }

    dbc.closeConnection();
  }

  private static void printResults(ResultSet rs) {
    if(rs == null) return;
    try{
      ResultSetMetaData rsmd = rs.getMetaData();
      int colCt = rsmd.getColumnCount();
      String headerF = "\n";
      String[] colHolder = new String[colCt];
      for(int i=0; i<colCt; i++){
        headerF += "%-20s";
        colHolder[i] = rsmd.getColumnName(i+1);
      }
      System.out.printf(headerF, (Object[])colHolder);

      while(rs.next()){
        for(int i=0; i<colCt; i++){
          colHolder[i] = rs.getString(i+1);
        }
        System.out.printf(headerF, (Object[])colHolder);
      }
      System.out.println();
    } catch(SQLException sqle){
      sqle.printStackTrace();
    }
  }

  private static boolean printColNames(ResultSet rs){
    boolean result = true;
    try{
      ResultSetMetaData rsmd = rs.getMetaData();
      int colCt = rsmd.getColumnCount();
      String headerF = "\n";
      String[] colHolder = new String[colCt];
      for(int i=0; i<colCt; i++){
        headerF += "%s ";
        colHolder[i] = rsmd.getColumnName(i+1);
      }
      System.out.printf(headerF, (Object[])colHolder);
    } catch(SQLException sqle){
      result = false;
      sqle.printStackTrace();
    }
    return result;
  }

  private static void printTables(DBConnection dbc){
    ResultSet rs = dbc.query("Show Tables;");
    printResults(rs);
  }

  private static boolean printColumns(DBConnection dbc, String table){
    String sql = "SELECT * FROM " + table + " LIMIT 1";
    ResultSet rs = dbc.query(sql);
    return printColNames(rs);
  }
}
