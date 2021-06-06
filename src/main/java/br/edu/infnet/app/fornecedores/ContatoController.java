package br.edu.infnet.app.fornecedores;

import br.edu.infnet.domain.fornecedores.Contato;
import br.edu.infnet.domain.fornecedores.Fornecedor;
import br.edu.infnet.infra.fornecedores.ContatoRepository;
import br.edu.infnet.infra.fornecedores.FornecedorRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContatoController {

    @Autowired
    private ContatoRepository cr;

    @Autowired
    private FornecedorRepository fr;

    @RequestMapping("/contato/listar")
    public ModelAndView listarContatos() {

        ModelAndView retorno = new ModelAndView("contato/index");
        List<Contato> contatos = cr.listar();
        if (contatos != null && !contatos.isEmpty()) {

            retorno.addObject("contatos", contatos);
        } else {

            retorno.addObject("mensagem", "Não há registros para exibir");
        }
        //----------------------------------------------------------------------
        List<Fornecedor> fornecedores = fr.listar();
        if (fornecedores != null && !fornecedores.isEmpty()) {

            retorno.addObject("fornecedores", fornecedores);
        }
        return retorno;
    }

    @RequestMapping("/contato/salvar")
    public ModelAndView salvarContato(Contato contato, Integer fornId) {

        ModelAndView retorno = new ModelAndView("contato/index");

        //------------------------------------------------------------------
        //O certo é obterComContatos - use o FETCH
        Fornecedor fornecedor = fr.obter(fornId).get(0);
        ArrayList<Contato> contatos = new ArrayList<>();
        //------------------------------------------------------------------
        contatos.add(contato);
        fornecedor.setContatos(contatos);
        contato.setFornecedor(fornecedor);

        if (contato.getId() == null) {
            cr.inserir(contato);
        } else {
            cr.atualizar(contato);
        }

        retorno.addObject("contato", null);
        retorno.addObject("contatos", cr.listar());
        return retorno;
    }

    @RequestMapping("/contato/editar")
    public ModelAndView editarContato(int id) {

        ModelAndView retorno = new ModelAndView("contato/index");
        Contato contato = cr.obter(id).get(0);

        retorno.addObject("contato", contato);
        return retorno;
    }

    @RequestMapping("/contato/excluir")
    public ModelAndView excluirContato(int id) {

        ModelAndView retorno = new ModelAndView("contato/index");
        
        Contato contato = cr.obter(id).get(0);
        cr.excluir(contato);
        
        retorno.addObject("contato", null);
        retorno.addObject("contatos", cr.listar());
        return retorno;
    }

}
