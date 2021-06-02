package br.edu.infnet.app.produtos;

import br.edu.infnet.domain.produtos.Produto;
import br.edu.infnet.infra.fornecedores.FornecedorRepository;
import br.edu.infnet.infra.produtos.ProdutoRepository;
import static java.lang.Integer.parseInt;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProdutoController {

    @Autowired
    private ProdutoRepository pr;

    @Autowired
    private FornecedorRepository fr;

    @RequestMapping(value = "/produto/carregarProdutos", method = RequestMethod.POST)
    public ModelAndView listarPorFornecedor(@RequestParam String idFornecedor) {

        ModelAndView retorno = new ModelAndView("produto/tabelaProdutos");
        List<Produto> listaDeProdutos = pr.listarPorFornecedor(parseInt(idFornecedor));
        if (listaDeProdutos != null && !listaDeProdutos.isEmpty()) {
            retorno.addObject("produtos", listaDeProdutos);
        } else {
            retorno.addObject("mensagem", "Sem produtos para exibir");

        }
        return retorno;
    }

    @RequestMapping(value = "/produto/editar", method = RequestMethod.GET)
    public ModelAndView editarFornecedor(int id) {

        ModelAndView retorno = new ModelAndView("produto/formulario");
        List<Produto> ListaProduto = pr.obter(id);
        if (ListaProduto != null && !ListaProduto.isEmpty()) {
            retorno.addObject("produto", ListaProduto.get(0));
        }

        return retorno;
    }

    @RequestMapping(value = "/produto/salvar", method = RequestMethod.POST)
    
    public ModelAndView salvarProduto(Produto produto) {

        ModelAndView retorno = new ModelAndView("produto/tabelaProdutos");
        //List<Produto> listaDeProdutos = pr.listarPorFornecedor(parseInt(idFornecedor));
        //if (listaDeProdutos != null && !listaDeProdutos.isEmpty()) {
        //    retorno.addObject("produtos", listaDeProdutos);
        //} else {
        //   retorno.addObject("mensagem", "Sem produtos para exibir");

        //}
        return retorno;
    }
}
