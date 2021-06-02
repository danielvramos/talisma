package br.edu.infnet.infra.produtos;

import br.edu.infnet.domain.produtos.Produto;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@Repository
public class ProdutoRepository {
    
    @PersistenceContext
    private EntityManager em;
    
    public List<Produto> listarPorFornecedor(int idFornecedor){
    
        return em.createNamedQuery("Produto.findByFornecedorId")
                //createNativeQuery("SELECT p.id,p.nome,p.categoria,p.valor,p.dataValidade FROM cotacaoprodutos p, cotacaofornecedores f WHERE p.id=f.idProduto AND f.idFornecedor= ?1", Produto.class)
                //createQuery("FROM Produto")
                .setParameter("idForn",idFornecedor)//setParameter//("idForn",idFornecedor )
                .getResultList();
}

    public List<Produto> obter(int id) {
        return em.
                createNamedQuery("Produto.findById").
                setParameter("id", id).getResultList();
    }
}
