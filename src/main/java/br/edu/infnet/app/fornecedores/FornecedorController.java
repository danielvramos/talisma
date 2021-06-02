package br.edu.infnet.app.fornecedores;

import br.edu.infnet.domain.fornecedores.Fornecedor;
import br.edu.infnet.infra.fornecedores.FornecedorRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FornecedorController {

    @Autowired
    private FornecedorRepository fr;

    @RequestMapping("/produto/listar_fornecedor")
    public ModelAndView listarFornecedor() {

        ModelAndView retorno = new ModelAndView("produto/index");
        List<Fornecedor> listaDeFornecedor = fr.listar();
        if (listaDeFornecedor != null && !listaDeFornecedor.isEmpty()) {
            retorno.addObject("fornecedores", listaDeFornecedor);
        } else {
            retorno.addObject("mensagem", "Sem fornecedores para exibir");
        }
        return retorno;
    }

    @RequestMapping("/fornecedor/listar")
    public ModelAndView listar() {

        ModelAndView retorno = new ModelAndView("fornecedor/index");
        List<Fornecedor> listaDeFornecedor = fr.listar();
        if (listaDeFornecedor != null && !listaDeFornecedor.isEmpty()) {
            retorno.addObject("fornecedores", listaDeFornecedor);
        } else {
            retorno.addObject("mensagem", "Sem fornecedores para exibir");
        }
        return retorno;
    }

    @RequestMapping("/fornecedor/editar")
    public ModelAndView editarFornecedor(int id) {

        ModelAndView retorno = new ModelAndView("fornecedor/index");
        Fornecedor forn = fr.obter(id).get(0);
        retorno.addObject("fornecedor", forn);
        return retorno;
    }

    @RequestMapping("/fornecedor/salvar")
    public ModelAndView salvarFornecedor(Fornecedor fornecedor) {

        ModelAndView retorno = new ModelAndView("fornecedor/index");
        if (fornecedor.getId() == null) {

            fr.inserir(fornecedor);
        } else {
            fr.atualizar(fornecedor);
        }
        retorno.addObject("fornecedor", null);
        retorno.addObject("fornecedores", fr.listar());
        return retorno;
    }

    @RequestMapping("/fornecedor/excluir")
    public ModelAndView excluirFornecedor(int id) {

        ModelAndView retorno = new ModelAndView("fornecedor/index");
        Fornecedor forn = fr.obter(id).get(0);
        fr.excluir(forn);
        retorno.addObject("fornecedor", null);
        retorno.addObject("fornecedores", fr.listar());
        return retorno;
    }
}
