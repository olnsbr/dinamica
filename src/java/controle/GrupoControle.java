/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.GrupoDAO;
import excecao.BDException;
import excecao.ConexaoException;
import java.util.ArrayList;
import java.util.List;
import modelo.Grupo;
import util.ControlaConexao;

/**
 *
 * @author Fran
 */
public final class GrupoControle {
    private Grupo grupo = new Grupo("");
    
    private  List<Grupo> grupos = new ArrayList<>();

    public GrupoControle() throws ConexaoException, BDException {        
        listar();        
    }

    public Grupo getGrupo() {
        return this.grupo;
    }

    public List<Grupo> getGrupos() {
        return this.grupos;
    }    

    public void setGrupo(Grupo grupo) throws ConexaoException, BDException {
        this.grupo = grupo;
    }
    
    public void listar() throws ConexaoException, BDException{        
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        
        GrupoDAO grupoDAO = new GrupoDAO(controlaConexao.getConexao());
        
        this.grupos = grupoDAO.pesquisar(this.grupo);
    }
}
