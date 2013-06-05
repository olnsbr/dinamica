/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.UsuarioDAO;
import excecao.BDException;
import excecao.ConexaoException;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;
import util.ControlaConexao;

/**
 *
 * @author Fran
 */
public class UsuarioControle {
    private Usuario usuario = new Usuario("");
    
    private  List<Usuario> usuarios = new ArrayList<>();

    public UsuarioControle() throws ConexaoException, BDException {        
        pesquisar();        
    }

    public Usuario getUsuario() {
        return this.usuario;
    }

    public List<Usuario> getUsuarios() {
        return this.usuarios;
    }    

    public void setUsuario(Usuario usuario) throws ConexaoException, BDException {
        this.usuario = usuario;
    }
    
    public void pesquisar() throws ConexaoException, BDException{        
        ControlaConexao controlaConexao = new ControlaConexao("C:/Users/Fran/Documents/NetBeansProjects/Dinamica1/config.txt");
    
        UsuarioDAO usuarioDAO = new UsuarioDAO(controlaConexao.getConexao());
        
        this.usuarios = usuarioDAO.pesquisar(usuario);        
    }    
}
