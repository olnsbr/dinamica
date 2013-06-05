package util;

import excecao.ConexaoException;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ControlaConexao {
    
    private String arquivo;
    private String url;
    private String user;
    private String driver;
    private String password;

    private void configurar() throws ConexaoException{

        try (FileInputStream inputStream = new FileInputStream(arquivo);) {

            Properties config = new Properties();
            config.load(inputStream);
           
            setPassword(config.getProperty("password"));
            setDriver(config.getProperty("driver"));
            setUrl(config.getProperty("url"));
            setUser(config.getProperty("user"));
            
        } catch(IOException e) {
            throw new ConexaoException(e);
        }
   }

    public ControlaConexao() {
    }    

    public ControlaConexao(String arquivo) throws ConexaoException {
       this.arquivo = arquivo;
       configurar();
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public Connection getConexao() throws ConexaoException {
        try  {

            Class.forName(driver);
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw new ConexaoException(e);
        } catch (SQLException e) {
            throw new ConexaoException(e);

        }
    }    
}
