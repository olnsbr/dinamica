package excecao;

public class ConexaoException extends Exception{
    
    public ConexaoException() {
    }

    public ConexaoException(String string) {
        super(string);
    }

    public ConexaoException(Throwable thrwbl) {
        super(thrwbl);
    }

    public ConexaoException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
    
}
