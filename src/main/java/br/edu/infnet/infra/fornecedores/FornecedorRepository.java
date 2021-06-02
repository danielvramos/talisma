package br.edu.infnet.infra.fornecedores;

import br.edu.infnet.domain.fornecedores.Fornecedor;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@EnableTransactionManagement
@Repository
public class FornecedorRepository {

    @PersistenceContext
    private EntityManager em;

    public List<Fornecedor> listar() {

        return em.
                createNamedQuery("Fornecedor.findAll")
                .getResultList();
    }

    public List<Fornecedor> obter(int id) {

        return em.
                createNamedQuery("Fornecedor.findById").
                setParameter("id", id).getResultList();
    }

    @Transactional
    public void inserir(Fornecedor fornecedor) {

        em.persist(fornecedor);
        
    }
    @Transactional
    public void excluir(Fornecedor fornecedor) {
        em.remove(em.
                createNamedQuery("Fornecedor.findById").
                setParameter("id", fornecedor.getId()).getSingleResult());
        
    }
    @Transactional
    public void atualizar(Fornecedor fornecedor) {

        em.merge(fornecedor);
        
    }
}
