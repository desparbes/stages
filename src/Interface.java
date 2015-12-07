import java.sql.*;
import java.util.*;
import java.io.IOException;
import oracle.jdbc.pool.OracleDataSource;

public class Interface {
    static private Statement stmt;
    static private Connection conn;
    static private int displayWidth;

    static private void querySQLFile(String fileName) {
	fileName = "../queries/" + fileName;
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
	fileName = "../update/" + fileName;
	Parser p = new Parser();
	try {
	    String[] queries = p.parseSQLFile(fileName);
	    for (int i = 0; i < queries.length; i++) {
		stmt.executeUpdate(queries[i]);
	    }
	    System.out.println("Update " + fileName + " successfully executed");
	} catch (Exception e) {
	    e.printStackTrace();
	}
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
		System.out.println("\nMAIN MENU\n" + 
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
		else if ("4".equals(choice))
		    updateSQLFile("data.sql");
		else if ("5".equals(choice)) {
		    try {
			System.out.println("Choose the width of columns:");
			Scanner width = new Scanner(System.in);
			int tmp = width.nextInt();
			displayWidth = tmp;
		    } catch (InputMismatchException e) {
			System.out.println("Invalid width");
		    }
		} else if ("6".equals(choice)) {
		    try {
			System.out.println("Enter the name of the SQL file you want to execute:");
			choice = sc.nextLine();
			querySQLFile(choice);
		    } catch (InputMismatchException e) {
			System.out.println("Invalid file name");
		    }
		} else if ("7".equals(choice))
		    stop = true;
		else
		    System.out.println("Invalid argument");
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
