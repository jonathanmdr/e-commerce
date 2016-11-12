package br.com.modelo;

import br.com.conexao.ConnectionMySQL;
import br.com.conexao.Mysql;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author jonat_000
 */
public class ProdutoDao extends Dao<Produto>{

    public ProdutoDao(java.sql.Connection conexao) {
        super(conexao);
    }
  
    @Override
    public void inserir(Produto objeto) throws SQLException {
        String sql = " INSERT INTO produto (descricao, informacao, qtde, valor) "
                + " VALUES (?, ?, ?, ?) ";

        executaSql(sql,
                objeto.getDescricao(),
                objeto.getInformacao(),
                objeto.getQuantidade(),
                objeto.getValor());
    }

    @Override
    public void remover(Produto objeto) throws SQLException {
        String sql = " DELETE FROM produto WHERE id = ? ";

        executaSql(sql, objeto.getId());
    }

    @Override
    public void atualizar(Produto objeto) throws SQLException {
        String sql = " UPDATE produto SET descricao = ?, informacao = ? , qtde = ?, valor = ?"
                + " WHERE id = ? ";

        executaSql(sql,
                objeto.getDescricao(),
                objeto.getInformacao(),
                objeto.getQuantidade(),
                objeto.getValor(),
                objeto.getId());
    }

    @Override
    public Produto consultaId(int... ids) throws SQLException {
        String sql = "SELECT * FROM produto WHERE id = ?";

        List<Produto> produtos = consultaSql(sql, ids[0]);

        if (produtos.isEmpty()) {
            return null;
        }

        return produtos.get(0);
    }
    
    public Produto consultaGeral() throws SQLException {
        String sql = " SELECT * FROM PRODUTO";
        ConnectionMySQL conn = ConnectionMySQL.connection;
        conn.runSQL(sql);
        Produto prod = (Produto) conn.resultSet;
        List<Produto> produtos = (List<Produto>) prod;

        if (produtos.isEmpty()) {
            return null;
        }

        return produtos.get(0);
    }

    @Override
    public Produto montaObjeto(ResultSet resultado) throws SQLException {
        Produto p = new Produto();

        p.setId(resultado.getInt("id"));
        p.setDescricao(resultado.getString("descricao"));
        p.setInformacao(resultado.getString("informacao"));
        p.setQuantidade(resultado.getInt("qtde"));
        p.setValor(resultado.getDouble("valor"));

        return p;
    }
    
}
