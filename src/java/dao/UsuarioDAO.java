package dao;

import excecao.BDException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Grupo;
import modelo.Usuario;

public class UsuarioDAO {

    private Connection connection;

    public UsuarioDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserir(Usuario usuario) throws BDException {
        String sql = "insert into usuario (nome,email,telefone,senha,codgrupo) values (?,?,?,?,?)";

        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, usuario.getNome());
            instrucao.setString(2, usuario.getEmail());
            instrucao.setString(3, usuario.getTelefone());
            instrucao.setString(4, usuario.getSenha());
            instrucao.setLong(5, usuario.getGrupo().getCodigo());
            instrucao.execute();
        } catch (SQLException e) {
            throw new BDException(e);
        }
    }

    public Usuario consultar(Usuario usuario) throws BDException {
        Usuario usuarioResult = null;
        Grupo grupoResult = null;
        String sql = "SELECT * FROM usuario inner join grupo on usuario.codgrupo = grupo.codigo WHERE usuario.codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setLong(1, usuario.getCodigo());
            ResultSet result = instrucao.executeQuery();

            while (result.next()) {
                usuarioResult = new Usuario();
                grupoResult = new Grupo();
                usuarioResult.setGrupo(grupoResult);
                usuarioResult.setCodigo(result.getLong("usuario.codigo"));
                usuarioResult.setNome(result.getString("usuario.nome"));
                usuarioResult.setTelefone(result.getString("usuario.telefone"));
                usuarioResult.setEmail(result.getString("usuario.email"));
                usuarioResult.setSenha(result.getString("usuario.senha"));
                usuarioResult.getGrupo().setCodigo(result.getLong("grupo.codigo"));
                usuarioResult.getGrupo().setNome(result.getString("grupo.nome"));
            }

            return usuarioResult;
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return null;
    }

    public void alterar(Usuario usuario) throws BDException {

        String sql = "UPDATE usuario SET nome=?,email=?,telefone=?,senha=?, codgrupo=? WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {

            instrucao.setString(1, usuario.getNome());
            instrucao.setString(2, usuario.getEmail());
            instrucao.setString(3, usuario.getTelefone());
            instrucao.setString(4, usuario.getSenha());
            instrucao.setLong(5, usuario.getGrupo().getCodigo());
            instrucao.setLong(6, usuario.getCodigo());

            instrucao.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro" + e.getMessage());
        }
    }

    public void excluir(Usuario usuario) throws BDException {

        String sql = "DELETE FROM usuario WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {

            instrucao.setLong(1, usuario.getCodigo());

            instrucao.execute();
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public List<Usuario> pesquisar(Usuario usuario) throws BDException {
        List<Usuario> lista = new ArrayList<>();

        String sql = "SELECT * FROM usuario inner join grupo on usuario.codgrupo = grupo.codigo WHERE usuario.nome like ?";
        
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, "%" + usuario.getNome() + "%");
            ResultSet rs = instrucao.executeQuery();                       

            while (rs.next()) {
                Usuario newUsuario = new Usuario();
                Grupo newGrupo = new Grupo();
                newUsuario.setGrupo(newGrupo);
            
                newUsuario.setCodigo(rs.getLong("usuario.codigo"));
                newUsuario.setNome(rs.getString("usuario.nome"));
                newUsuario.setTelefone(rs.getString("usuario.telefone"));
                newUsuario.setEmail(rs.getString("usuario.email"));
                newUsuario.setSenha(rs.getString("usuario.senha"));
                newUsuario.getGrupo().setCodigo(rs.getLong("grupo.codigo"));
                newUsuario.getGrupo().setNome(rs.getString("grupo.nome"));
                lista.add(newUsuario);
            }
        } catch (SQLException e) {
            throw new BDException(e);
        }
        return lista;
    }
}
