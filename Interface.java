import java.sql.*;
import java.util.*;
import java.io.IOException;
import oracle.jdbc.pool.OracleDataSource;

public class Interface {
    static private Statement stmt;
    static private Connection conn;
    static private int displayWidth;
//    private enum Action {ADD, UPDATE, REMOVE;}

    static private void querySQLFile(String fileName) {
	Parser p = new Parser();
	Display d = new Display();
	try {
	    String[] queries = p.parseSQLFile(fileName);
	    for (int i = 0; i < queries.length; i++) {
		ResultSet result = stmt.executeQuery(queries[i]);
		d.displayQueryResult(result, displayWidth);
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    static private void updateSQLFile(String fileName) {
	Parser p = new Parser();
	try {
	    String[] queries = p.parseSQLFile(fileName);
	    for (int i = 0; i < queries.length; i++) {
		stmt.executeUpdate(queries[i]);
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }
/*
    static void manageCompany(int arg) {
	switch (arg) {
	case ADD:
	    askAttibutes(
	    break:
    }
*/
    static private void manageTables(int arg) {
/*	boolean stop = false;
	while (!stop) {
	    System.out.println("1: Company\n" +
			       "2: Internship\n" +
			       "3: Sector\n" +
			       "4: Employee\n" +
			       "5: Student\n"
			       "6: Tutor\n" +
			       "7: Exit\n");
	    String choice = sc.nextLine();

	    if ("1".equals(choice))
		manageCompany(arg);
	    else if ("2".equals(choice))
		manageInternship(arg);
	    else if ("3".equals(choice))
		manageSector(arg);
	    else if ("4".equals(choice))
		manageEmployee(arg);
	    else if ("5".equals(choice))
		manageStudent(arg);
	    else if ("6".equals(choice))
		manageTutor(arg);
	    else if ("7".equals(choice))
		stop = true;
	    else
		System.out.println("Invalid argument\n");
		}
*/
    }

    public static void main(String[] args)
	throws SQLException, ClassNotFoundException, java.io.IOException {
	// Preparation de la connexion.
	OracleDataSource ods = new OracleDataSource();
	ods.setUser("desparbes");
	ods.setPassword("desparbes");
	// URL de connexion, on remarque que le pilote utilise est "thin".
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");

	conn = null;
	stmt = null;
	try {
	    conn = ods.getConnection();
	    stmt = conn.createStatement();
	    boolean stop = false;
	    Scanner sc = new Scanner(System.in);
	    String choice = "";
	    displayWidth = 13;

	    while (!stop) {
		System.out.println("MAIN MENU\n" + 
				   "1: Initialize tables\n" +
				   "2: Delete tables\n" +
				   "3: Clean tables\n" +
				   "4: Add example data\n" +
				   "5: Set display width\n" +
				   "6: Execute query\n" +
				   "7: Quit");
		choice = sc.nextLine();

		if ("1".equals(choice))
		    updateSQLFile("tables.sql");
		else if ("2".equals(choice))
		    updateSQLFile("reset_tables.sql");
		else if ("3".equals(choice))
		    updateSQLFile("reset_data.sql");
/*		else if ("4".equals(choice))
		    manageTables(ADD);
		else if ("5".equals(choice))
		    manageTables(UPDATE);
		else if ("6".equals(choice))
		manageTables(REMOVE);*/
		else if ("4".equals(choice))
		    updateSQLFile("data.sql");
		else if ("5".equals(choice)) {
		    try {
			System.out.println("Choose the width of columns:");
			Scanner width = new Scanner(System.in);
			int tmp = width.nextInt();
			displayWidth = tmp;
		    } catch (InputMismatchException e) {
			System.out.println("Invalid width\n");
		    }
		} else if ("6".equals(choice)) {
		    try {
			System.out.println("Enter the name of the SQL file you want to execute:");
			choice = sc.nextLine();
			querySQLFile(choice);
		    } catch (InputMismatchException e) {
			System.out.println("Invalid file name\n");
		    }
		} else if ("7".equals(choice))
		    stop = true;
		else
		    System.out.println("Invalid argument\n");
	    }
	    stmt.close();
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    if (stmt != null) {
		stmt.close();
	    }
	    if (conn != null) {
		conn.close();
	    }
	}
	
    }
}
