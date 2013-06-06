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
public class TestaUsuario {
    
    public static void main(String[] args) throws ConexaoException, BDException {
        
        ControlaConexao controlaConexao = new ControlaConexao("config.txt");
        
        Usuario user = new Usuario();
        
        user.setNome("Fulano");
        user.setEmail("me@mine.com");
        user.setSenha("nenhuma");
        user.setTelefone("666777");
        
        Grupo g = new Grupo();
        
        g.setNome("Admins");
        
        user.setGrupo(g);
        
        UsuarioDAO uDAO = new UsuarioDAO(controlaConexao.getConexao());
        
        List<Usuario> lista = new ArrayList<>();
        
        lista = uDAO.pesquisar(new Usuario(""));
        
        for (Usuario usuario : lista) {
            
            System.out.println(usuario.getCodigo());
            System.out.println(usuario.getNome());
            System.out.println(usuario.getEmail());
            System.out.println(usuario.getTelefone());
            System.out.println(usuario.getSenha());
            
        }
        
        user.setCodigo(2L);
        Usuario uConsult = uDAO.consultar(user);
        
        System.out.println(uConsult.getCodigo());
        System.out.println(uConsult.getNome());
        System.out.println(uConsult.getEmail());
        System.out.println(uConsult.getTelefone());
        System.out.println(uConsult.getSenha());
        
//        user.setCodigo(1L);
//        uDAO.excluir(user);        
    }    
}
