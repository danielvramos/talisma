package br.edu.infnet.infra.fornecedores;

import br.edu.infnet.domain.fornecedores.Contato;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@EnableTransactionManagement
@Repository
public class ContatoRepository {
    
    @PersistenceContext
    private EntityManager em;
    
    public List<Contato> listar() {
        
        return em
                .createNamedQuery("Contato.findAll")
                .getResultList();
    }
    
    @Transactional
    public void inserir(Contato contato) {
        em.persist(contato);
    }
    
    @Transactional
    public void atualizar(Contato contato) {
        em.merge(contato);
    }
    
    @Transactional
    public void excluir(Contato contato) {
        em.remove(em.
                createNamedQuery("Contato.findById").
                setParameter("id", contato.getId()).getSingleResult());
    }
    
    public List<Contato> obter(int id) {

        return em.
                createNamedQuery("Contato.findById").
                setParameter("id", id).getResultList();
    }
}
