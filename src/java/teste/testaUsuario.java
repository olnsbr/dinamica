/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import dao.UsuarioDAO;
import excecao.BDException;
import excecao.ConexaoException;
import java.util.ArrayList;
import java.util.List;
import modelo.Grupo;
import modelo.Usuario;
import util.ControlaConexao;

/**
 *
 * @author oddy
 */
public class testaUsuario {
    
    public static void main(String[] args) throws ConexaoException, BDException {
        
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        
        Usuario user = new Usuario();
        
        UsuarioDAO uDAO = new UsuarioDAO(controlaConexao.getConexao());
        List<Usuario> lista = new ArrayList<>();
        
        lista = uDAO.pesquisar(new Usuario(""));
        
        for (Usuario usuario : lista) {
            
            if (usuario.getCodigo() == 7) {
                
                usuario.setEmail("zinho");
                
                user = usuario;
                
            }
            
        }
        
        System.out.println(user.getNome());
        System.out.println(user.getEmail());
        System.out.println(user.getTelefone());
        System.out.println(user.getGrupo().getNome());
        
        uDAO.alterar(user);
        
    }
    
}
