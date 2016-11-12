package br.com.app;

import br.com.conexao.ConnectionMySQL;
import br.com.modelo.Produto;
import java.util.ArrayList;

/**
 *
 * @author jonat_000
 */
public class ListProdutos extends ConnectionMySQL {

    public static ArrayList<Produto> produtos = new ArrayList<Produto>();
    
public void retorna(){        
    runSQL("SELECT * FROM produto");
    
    try {        
    while (resultSet.next()) {
        Produto produto = new Produto();
        
        produto.setId(resultSet.getInt("id"));
        produto.setDescricao(resultSet.getString("descricao"));
        produto.setInformacao(resultSet.getString("informacao"));
        produto.setQuantidade(resultSet.getInt("qtde"));
        produto.setValor(resultSet.getDouble("valor"));
        
        produtos.add(produto);
    }
    } catch (Exception e) {
    }    
}
    
    
    
}
