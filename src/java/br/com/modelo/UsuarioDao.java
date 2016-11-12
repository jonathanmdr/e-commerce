/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.modelo;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Rhuan
 */
public class UsuarioDao extends Dao<Usuario> {

    public UsuarioDao(Connection conexao) {
        super(conexao);
    }

    @Override
    public void inserir(Usuario objeto) throws SQLException {
        String sql = " INSERT INTO user (username, password) "
                + " VALUES (?, ?) ";

        executaSql(sql,
                objeto.getUsername(),
                objeto.getPassword());
    }

    @Override
    public void remover(Usuario objeto) throws SQLException {
        String sql = " DELETE FROM user WHERE id = ? ";

        executaSql(sql, objeto.getId());
    }

    @Override
    public void atualizar(Usuario objeto) throws SQLException {
        String sql = " UPDATE user SET username = ?, password = ? "
                + " WHERE id = ? ";

        executaSql(sql,
                objeto.getUsername(),
                objeto.getPassword(),
                objeto.getId());
    }

//    public void atualizarImagem(Usuario usuario, Imagem imagem) throws SQLException {
//        String sql = " UPDATE usuario SET id_imagem = ? WHERE id = ? ";
//        executaSql(sql,
//                imagem.getId(),
//                usuario.getId());
//    }

    @Override
    public Usuario montaObjeto(ResultSet resultado) throws SQLException {
        Usuario u = new Usuario();

        u.setId(resultado.getInt("id"));
        u.setUsername(resultado.getString("username"));
        u.setPassword(resultado.getString("password"));

        return u;
    }

    public Usuario consultaLoginSenha(String username, String password) throws SQLException {
        String sql = " SELECT * FROM user WHERE username = ? AND password = ?";

        List<Usuario> usuarios = consultaSql(sql, username, password);

        // se a lista está vazia, então retorna nulo
        if (usuarios.isEmpty()) {
            return null;
        }
        // se existem objetos na lista, então retorna o primeiro
        return usuarios.get(0);
    }

    public Usuario consultaId(int... ids) throws SQLException {
        String sql = "SELECT * FROM user WHERE id = ?";

        List<Usuario> usuarios = consultaSql(sql, ids[0]);

        if (usuarios.isEmpty()) {
            return null;
        }

        return usuarios.get(0);
    }
}

