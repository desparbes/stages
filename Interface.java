import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;

public class Interface {
    public static void main(String[] args)
	throws SQLException, ClassNotFoundException, java.io.IOException {
	// Preparation de la connexion.
	OracleDataSource ods = new OracleDataSource();
	ods.setUser("desparbes");
	ods.setPassword("desparbes");
	// URL de connexion, on remarque que le pilote utilise est "thin".
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");

	Connection conn = null;
	Statement stmt = null;
	try {
	    conn = ods.getConnection();
	    stmt = conn.createStatement();
	    
	    Parser p = new Parser();
	    for (int i = 0; i < args.length; i++)
		p.parseSQLFile(args[i], stmt);

	    /*
	    // Execution de la requete.
	    ResultSet rset = stmt.executeQuery("select * from SECTEUR");
	    
	    while (rset.next()) {
		// Affichage du resultat.
		System.out.println(rset.getString(1));
	    }*/
	}
	finally {
	    if (stmt != null) {
		stmt.close();
	    }
	    if (conn != null) {
		conn.close();
	    }
	}
	
    }
}
