package excecao;

public class BDException extends Exception{
    
     public BDException() {
    }

    public BDException(String string) {
        super(string);
    }

    public BDException(Throwable thrwbl) {
        super(thrwbl);
    }

    public BDException(String string, Throwable thrwbl) {
        super(string, thrwbl);
    }
    
}
