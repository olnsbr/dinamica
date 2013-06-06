/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import excecao.BDException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Modulo;

/**
 *
 * @author oddy
 */
public class ModuloDAO {   
    
    private Connection connection;

    public ModuloDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserir(Modulo modulo) throws BDException {
        String sql = "insert into modulo (descricao) values (?)";

        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, modulo.getDescricao());
            instrucao.execute();
        } catch (SQLException e) {
            throw new BDException(e);
        }
    }

    public Modulo consultar(Modulo modulo) throws BDException {
        Modulo moduloResult = null;
        
        String sql = "SELECT * FROM modulo WHERE modulo.codigo = ?";
        
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setLong(1, modulo.getCodigo());
            ResultSet result = instrucao.executeQuery();

            while (result.next()) {

                moduloResult = new Modulo();
                moduloResult.setCodigo(result.getLong("modulo.codigo"));
                moduloResult.setDescricao(result.getString("modulo.descricao"));
            }

            return moduloResult;
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return null;
    }

    public void alterar(Modulo modulo) throws BDException {

        String sql = "UPDATE modulo SET descricao=? WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {

            instrucao.setString(1, modulo.getDescricao());
            instrucao.setLong(2, modulo.getCodigo());

            instrucao.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro" + e.getMessage());
        }
    }

    public void excluir(Modulo modulo) throws BDException {

        String sql = "DELETE FROM modulo WHERE codigo = ?";
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            
            instrucao.setLong(1, modulo.getCodigo());

            instrucao.execute();
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public List<Modulo> pesquisar(Modulo modulo) throws BDException {
        List<Modulo> lista = new ArrayList<>();

        String sql = "SELECT * FROM modulo WHERE descricao like ?";
        
        try (PreparedStatement instrucao = connection.prepareStatement(sql)) {
            instrucao.setString(1, "%" + modulo.getDescricao() + "%");
            ResultSet rs = instrucao.executeQuery();
            

            while (rs.next()) {
                Modulo newModulo = new Modulo();
                newModulo.setCodigo(rs.getLong("modulo.codigo"));
                newModulo.setDescricao(rs.getString("modulo.descricao"));
                lista.add(newModulo);
            }
        } catch (SQLException e) {
            throw new BDException(e);
        }
        return lista;
    }
}
